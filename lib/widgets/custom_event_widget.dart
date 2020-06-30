import 'package:flutter/material.dart';

class CustomEventWidget extends StatelessWidget {
  final String _titleEvent;
  final String _descriptionEvent;
  final Color _color;

  CustomEventWidget(this._titleEvent,this._descriptionEvent,this._color);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal:20, vertical: 5),
      child: Container(
        padding: EdgeInsets.only(left: 20, top: 5),
        height: MediaQuery.of(context).size.height*0.08,
        decoration: BoxDecoration(
          color: _color,
          borderRadius: BorderRadius.all(Radius.circular(8))
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              _titleEvent,
              style: TextStyle(
                color: Color(0xFFFFFFFF), //fixo
                fontSize: 20

              ),
            ),
            Text(
              _descriptionEvent,
              style: TextStyle(
                color:  Color(0xFFFFFFFF), //fixo
                fontSize: 10
              ),
            ),
          ],
        ), 
        )
    );
  }
}