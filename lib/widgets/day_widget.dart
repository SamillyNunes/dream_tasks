import 'package:flutter/material.dart';

const String _defaultFontFamily = 'Raleway';

class DayWidget extends StatelessWidget {
  final int day;
  int weekDay;
  final bool currentDay;

  final List<String> week = ["Seg","Ter","Qua","Qui","Sex","Sab","Dom"];

  DayWidget(this.day, this.weekDay, {this.currentDay=false});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "$day",
            style: TextStyle(
              fontFamily: _defaultFontFamily,
              fontSize: 25,
              color: currentDay ? 
                Theme.of(context).accentColor
                : Theme.of(context).primaryColor
            ),
          ),
          Text(
            week[weekDay], //ta errado!!!!: calcula um dia a mais nos dias de segunda 
            // 'Tes',
            style: TextStyle(
              fontFamily: _defaultFontFamily,
              fontSize: 20,
              color: currentDay ? 
                Theme.of(context).accentColor 
                : Theme.of(context).primaryColor
            ),
          )
        ],
      ),
    );
  }
}