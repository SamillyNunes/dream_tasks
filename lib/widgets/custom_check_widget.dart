import 'package:flutter/material.dart';

class CustomCheckWidget extends StatelessWidget {
  final bool checked;
  final Color color;
  final Color borderColor;
  
  CustomCheckWidget(this.checked, {this.color=const Color(0xFF000000), this.borderColor});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: 22,
          height: 22,          
          decoration: BoxDecoration(
            border: borderColor!=null ? Border.all(color: borderColor) : Border.all(color: Color(0xFF0CCF4F)),
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
          color: checked ?  color : Colors.transparent,
        ) 
      ],
    );
  }
}