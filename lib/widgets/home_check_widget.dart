import 'package:flutter/material.dart';

const String _defaultFontFamily = 'Raleway';

class HomeCheckWidget extends StatelessWidget {
  final String title;
  final bool checked;

  HomeCheckWidget(this.title,this.checked);

  @override
  Widget build(BuildContext context) {
    return Container(
    height: MediaQuery.of(context).size.height*0.07,
    // padding: EdgeInsets.all(10),
     decoration: BoxDecoration(
       color: Color(0xFF7A928F),
       borderRadius: BorderRadius.all(Radius.circular(10))
     ), 
     child: Row(
       children: <Widget>[
         checked ? 
          Padding(
            padding: EdgeInsets.all(12),
            child: Icon(
              Icons.check,
              color: Color(0xFF0CCF4F),
            )
          ) :
          IconButton(
            icon: Icon(
              Icons.check_box_outline_blank,
              color: Theme.of(context).primaryColor,
            ), 
            onPressed: (){}
          ),
        VerticalDivider(
          color: Colors.white30,
        ),
        Text(
          this.title,
          style: TextStyle(
            color: checked ? 
              Color(0xFF0CCF4F) : 
              Theme.of(context).primaryColor ,
            fontSize: 15,
            fontFamily: _defaultFontFamily,
            fontWeight: FontWeight.bold
          ),
        )
       ],
     ),
    );
  }
}