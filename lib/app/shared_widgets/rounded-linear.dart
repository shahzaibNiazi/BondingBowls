import 'package:flutter/material.dart';

class RoundedLinearProgressIndicator extends StatelessWidget {
  final double value;
  final double height;
  final Color backgroundColor;
  final Gradient valueGradient;

  const RoundedLinearProgressIndicator({
    super.key,
    required this.value,
    this.backgroundColor = Colors.grey,
    this.valueGradient = const LinearGradient(
      colors: [
        Color(0XFFB09FFF),
        Color(0XFF6949FF),
      ], // Customize gradient colors here
    ),
    this.height = 10.0,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _RoundedLinearProgressIndicatorPainter(
        value: value,
        backgroundColor: const Color(0xffEEEEEE),
        valueGradient: valueGradient,
      ),
      child: Container(
        height: height,
      ),
    );
  }
}

class _RoundedLinearProgressIndicatorPainter extends CustomPainter {
  final double value;
  final Color backgroundColor;
  final Gradient valueGradient;

  _RoundedLinearProgressIndicatorPainter({
    required this.value,
    required this.backgroundColor,
    required this.valueGradient,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint backgroundPaint = Paint()
      ..color = backgroundColor
      ..strokeCap = StrokeCap.round
      ..strokeWidth = size.height;

    final double width = size.width * value;
    canvas.drawLine(
      Offset.zero,
      Offset(size.width, 0),
      backgroundPaint,
    );

    if (value > 0) {
      final Paint valuePaint = Paint()
        ..shader = valueGradient.createShader(
          Rect.fromLTWH(0, 0, width, size.height),
        )
        ..strokeCap = StrokeCap.round
        ..strokeWidth = size.height;

      canvas.drawLine(
        Offset.zero,
        Offset(width, 0),
        valuePaint,
      );
    }
  }

  @override
  bool shouldRepaint(_RoundedLinearProgressIndicatorPainter oldDelegate) {
    return oldDelegate.value != value ||
        // oldDelegate.backgroundColor != backgroundColor ||
        oldDelegate.valueGradient != valueGradient;
  }
}