import 'dart:async';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class AudioPlayerWidget extends StatefulWidget {
  final String audioUrl;
  final bool isSentByMe;

  const AudioPlayerWidget({
    super.key,
    required this.audioUrl,
    this.isSentByMe = false,
  });

  @override
  State<AudioPlayerWidget> createState() => _AudioPlayerWidgetState();
}

class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
  late AudioPlayer _audioPlayer;
  Duration _currentDuration = Duration.zero;
  Duration _totalDuration = Duration.zero;
  bool _isPlaying = false;
  bool _isLoading = true;
  bool _hasError = false;
  String? _localFilePath;

  StreamSubscription? _positionSubscription;
  StreamSubscription? _durationSubscription;
  StreamSubscription? _playerStateSubscription;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer()
      ..setReleaseMode(ReleaseMode.stop)
      ..setPlayerMode(PlayerMode.lowLatency);
    _initPlayer();
  }

  Future<void> _initPlayer() async {
    try {
      final localFile = await _downloadFile(widget.audioUrl);
      if (localFile == null) throw Exception('Download failed');

      _localFilePath = localFile.path;

      // ✅ Use file:// URI for iOS and Android
      await _audioPlayer.setSourceUrl('file://${_localFilePath!}');

      // Listen to position updates
      _positionSubscription = _audioPlayer.onPositionChanged.listen((position) {
        if (mounted) {
          setState(() => _currentDuration = position);
        }
      });

      // Listen for duration if available
      _durationSubscription = _audioPlayer.onDurationChanged.listen((duration) {
        if (mounted && duration > Duration.zero) {
          setState(() {
            _totalDuration = duration;
            _isLoading = false;
          });
        }
      });

      // ✅ Manually stop loader after a short delay if duration not detected
      Future.delayed(const Duration(seconds: 1), () {
        if (mounted && _isLoading) {
          setState(() => _isLoading = false);
        }
      });

      // Listen to playback state
      _playerStateSubscription = _audioPlayer.onPlayerStateChanged.listen((
        state,
      ) {
        if (!mounted) return;
        setState(() => _isPlaying = state == PlayerState.playing);
        if (state == PlayerState.completed) {
          _audioPlayer.seek(Duration.zero);
          setState(() => _currentDuration = Duration.zero);
        }
      });
    } catch (e) {
      debugPrint('Error initializing player: $e');
      if (mounted) {
        setState(() {
          _hasError = true;
          _isLoading = false;
        });
      }
    }
  }

  Future<File?> _downloadFile(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final tempDir = await getTemporaryDirectory();
        final file = File('${tempDir.path}/temp_audio.wav');
        await file.writeAsBytes(response.bodyBytes);
        return file;
      }
      debugPrint('Download failed: ${response.statusCode}');
      return null;
    } catch (e) {
      debugPrint('Download error: $e');
      return null;
    }
  }

  @override
  void dispose() {
    _positionSubscription?.cancel();
    _durationSubscription?.cancel();
    _playerStateSubscription?.cancel();
    _audioPlayer.dispose();
    super.dispose();
  }

  String _formatDuration(Duration d) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    return '${twoDigits(d.inMinutes.remainder(60))}:${twoDigits(d.inSeconds.remainder(60))}';
  }

  Future<void> _togglePlayPause() async {
    try {
      if (_isPlaying) {
        await _audioPlayer.pause();
      } else {
        await _audioPlayer.resume();
      }
    } catch (e) {
      debugPrint('Toggle play error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_hasError) return _errorWidget();

    final bg = widget.isSentByMe ? const Color(0xFFDCF8C6) : Colors.white;
    final progress = _totalDuration.inMilliseconds > 0
        ? _currentDuration.inMilliseconds / _totalDuration.inMilliseconds
        : 0.0;

    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: widget.isSentByMe
                    ? const Color(0xFF128C7E)
                    : const Color(0xFF075E54),
                shape: BoxShape.circle,
              ),
              child: _isLoading
                  ? const Padding(
                      padding: EdgeInsets.all(10),
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation(Colors.white),
                      ),
                    )
                  : IconButton(
                      icon: Icon(
                        _isPlaying ? Icons.pause : Icons.play_arrow,
                        color: Colors.white,
                      ),
                      onPressed: _togglePlayPause,
                    ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: CustomPaint(
                size: const Size(double.infinity, 32),
                painter: WaveformPainter(
                  progress: progress,
                  isPlaying: _isPlaying,
                  activeColor: widget.isSentByMe
                      ? const Color(0xFF128C7E)
                      : const Color(0xFF075E54),
                  inactiveColor: Colors.grey.shade400,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              _isLoading
                  ? '--:--'
                  : _formatDuration(
                      _isPlaying ? _currentDuration : _totalDuration,
                    ),
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _errorWidget() => Container(
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: Colors.red.shade50,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Row(
      children: [
        Icon(Icons.error_outline, color: Colors.red.shade700),
        const SizedBox(width: 8),
        Text(
          'Unable to play audio',
          style: TextStyle(color: Colors.red.shade700),
        ),
      ],
    ),
  );
}

class WaveformPainter extends CustomPainter {
  final double progress;
  final bool isPlaying;
  final Color activeColor;
  final Color inactiveColor;

  WaveformPainter({
    required this.progress,
    required this.isPlaying,
    required this.activeColor,
    required this.inactiveColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    const barCount = 40;
    const barWidth = 3.0;
    final spacing = (size.width - (barCount * barWidth)) / (barCount - 1);

    for (int i = 0; i < barCount; i++) {
      final heightFactor = (i % 3 == 0)
          ? 0.8
          : (i % 2 == 0)
          ? 0.5
          : 0.3;
      final barHeight = size.height * heightFactor;
      final x = i * (barWidth + spacing);
      final y = (size.height - barHeight) / 2;
      final barProgress = i / barCount;
      final color = barProgress <= progress ? activeColor : inactiveColor;

      final paint = Paint()
        ..color = color
        ..strokeWidth = barWidth
        ..strokeCap = StrokeCap.round;

      canvas.drawLine(
        Offset(x + barWidth / 2, y),
        Offset(x + barWidth / 2, y + barHeight),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(WaveformPainter oldDelegate) =>
      oldDelegate.progress != progress || oldDelegate.isPlaying != isPlaying;
}
