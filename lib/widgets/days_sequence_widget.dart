import 'package:flutter/material.dart';

const String _defaultFontFamily = 'Raleway';

class DaysSequenceWidget extends StatelessWidget {

  final int sequence;
  final int record;

  DaysSequenceWidget(this.sequence,this.record);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.2,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF0CCF4F),
            Color(0xFF22BFC3),
          ]
        ),
        borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width*0.6,
            child: Text(
              'Você completou sua meta $sequence dias seguidos!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: _defaultFontFamily,
                color: Theme.of(context).primaryColor,
                fontSize: 20
              ),
            )
          ),
          Padding(
            padding: EdgeInsets.only(top:5),
            child: Text(
              'Seu recorde é de $record dias',
              style: TextStyle(
                fontFamily: _defaultFontFamily,
                color: Color(0xFF050607),
                fontSize: 15
              ),
            ),
          )
        ],
      ),
    );
  }
}