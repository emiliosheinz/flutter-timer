import 'package:flutter/material.dart';

class SavedTime extends StatelessWidget {
  final int index;
  final String time;

  SavedTime({@required this.index, @required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 10,
        bottom: 10,
        left: 5,
        right: 5,
      ),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey, width: 0.5),
        ),
      ),
      child: Row(
        children: <Widget>[
          Text(
            'Volta ${index.toString()}',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          Spacer(),
          Text(
            time,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ],
      ),
    );
  }
}
