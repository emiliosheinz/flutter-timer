import 'package:flutter/material.dart';

class Display extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Text(
          '00:00,00',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w200,
            fontSize: 75,
          ),
        ),
      ),
    );
  }
}
