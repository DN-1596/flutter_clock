import 'dart:async';


import 'package:flutter/material.dart';
import 'package:flutter_clock_helper/model.dart';


import 'analog_digit.dart';
import 'clock_themes.dart';



class MyClock extends StatefulWidget {

  MyClock(this.model);

  final ClockModel model;

  @override
  _MyClockState createState() => _MyClockState();
}

class _MyClockState extends State<MyClock>
    with SingleTickerProviderStateMixin {


  GlobalKey key = GlobalKey();
  AnimationController _controller;
  DateTime _dateTime = DateTime.now();

  ClockTheme clockTheme;
  Timer _timer;

  List<int> prevTime;
  List<int> nowTime = [0, 0, 0, 0];


  ClockTheme getClockTheme(WeatherCondition weatherCondition) {
    ClockTheme clockTheme;

    switch (weatherCondition) {
      case WeatherCondition.cloudy:
        clockTheme = Cloudy();
        break;
      case WeatherCondition.foggy:
        clockTheme = Foggy();
        break;
      case WeatherCondition.rainy:
        clockTheme = Rainy();
        break;
      case WeatherCondition.snowy:
        clockTheme = Snowy();
        break;
      case WeatherCondition.windy:
        clockTheme = Windy();
        break;
      case WeatherCondition.sunny:
        clockTheme = Sunny();
        break;
      case WeatherCondition.thunderstorm:
        clockTheme = ThunderStorm();
        break;
    }


    return clockTheme;
  }


  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    _updateTime();
    clockTheme = getClockTheme(widget.model.weatherCondition);
    widget.model.addListener(_updateModel);
    super.initState();
  }


  @override
  void didUpdateWidget(MyClock oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.model != oldWidget.model) {
      oldWidget.model.removeListener(_updateModel);
      widget.model.addListener(_updateModel);
    }
  }

  void _updateModel() {
    setState(() {
      clockTheme = getClockTheme(widget.model.weatherCondition);
    });
  }


  void _updateTime() {
    setState(() {
      _controller.reset();
      _controller.forward();
      prevTime = nowTime;
      _dateTime = DateTime.now();
      nowTime = getDigitList(_dateTime);
      print(nowTime);
      Duration d = Duration(minutes: 1) -
          Duration(seconds: _dateTime.second) -
          Duration(milliseconds: _dateTime.millisecond);

      _timer = Timer(
        d,
        _updateTime,
      );
    });
  }

  List<int> getDigitList(DateTime dateTime) {
    List<int> digitList = new List();
    int hr = dateTime.hour;
    digitList.add(((hr - hr % 10) / 10).floor());
    digitList.add(hr % 10);
    int min = dateTime.minute;
    digitList.add(((min - min % 10) / 10).floor());
    digitList.add(min % 10);
    return digitList;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: clockTheme.backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                  child: Container(

                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16,8,0,8),
                      child: Text(
                          widget.model.weatherString,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: clockTheme.textSize,
                          fontStyle: FontStyle.italic,
                          color: clockTheme.textColor
                        ),
                      ),
                    ),
                  )
              ),
              Expanded(
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0,8,16,8),
                      child: Text(
                          widget.model.temperatureString,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: clockTheme.textSize,
                            fontStyle: FontStyle.italic,
                            color: clockTheme.textColor
                        ),
                      ),
                    ),
                  )
              )
            ],
          ),
          AspectRatio(
              aspectRatio: 8 / 3,
              child: Container(
                  child: LayoutBuilder(
                    builder: (BuildContext context,
                        BoxConstraints constraints) {
                      double width = constraints.maxWidth;
                      double cellWidth = width / 8;
                      Offset pivotOffset = Offset(cellWidth / 2, cellWidth / 2);

                      var uiInfo = new UiInfo(cellWidth: cellWidth,
                          dialColor: clockTheme.dialColor,
                          handColor: clockTheme.handColor,
                        backgroundColor: clockTheme.backgroundColor
                      );


                      return Stack(
                        children: <Widget>[
                          AnalogDigit(
                            controller: _controller,
                            uiInfo: uiInfo,
                            pivot: pivotOffset,
                            digit: nowTime[0],
                            prevDigit: prevTime[0],
                          ),
                          AnalogDigit(
                            controller: _controller,
                            uiInfo: uiInfo,
                            pivot: Offset(
                                pivotOffset.dx + cellWidth * 2, cellWidth / 2),
                            digit: nowTime[1],
                            prevDigit: prevTime[1],
                          ),
                          AnalogDigit(
                            controller: _controller,
                            uiInfo: uiInfo,
                            pivot: Offset(
                                pivotOffset.dx + cellWidth * 4, cellWidth / 2),
                            digit: nowTime[2],
                            prevDigit: prevTime[2],
                          ),
                          AnalogDigit(
                            controller: _controller,
                            uiInfo: uiInfo,
                            pivot: Offset(
                                pivotOffset.dx + cellWidth * 6, cellWidth / 2),
                            digit: nowTime[3],
                            prevDigit: prevTime[3],
                          )
                        ],
                      );
                    },
                  ))
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0,8,16,8),
              child: Text(
                  widget.model.location,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: clockTheme.textSize,
                    fontStyle: FontStyle.italic,
                    color: clockTheme.textColor
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class UiInfo {

  double cellWidth;
  double radius;
  Color dialColor;
  Color handColor;
  Color backgroundColor;

  UiInfo(
      {@required this.cellWidth, @required this.dialColor, @required this.handColor,@required this.backgroundColor}) {
    radius = cellWidth * 0.45;
  }


}

/////