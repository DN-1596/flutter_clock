
import 'package:devanshu_nema_clock/my_clock.dart';
import 'package:flutter/material.dart';
import 'dart:math';

///  *** CLOCK Widget
class PaintClock extends CustomPainter {
  Paint _paint;
  Paint _paint2;
  double hrAngle;
  double minAngle;
  Offset center;
  UiInfo uiInfo;


  PaintClock(
      {@required this.minAngle,
      @required this.hrAngle,
      @required this.center,
        @required this.uiInfo
      }) {
    _paint = Paint()
      ..color = uiInfo.dialColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    _paint2 = Paint()
 //     ..color =  (hrAngle == 225*(pi/180) && minAngle == 225 * (pi/180)) ? uiInfo.dialColor :uiInfo.handColor
   ..color = uiInfo.handColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 4;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(center, uiInfo.radius, _paint);

    double handSize = uiInfo.radius * 0.8;
    canvas.drawLine(
        center,
        Offset(center.dx + handSize * sin(hrAngle),
            center.dy - handSize * cos(hrAngle)),
        _paint2);

    canvas.drawLine(
        center,
        Offset(center.dx + handSize * sin(minAngle),
            center.dy - handSize * cos(minAngle)),
        _paint2);
  }

  @override
  bool shouldRepaint(PaintClock oldDelegate) {
    return (oldDelegate.hrAngle != hrAngle) || (oldDelegate.minAngle != minAngle) || (oldDelegate.uiInfo == uiInfo) ;

  }
}


/////////