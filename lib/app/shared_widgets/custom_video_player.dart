// // import 'dart:developer';
// // import 'dart:io';
//
// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/material.dart';
// // import 'package:speak_logic/app/config/app_colors.dart';
// // import 'package:video_player/video_player.dart';
//
// // class VideoPlayerWidget extends StatefulWidget {
// //   final String videoUrl;
// //   final bool isAsset;
//
// //   const VideoPlayerWidget({super.key, required this.videoUrl, this.isAsset = false});
//
// //   @override
// //   _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
// // }
//
// // class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
// //   late VideoPlayerController _videoController;
// //   bool isPlaying = false;
//
// //   @override
// //   void initState() {
// //     super.initState();
// //     log("video url:${widget.videoUrl}");
// //     // Initialize the video player controller with the URL
// //     _videoController =
// //     widget.isAsset ?
// //     VideoPlayerController.file(File(widget.videoUrl)):
// //     VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
// //       ..initialize().then((_) {
// //         setState(() {}); // Update the UI when the video is initialized
// //       });
// //        _videoController.addListener(() {
// //       // Check if the video has finished playing
// //       if (_videoController.value.position == _videoController.value.duration ) {
// //         setState(() {
// //            isPlaying = !isPlaying;
// //         });
// //       }
// //     });
// //   }
//
// //   @override
// //   void dispose() {
// //     _videoController.dispose(); // Dispose of the video player when the widget is removed
// //     super.dispose();
// //   }
//
// //   void togglePlayPause() {
// //     setState(() {
// //       if (isPlaying) {
// //         _videoController.pause();
// //       } else {
// //         _videoController.play();
// //       }
// //       isPlaying = !isPlaying;
// //     });
// //   }
//
// //   @override
// //   Widget build(BuildContext context) {
// //      log("video url:${widget.videoUrl}");
// // return Center(
// //   child: _videoController.value.isInitialized
// //       ? Stack(
// //           alignment: Alignment.center,
// //           children: [
// //             AspectRatio(
// //               aspectRatio: _videoController.value.aspectRatio,
// //               child: VideoPlayer(_videoController),
// //             ),
// //             IconButton(
// //               icon: Icon(
// //                 isPlaying ? Icons.pause : Icons.play_arrow,
// //                 size: 50.0,
// //                 color: AppColors.white,
// //               ),
// //               onPressed: togglePlayPause,
// //             ),
// //           ],
// //         )
// //       : const Padding(
// //         padding: EdgeInsets.symmetric(vertical: 15),
// //         child: CupertinoActivityIndicator(),
// //       ),
// // );
// //   }
// // }
//
// import 'dart:developer';
// import 'dart:io';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:obo/app/config/app_colors.dart';
// import 'package:video_player/video_player.dart';
//
// class VideoPlayerWidget extends StatefulWidget {
//   final String videoUrl;
//   final bool isAsset;
//
//   const VideoPlayerWidget(
//       {super.key, required this.videoUrl, this.isAsset = false});
//
//   @override
//   _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
// }
//
// class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
//   VideoPlayerController? _videoController; // Make nullable to handle disposal
//   bool isPlaying = false;
//
//   @override
//   void initState() {
//     super.initState();
//     initializeVideo();
//   }
//
//   @override
//   void didUpdateWidget(covariant VideoPlayerWidget oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     if (widget.videoUrl != oldWidget.videoUrl) {
//       // Video URL changed, dispose and reinitialize
//       disposeVideo();
//       initializeVideo();
//     }
//   }
//
//   void initializeVideo() async {
//     _videoController = widget.isAsset
//         ? VideoPlayerController.file(File(widget.videoUrl))
//         : VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
//     await _videoController!.initialize();
//     _videoController!.addListener(_videoPlayerListener); // Add listener
//     setState(() {});
//   }
//
//   void disposeVideo() {
//     if (_videoController != null) {
//       _videoController!.removeListener(_videoPlayerListener); // Remove listener
//       _videoController!.dispose();
//       _videoController = null;
//     }
//   }
//
//   void _videoPlayerListener() {
//     // Check if video has finished playing
//     if (_videoController!.value.position == _videoController!.value.duration) {
//       setState(() {
//         isPlaying = !isPlaying;
//       });
//       _videoController!.seekTo(Duration.zero); // Reset to beginning on loop
//     }
//   }
//
//   @override
//   void dispose() {
//     disposeVideo();
//     super.dispose();
//   }
//
//   void togglePlayPause() {
//     setState(() {
//       if (isPlaying) {
//         _videoController!.pause();
//       } else {
//         _videoController!.play();
//       }
//       isPlaying = !isPlaying;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//
//     return Center(
//       child: _videoController != null && _videoController!.value.isInitialized
//           ?SizedBox(
//         width: double.infinity,
//         height: 200,
//         child: FittedBox(
//           fit: BoxFit.cover,
//           clipBehavior: Clip.hardEdge,
//           child: SizedBox(
//             width: _videoController!.value.size.width,
//             height: _videoController!.value.size.height,
//             child: Stack(
//               alignment: Alignment.center,
//               children: [
//                 VideoPlayer(_videoController!),
//                 IconButton(
//                   icon: Icon(
//                     isPlaying ? Icons.pause : Icons.play_arrow,
//                     size: 50.0,
//                     color: AppColors.white,
//                   ),
//                   onPressed: togglePlayPause,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       )
//
//           : const Padding(
//               padding: EdgeInsets.symmetric(vertical: 15),
//               child: CupertinoActivityIndicator(
//                 color: AppColors.primary,
//               ),
//             ),
//     );
//   }
// }
