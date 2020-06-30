import 'package:flutter/material.dart';

class HomeGoalWidget extends StatelessWidget {

  final int quantity;
  final bool active;

  HomeGoalWidget(this.quantity,this.active);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        height: MediaQuery.of(context).size.height*0.1,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: active ? 
            Theme.of(context).accentColor 
            : Theme.of(context).disabledColor,
          borderRadius: BorderRadius.all(Radius.circular(15)),
          boxShadow: active ? [
            BoxShadow(
              color: Theme.of(context).primaryColor,
              offset: Offset.fromDirection(1, 6),
              blurRadius: 10
            )
          ] : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$quantity',
              style: TextStyle(
                color:Color(0xFFFFFFFF), //cor fixa em ambos os temas
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
            Text(
              active ? 'Concluídos' : 'Pendentes',
              style: TextStyle(
                color: Color(0xFFFFFFFF), //cor fixa em ambos os temas
                fontSize: 8
              ),
            )
          ],
        ),
      ),
    );
  }
}