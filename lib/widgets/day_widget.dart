import 'package:flutter/material.dart';

Color _backgroundColor = Colors.purple[300];
const Color _secundaryBackground = Colors.black;
const Color _textColor = Colors.black;
// Color _secundaryTextColor = Colors.grey[350];
const  Color _dayBackground = Colors.white;

class DayWidget extends StatelessWidget {

  final bool currentDay;

  DayWidget({this.currentDay=false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0),
      // color: Colors.white,
      height: MediaQuery.of(context).size.height * 0.16,
      width: MediaQuery.of(context).size.width * 0.14,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.elliptical(100, 90)),
          border: Border.all(
            color: currentDay ? _backgroundColor : _secundaryBackground, 
            width: 2
          ),
          color: currentDay ? _backgroundColor : _secundaryBackground, 
      ),
      child: FlatButton(
        onPressed: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 5),
              child: Text(
                "Seg",
                style: TextStyle(
                  fontSize: 8,
                  color: currentDay ? _textColor : _backgroundColor, 
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(0),
              // margin: EdgeInsets.all(2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  border: Border.all(
                    color: currentDay ? _dayBackground : _secundaryBackground, 
                    width: 2
                  ),
                  color: currentDay ? _dayBackground : _secundaryBackground, 
              ),
              child: Text(
                "23",
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
