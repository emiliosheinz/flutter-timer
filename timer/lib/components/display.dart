import 'dart:async';

import 'package:flutter/material.dart';
import 'package:timer/services/formatter.dart';

class Display extends StatefulWidget {
  final Stopwatch stopwatch;

  Display({@required this.stopwatch});

  @override
  _DisplayState createState() => _DisplayState(stopwatch: stopwatch);
}

class _DisplayState extends State<Display> {
  final Stopwatch stopwatch;

  Timer timer;

  _DisplayState({this.stopwatch}) {
    timer = new Timer.periodic(new Duration(milliseconds: 30), callback);
  }

  void callback(Timer timer) {
    if (stopwatch.isRunning) {
      setState(() {});
    }
  }

  getTimerContent() {
    return formatToTimerString(stopwatch.elapsedMilliseconds);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Align(
        alignment: Alignment.center,
        child: Text(
          getTimerContent(),
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w200,
            fontSize: 90,
          ),
        ),
      ),
    );
  }
}
