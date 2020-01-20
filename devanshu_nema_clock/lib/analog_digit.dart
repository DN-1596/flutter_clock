import 'package:devanshu_nema_clock/my_clock.dart';
import 'package:flutter/material.dart';

import 'clock_animation.dart';

///  *** CLOCK Widget !!

class Digit {
  List<List<int>> digitConfig;

  Digit({@required this.digitConfig});
}

Digit idle = Digit(digitConfig: [
  [0, 0],
  [0, 0],
  [0, 0],
  [0, 0],
  [0, 0],
  [0, 0]
]);
List<Digit> digits = [
  // 0
  Digit(digitConfig: [
    [90, 180],
    [180, 270],
    [0, 180],
    [0, 180],
    [0, 90],
    [0, 270]
  ]),
  // 1
  Digit(digitConfig: [
    [225, 225],
    [180, 180],
    [225, 225],
    [0, 180],
    [225, 225],
    [0, 0]
  ]),
  // 2
  Digit(digitConfig: [
    [90, 90],
    [180, 270],
    [90, 180],
    [0, 270],
    [0, 90],
    [270, 270]
  ]),
  // 3
  Digit(digitConfig: [
    [90, 90],
    [180, 270],
    [90, 90],
    [0, 180],
    [90, 90],
    [0, 270]
  ]),
  // 4
  Digit(digitConfig: [
    [180, 180],
    [180, 180],
    [0, 90],
    [0, 180],
    [225, 225],
    [0, 0]
  ]),
  // 5
  Digit(digitConfig: [
    [90, 180],
    [270, 270],
    [0, 90],
    [180, 270],
    [90, 90],
    [0, 270]
  ]),
  // 6
  Digit(digitConfig: [
    [90, 180],
    [270, 270],
    [0, 180],
    [180, 270],
    [0, 90],
    [0, 270]
  ]),
  // 7
  Digit(digitConfig: [
    [90, 90],
    [180, 270],
    [225, 225],
    [0, 180],
    [225, 225],
    [0, 0]
  ]),
  // 8
  Digit(digitConfig: [
    [90, 180],
    [180, 270],
    [0, 90],
    [0, 270],
    [0, 90],
    [0, 270]
  ]),
  // 9
  Digit(digitConfig: [
    [90, 180],
    [180, 270],
    [0, 90],
    [0, 180],
    [90, 90],
    [0, 270]
  ]),
];

class AnalogDigit extends StatelessWidget {


  UiInfo uiInfo;
  Offset pivot;
  int digit;
  int prevDigit;
  AnimationController controller;

  AnalogDigit(
      {@required this.uiInfo,
      @required this.pivot,
      @required this.digit,
      @required this.controller,
      @required this.prevDigit});


  @override
  Widget build(BuildContext context) {

    double cellWidth = uiInfo.cellWidth;
    return Stack(
      children: <Widget>[
        // clock 0
        ClockAnimation(
            controller: controller.view,
            center: pivot,
            uiInfo: uiInfo,
            minBegin: (digits[prevDigit].digitConfig)[0][0],
            hrBegin: (digits[prevDigit].digitConfig)[0][1],
            minEnd: (digits[digit].digitConfig)[0][0],
            hrEnd: (digits[digit].digitConfig)[0][1]),
        // clock 1
        ClockAnimation(
            controller: controller.view,
            center: Offset(pivot.dx + cellWidth, pivot.dy),
            uiInfo: uiInfo,
            minBegin: (digits[prevDigit].digitConfig)[1][0],
            hrBegin: (digits[prevDigit].digitConfig)[1][1],
            minEnd: (digits[digit].digitConfig)[1][0],
            hrEnd: (digits[digit].digitConfig)[1][1]),
        // clock 2
        ClockAnimation(
            controller: controller.view,
            center: Offset(pivot.dx, pivot.dy + cellWidth),
            uiInfo: uiInfo,
            minBegin: (digits[prevDigit].digitConfig)[2][0],
            hrBegin: (digits[prevDigit].digitConfig)[2][1],
            minEnd: (digits[digit].digitConfig)[2][0],
            hrEnd: (digits[digit].digitConfig)[2][1]),
        // clock 3
        ClockAnimation(
            controller: controller.view,
            center: Offset(pivot.dx + cellWidth,
                pivot.dy + cellWidth),
            uiInfo: uiInfo,
            minBegin: (digits[prevDigit].digitConfig)[3][0],
            hrBegin: (digits[prevDigit].digitConfig)[3][1],
            minEnd: (digits[digit].digitConfig)[3][0],
            hrEnd: (digits[digit].digitConfig)[3][1]),
        // clock 4
        ClockAnimation(
            controller: controller.view,
            center:
                Offset(pivot.dx, pivot.dy + cellWidth*2),
            uiInfo: uiInfo,
            minBegin: (digits[prevDigit].digitConfig)[4][0],
            hrBegin: (digits[prevDigit].digitConfig)[4][1],
            minEnd: (digits[digit].digitConfig)[4][0],
            hrEnd: (digits[digit].digitConfig)[4][1]),
        // clock 5
        ClockAnimation(
            controller: controller.view,
            center: Offset(pivot.dx + cellWidth,
                pivot.dy + cellWidth*2),
            uiInfo: uiInfo,
            minBegin: (digits[prevDigit].digitConfig)[5][0],
            hrBegin: (digits[prevDigit].digitConfig)[5][1],
            minEnd: (digits[digit].digitConfig)[5][0],
            hrEnd: (digits[digit].digitConfig)[5][1]),
      ],
    );
  }
}


/////