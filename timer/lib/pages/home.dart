import 'package:flutter/material.dart';
import 'package:timer/components/button.dart';
import 'package:timer/components/display.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Stopwatch stopwatch = new Stopwatch();

  start() {
    stopwatch.start();
  }

  stop() {
    stopwatch.stop();
  }

  renderLeftButton() {
    return Button(
      title: 'Volta',
      color: Color.fromRGBO(82, 82, 82, 0.6),
      onPress: stop,
    );
  }

  renderRightButton() {
    return Button(
      title: 'Iniciar',
      color: Color.fromRGBO(0, 160, 0, 0.6),
      onPress: start,
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
              Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Row(
                    children: <Widget>[
                      renderLeftButton(),
                      Spacer(),
                      renderRightButton(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
