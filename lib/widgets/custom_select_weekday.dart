import 'package:dream_tasks/widgets/custom_check_widget.dart';
import 'package:flutter/material.dart';

class CustomSelectWeekday extends StatefulWidget {
  final String weekDay;
  final bool selected;
  final Function(bool) onCheckWeed;

  CustomSelectWeekday(this.weekDay, {this.selected=false, @required this.onCheckWeed});

  @override
  _CustomSelectWeekdayState createState() => _CustomSelectWeekdayState(this.weekDay, this.selected, this.onCheckWeed);
}

class _CustomSelectWeekdayState extends State<CustomSelectWeekday> {
  final String weekDay;
  bool selected;
  final Function(bool) onCheckWeed;

  _CustomSelectWeekdayState(this.weekDay, this.selected, this.onCheckWeed);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10),
      child: Container(
        child: Column(
          children: <Widget>[
            InkWell(
              onTap: (){
                setState(() {
                  selected=!selected;
                  onCheckWeed(selected);
                });
              },
              child: CustomCheckWidget(this.selected, borderColor: Theme.of(context).primaryColor),
            ),
            
            Text(
              weekDay,
              style: TextStyle(
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