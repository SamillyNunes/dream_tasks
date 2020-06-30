import 'package:flutter/material.dart';
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
              color: Theme.of(context).accentColor,
            )
          ) :
          IconButton(
            icon: Icon(
              Icons.check_box_outline_blank,
              color: Color(0xFFFFFFFF), //fixo
            ), 
            onPressed: (){}
          ),
        VerticalDivider(
          color: Colors.white30,
        ),
        Flexible(
          child: Text(
            this.title,
            overflow: TextOverflow.clip,
            style: TextStyle(
              color: checked ? 
                Theme.of(context).accentColor : 
                Color(0xFFFFFFFF) ,
              fontSize: 15,
              fontWeight: FontWeight.bold
            ),
          )
        ),
        
       ],
     ),
    );
  }
}