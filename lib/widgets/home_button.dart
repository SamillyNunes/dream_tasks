import 'package:flutter/material.dart';

const String TEXTOS_SIMPLES_FAMILY = "Raleway";

class HomeButton extends StatelessWidget {

  final String title;
  final IconData icon;
  final Color color;
  final double left;
  final double right;
  final double top;
  final Widget screen;
  //funcao?

  HomeButton(this.title,this.icon,this.color, this.left, this.right, this.top, this.screen);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: this.left, right: this.right, top: this.top),
      child: Container(
        height: 20,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(color:this.color, width:2),
          color: this.color
        ),
        child: FlatButton(
          onPressed: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context)=>screen
              )
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Icon(
                this.icon,
                color: Theme.of(context).primaryColor,
                size: 50,
              ),
              Text(
                this.title,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 20,
                  fontFamily: TEXTOS_SIMPLES_FAMILY
                ),
              )
            ],
          )
        )
      ),
    );

  }
}