import 'package:flutter/material.dart';

class DayRepeatWidget extends StatelessWidget {

  final String day;
  DayRepeatWidget(this.day);

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.center,
      // mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Checkbox(
          value: false,
          tristate: true, 
          onChanged: (value){},
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        Text(
          day
        )
      ],
      
    );
  }
}