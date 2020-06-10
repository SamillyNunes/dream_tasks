import 'package:flutter/material.dart';

class CustomCheckWidget extends StatelessWidget {
  final bool checked;
  
  CustomCheckWidget(this.checked);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: 22,
          height: 22,          
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xFF0CCF4F)),
            gradient: checked ? LinearGradient(
              colors: [
                Color(0xFF0CCF4F),
                Color(0xFF22BFC3),
              ]
            ) : null
          ),
        ),
        Image.asset(
          'images/icons/small-check-icon.png',
          width: 25,
          color: checked ?  null : Colors.transparent,
        ) 
      ],
    );
  }
}