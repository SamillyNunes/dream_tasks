import 'package:flutter/material.dart';

class AddProjectTaskWidget extends StatelessWidget {
  final String taskName;
  final Function onDeletePressed;

  AddProjectTaskWidget(this.taskName, this.onDeletePressed);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Container(
        padding: EdgeInsets.only(left:10),
        height: MediaQuery.of(context).size.height*0.08,
        decoration: BoxDecoration(
          color: Theme.of(context).disabledColor,
          borderRadius: BorderRadius.all(Radius.circular(5))
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(
              child: Text(
                taskName,
                style: TextStyle(
                  color: Color(0xFFFFFFFF), //cor fixa
                ),
              )
            ),
            IconButton(
              icon: Text(
                'X',
                style: TextStyle(
                  color: Color(0xFFFFFFFF) //fixo
                ),
              ), 
              onPressed: onDeletePressed
            )
          ],
        ),
      )
    );
  }
}