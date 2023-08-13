import 'package:flutter/material.dart';

import '../../../../core/styles/colors.dart';

/// Clip widget in wave shape shape
class MyWave extends CustomPainter {
  /// reverse the wave direction in vertical axis
  bool reverse;

  /// flip the wave direction horizontal axis
  bool flip;

  MyWave({this.reverse = false, this.flip = false});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..strokeWidth = 25;
    paint.color = PRIMARY500_COLOR;
    paint.style = PaintingStyle.fill;

    final path = Path();

    path.lineTo(0, 280);
    path.quadraticBezierTo(5, 200, 100, 200);
    path.lineTo(size.width - 111, 200);
    //path.quadraticBezierTo(360, 160, 380, 140);
    path.quadraticBezierTo(size.width + 19, 205, size.width, 70);

    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}



/*
@override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..strokeWidth = 25;
    paint.color = PRIMARY_COLOR;
    paint.style = PaintingStyle.fill;

    final path = Path();

    path.lineTo(0, 250);
    path.quadraticBezierTo(20, 185, 60, 180);
    path.lineTo(340, 180);
    //path.quadraticBezierTo(360, 160, 380, 140);
    path.quadraticBezierTo(400, 170, 411, 110);

    path.lineTo(415, 0);

    canvas.drawPath(path, paint);
  }

*/