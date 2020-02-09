import 'package:flutter/material.dart';
import 'package:timer/components/button.dart';
import 'package:timer/components/display.dart';
import 'package:timer/components/saved-time.dart';
import 'package:timer/services/formatter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Stopwatch stopwatch = new Stopwatch();
  bool isRunning = false;
  List saves = <String>[];

  start() {
    stopwatch.start();
    setState(() {
      isRunning = true;
    });
  }

  stop() {
    stopwatch.stop();
    setState(() {
      isRunning = false;
    });
  }

  save() {
    setState(() {
      saves = [formatToTimerString(stopwatch.elapsedMilliseconds), ...saves];
    });
  }

  restart() {
    stopwatch.reset();
    setState(() {
      isRunning = false;
      saves = [];
    });
  }

  renderLeftButton() {
    if (isRunning) {
      return Button(
        title: 'Volta',
        color: Color.fromRGBO(82, 82, 82, 0.6),
        onPress: save,
      );
    }

    return Button(
      title: 'Zerar',
      color: Color.fromRGBO(82, 82, 82, 0.6),
      onPress: restart,
    );
  }

  renderRightButton() {
    if (isRunning) {
      return Button(
        title: 'Parar',
        color: Color.fromRGBO(255, 0, 0, 0.6),
        onPress: stop,
      );
    }

    return Button(
      title: 'Iniciar',
      color: Color.fromRGBO(0, 160, 0, 0.6),
      onPress: start,
    );
  }

  renderSavedTimers() {
    var counter = saves.length;
    return Column(
      children: saves.map((time) {
        counter--;
        return SavedTime(time: time, index: counter);
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Display(
                stopwatch: stopwatch,
              ),
              Row(
                children: <Widget>[
                  renderLeftButton(),
                  Spacer(),
                  renderRightButton(),
                ],
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(top: 20),
                  child: SingleChildScrollView(
                    child: renderSavedTimers(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
