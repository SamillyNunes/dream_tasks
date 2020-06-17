import 'package:dream_tasks/stores/day_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

const String _defaultFontFamily = 'Raleway';

class DayWidget extends StatelessWidget {
  final DateTime date;
  final DayStore dayStore;


  final List<String> week = ["Seg","Ter","Qua","Qui","Sex","Sab","Dom"];

  DayWidget(this.date, this.dayStore);

  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(dayStore.dateSelected!=date ){
          dayStore.changeDaySelected(date);
        } 

      },
      child: Container(
        child: Observer(
          builder: (context){
            print('weekday:'+date.weekday.toString());
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "${date.day}",
                  style: TextStyle(
                    fontFamily: _defaultFontFamily,
                    fontSize: 25,
                    color: dayStore.dateSelected==date ? 
                      Theme.of(context).accentColor
                      : Theme.of(context).primaryColor,
                    
                  ),
                ),
                Text(
                  week[date.weekday-1],
                  style: TextStyle(
                    fontFamily: _defaultFontFamily,
                    fontSize: 20,
                    color: dayStore.dateSelected==date ? 
                      Theme.of(context).accentColor 
                      : Theme.of(context).primaryColor
                  ),
                )
              ],
            );
          },
        ),
      )
    );
  }
}