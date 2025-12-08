import 'package:flutter/material.dart';

class CustomDollarSign extends StatelessWidget {
  final double size;
  final Color color;

  const CustomDollarSign({
    super.key,
    this.size = 24,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _CustomDollarPainter(color),
    );
  }
}

class _CustomDollarPainter extends CustomPainter {
  final Color color;
  _CustomDollarPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth =
          size.width *
          0.08 // ✅ use size.width instead of size
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    // Draw the "S"
    final textPainter = TextPainter(
      text: TextSpan(
        text: 'S',
        style: TextStyle(
          color: color,
          fontSize: size.width * 0.9, // ✅ use size.width
          fontWeight: FontWeight.w600,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();

    final textOffset = Offset(
      (size.width - textPainter.width) / 2,
      (size.height - textPainter.height) / 2,
    );
    textPainter.paint(canvas, textOffset);

    // Draw vertical line slightly above and below S
    final centerX = size.width / 2;
    final topY = size.height * 0.1;
    final bottomY = size.height * 0.9;
    canvas.drawLine(Offset(centerX, topY), Offset(centerX, bottomY), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
