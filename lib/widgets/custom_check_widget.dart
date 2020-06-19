import 'package:dream_tasks/stores/theme_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
            border: borderColor!=null ? Border.all(color: borderColor) : Border.all(color: Theme.of(context).accentColor),
            gradient: checked ? Provider.of<ThemeStore>(context).defaultGradient : null
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