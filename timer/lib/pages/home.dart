import 'package:flutter/material.dart';
import 'package:timer/components/button.dart';
import 'package:timer/components/display.dart';
import 'package:timer/components/saved-time.dart';
import 'package:timer/services/formatter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  Stopwatch stopwatch = new Stopwatch();
  bool isRunning = false;
  List saves = <String>[];

  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

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
    _listKey.currentState.insertItem(0);
  }

  restart() {
    for (var i = 0; i <= saves.length - 1; i++) {
      _listKey.currentState.removeItem(0, (
        BuildContext context,
        Animation<double> animation,
      ) {
        return Container();
      });
    }

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
    return AnimatedList(
      key: _listKey,
      initialItemCount: 0,
      itemBuilder: (contex, index, animation) {
        return SizeTransition(
          sizeFactor: animation,
          child: SavedTime(
            time: saves[index],
            index: saves.length - index,
          ),
        );
      },
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
                  child: renderSavedTimers(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
