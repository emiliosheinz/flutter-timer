import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String title;
  final Color color;

  Button({@required this.title, @required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: color,
            width: 2,
          )),
      child: Padding(
        padding: EdgeInsets.all(2),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
          child: InkWell(
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 0.7),
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
