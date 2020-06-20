import 'package:dream_tasks/widgets/custom_check_widget.dart';
import 'package:flutter/material.dart';

const String _defaultFontFamily = 'Raleway';

class CustomSelectWeekday extends StatelessWidget {
  final String weekDay;
  final bool selected;

  CustomSelectWeekday(this.weekDay, {this.selected=false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10),
      child: Container(
        child: Column(
          children: <Widget>[
            CustomCheckWidget(this.selected, borderColor: Theme.of(context).primaryColor,),
            Text(
              weekDay,
              style: TextStyle(
                fontFamily: _defaultFontFamily,
                color: Theme.of(context).primaryColor,
                fontSize: 10
              ),
            ),
          ],
        ),
      )
    );
  }
}