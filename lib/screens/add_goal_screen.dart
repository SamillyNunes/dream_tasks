import 'package:dream_tasks/widgets/custom_check_widget.dart';
import 'package:dream_tasks/widgets/custom_drawer.dart';
import 'package:dream_tasks/widgets/custom_input.dart';
import 'package:dream_tasks/widgets/custom_select_weekday.dart';
import 'package:flutter/material.dart';

const String _defaultFontFamily = 'Raleway';

class AddGoalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        endDrawer: CustomDrawer(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.35,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF0CCF4F),
                    Color(0xFF22BFC3),
                  ]
                ),
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(40))
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.chevron_left,
                      color: Color(0xFFFFFFFF),
                      size: 40,
                    ), 
                    onPressed: (){
                      Navigator.of(context).pop();
                    }
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, top: 10),
                    child: Text(
                      'Adicione uma meta',
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontFamily: _defaultFontFamily,
                        fontSize: 30
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left:20),
                    child: CustomInput("Nome:"),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left:20),
              child: CustomInput("Descrição:")
            ),
            Padding(
              padding: EdgeInsets.only(left:20),
              child: CustomInput("Data:", icon: Icons.calendar_today,)
            ),
            Padding(
              padding: EdgeInsets.only(left:20),
              child: CustomInput("Horário:", icon: Icons.access_time,)
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'Repetir meta?',
                    style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontFamily: _defaultFontFamily
                    ),
                  ),
                ),
                CustomCheckWidget(true, color: Color(0xFFFFFFFF),),
              ],
            ),
            Row(
              // crossAxisAlignment: CrossAxisAlignment.center
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CustomSelectWeekday('Seg'),
                CustomSelectWeekday('Ter'),
                CustomSelectWeekday('Qua'),
                CustomSelectWeekday('Qui'),
                CustomSelectWeekday('Sex'),
                CustomSelectWeekday('Sab'),
                CustomSelectWeekday('Dom'),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left:20, right: 20, top: 40),
              child: Container(
                width: MediaQuery.of(context).size.width*0.9,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF0CCF4F),
                      Color(0xFF22BFC3),
                    ]
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child: FlatButton(
                onPressed: (){}, 
                child: Text(
                  'Adicionar',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontFamily: _defaultFontFamily,
                    fontSize: 20
                  ),
                )
              ),
            )
          )
            
            
          ],
        ),
      )
    );
  }
}