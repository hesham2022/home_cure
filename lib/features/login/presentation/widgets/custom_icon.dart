import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 25,
          width: 14,
          child: CustomPaint(
            painter: TrianglePainter(
              strokeColor: Colors.white,
              strokeWidth: 26,
              paintingStyle: PaintingStyle.fill,
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          height: 25,
          width: 20,
          color: Colors.white,
          child: const Icon(
            Icons.close,
            size: 20,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

class TrianglePainter extends CustomPainter {
  TrianglePainter({
    this.strokeColor = Colors.black,
    this.strokeWidth = 3,
    this.paintingStyle = PaintingStyle.stroke,
  });
  final Color strokeColor;
  final PaintingStyle paintingStyle;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = strokeColor
      ..strokeWidth = strokeWidth
      ..style = paintingStyle;

    canvas.drawPath(getTrianglePath(size.width, size.height), paint);
  }

  Path getTrianglePath(double x, double y) {
    return Path()
      ..moveTo(0, y / 2)
      ..lineTo(x, 0)
      ..lineTo(x, y)
      ..lineTo(0, y / 2);
  }

  @override
  bool shouldRepaint(TrianglePainter oldDelegate) {
    return oldDelegate.strokeColor != strokeColor ||
        oldDelegate.paintingStyle != paintingStyle ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}
