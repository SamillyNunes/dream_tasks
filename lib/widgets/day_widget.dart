import 'package:flutter/material.dart';

Color _backgroundColor = Colors.purple[300];
const Color _secundaryBackground = Colors.black;
const Color _textColor = Colors.black;
// Color _secundaryTextColor = Colors.grey[350];
const  Color _dayBackground = Colors.white;


class DayWidget extends StatelessWidget {

  final int day;
  int weekDay;
  final bool currentDay;

  final List<String> week = ["Seg","Ter","Qua","Qui","Sex","Sab","Dom"];

  DayWidget(this.day, this.weekDay, {this.currentDay=false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0),
      margin: EdgeInsets.zero,
      // color: Colors.white,
      height: MediaQuery.of(context).size.height * 0.13,
      width: MediaQuery.of(context).size.width * 0.12,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.elliptical(100, 90)),
          border: Border.all(
            color: currentDay ? _backgroundColor : Colors.transparent, 
            width: 2
          ),
          color: currentDay ? _backgroundColor : Colors.transparent, 
      ),
      child: FlatButton(
        onPressed: () {
          print(DateTime.now().weekday.toString());
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding( //widget do dia da semana
              padding: EdgeInsets.only(bottom: 5),
              child: Text(
                week[weekDay-1],
                // 'te',
                style: TextStyle(
                  fontSize: 7,
                  color: currentDay ? _textColor : _backgroundColor, 
                ),
              ),
            ),
            Container( //widget da data 
              // margin: EdgeInsets.all(2),
              width: 90,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: currentDay ? _dayBackground : Colors.transparent, 
              ),
              child: Text(
                day.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: currentDay ? _textColor : _backgroundColor, 
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}
