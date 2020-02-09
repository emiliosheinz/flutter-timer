import 'package:flutter/material.dart';
import 'package:timer/components/button.dart';
import 'package:timer/components/display.dart';

class HomePage extends StatelessWidget {
  renderLeftButton() {
    return Button(
      title: 'Volta',
      color: Color.fromRGBO(82, 82, 82, 0.6),
    );
  }

  renderRightButton() {
    return Button(
      title: 'Iniciar',
      color: Color.fromRGBO(0, 160, 0, 0.6),
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
              Display(),
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
