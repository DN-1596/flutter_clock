import 'dart:math';


import 'package:devanshu_nema_clock/paint_clock.dart';
import 'package:flutter/material.dart';



import 'clock_themes.dart';
import 'my_clock.dart';

///  *** CLOCK Widget

class _animBuilder extends StatelessWidget {
  final AnimationController controller;
  Animation<double> hrAngle;
  Animation<double> minAngle;
  final int hrBegin;
  final int hrEnd;
  final int minBegin;
  final int minEnd;
  final Offset center;

  final UiInfo uiInfo;

  _animBuilder(
      {Key key,
      @required this.center,

      @required this.controller,
      @required this.minBegin,
      @required this.hrBegin,
      @required this.minEnd,
      @required this.hrEnd,
      @required this.uiInfo})
      : hrAngle = Tween<double>(
          begin: hrBegin * (pi / 180),
          end: (hrEnd - hrBegin < 0)
              ? (hrEnd + 360) * (pi / 180)
              : hrEnd * (pi / 180),
        ).animate(CurvedAnimation(
            parent: controller,
            curve: Interval(0.0, 1.0, curve: Curves.linear))),
        minAngle = Tween<double>(
          begin: minBegin * (pi / 180),
          end: (minEnd - minBegin < 0)
              ? (minEnd + 360) * (pi / 180)
              : minEnd * (pi / 180),
        ).animate(CurvedAnimation(
            parent: controller,
            curve: Interval(0.0, 1.0, curve: Curves.linear))),
        super(key: key);

  Widget _buildAnimation(BuildContext context, Widget child) {



    return CustomPaint(
      painter: PaintClock(
          minAngle: minAngle.value,
          hrAngle: hrAngle.value,
          center: center,
        uiInfo: uiInfo
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(animation: controller, builder: _buildAnimation);
  }
}

class ClockAnimation extends StatelessWidget {
  final int hrBegin;
  final int hrEnd;
  final int minBegin;
  final int minEnd;
  final Offset center;

  final UiInfo uiInfo;
  AnimationController controller;

  ClockAnimation(
      {@required this.controller,
      @required this.center,

      @required this.minBegin,
      @required this.hrBegin,
      @required this.minEnd,
      @required this.hrEnd,
      @required this.uiInfo});


  @override
  Widget build(BuildContext context) {
    return _animBuilder(
      controller: controller,
      hrBegin: hrBegin,
      hrEnd: hrEnd,
      minBegin: minBegin,
      minEnd: minEnd,
      center: center,
      uiInfo: uiInfo,
    );
  }
}


/////