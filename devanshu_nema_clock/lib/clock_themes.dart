

import 'package:flutter/material.dart';

abstract class ClockTheme {

  Color dialColor;
  Color handColor;
  Color textColor;
  Color backgroundColor;
  double textSize;

}


// **Sunny


class Sunny extends ClockTheme {
  @override
  Color get dialColor => Colors.orangeAccent[400];

  @override
  // TODO: implement handColor
  Color get handColor => Colors.amber[100];

  @override
  // TODO: implement textColor
  Color get textColor => Colors.white;

  @override
  // TODO: implement backgroundColor
  Color get backgroundColor => Colors.amber[900];

  @override
  // TODO: implement textSize
  double get textSize => 14.5;
}


//  **Snowy


class Snowy extends ClockTheme {
  @override
  Color get dialColor => Colors.grey.shade300;

  @override
  // TODO: implement handColor
  Color get handColor => Colors.black;

  @override
  // TODO: implement textColor
  Color get textColor => Colors.grey[600];

  @override
  // TODO: implement backgroundColor
  Color get backgroundColor => Colors.white;

  @override
  // TODO: implement textSize
  double get textSize => 14.5;
}


// **Foggy


class Foggy extends ClockTheme {
  @override
  Color get dialColor => Colors.grey.shade300;

  @override
  // TODO: implement handColor
  Color get handColor => Colors.blueGrey;

  @override
  // TODO: implement textColor
  Color get textColor => Colors.grey.shade600;

  @override
  // TODO: implement backgroundColor
  Color get backgroundColor => Colors.grey[200];

  @override
  // TODO: implement textSize
  double get textSize => 14.5;
}


// **Rainy

class Rainy extends ClockTheme {
  @override
  Color get dialColor => Colors.blue[200];

  @override
  // TODO: implement handColor
  Color get handColor => Colors.greenAccent[700];

  @override
  // TODO: implement textColor
  Color get textColor => Colors.blueAccent[700];

  @override
  // TODO: implement backgroundColor
  Color get backgroundColor => Colors.lightBlue[100];

  @override
  double get textSize => 14.5;
}


// **Windy

class Windy extends ClockTheme {
  @override
  Color get dialColor => Colors.brown[200];

  @override
  // TODO: implement handColor
  Color get handColor => Colors.grey[900];

  @override
  // TODO: implement textColor
  Color get textColor => Colors.brown[900];

  @override
  // TODO: implement backgroundColor
  Color get backgroundColor => Colors.brown[100];

  @override
  // TODO: implement textSize
  double get textSize => 14.5;
}

// **Cloudy

class Cloudy extends ClockTheme {
  @override
  Color get dialColor => Colors.blueGrey[400];

  @override
  // TODO: implement handColor
  Color get handColor => Colors.amber[200];

  @override
  // TODO: implement textColor
  Color get textColor => Colors.blueGrey[50];

  @override
  // TODO: implement backgroundColor
  Color get backgroundColor => Colors.blueGrey[300];

  @override
  // TODO: implement textSize
  double get textSize => 14.5;
}


// **ThunderStorm


class ThunderStorm extends ClockTheme {
  @override
  Color get dialColor => Colors.grey[800];

  @override
  // TODO: implement handColor
  Color get handColor => Colors.white;

  @override
  // TODO: implement textColor
  Color get textColor => Colors.grey;

  @override
  // TODO: implement backgroundColor
  Color get backgroundColor => Colors.grey[900];

  @override
  // TODO: implement textSize
  double get textSize => 14.5;
}

//////
