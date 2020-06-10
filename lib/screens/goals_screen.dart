import 'package:dream_tasks/screens/add_goal_screen.dart';
import 'package:dream_tasks/widgets/custom_drawer.dart';
import 'package:dream_tasks/widgets/day_widget.dart';
import 'package:dream_tasks/widgets/goal_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

const String _defaultFontFamily = 'Raleway';
class GoalsScreen extends StatefulWidget {
  @override
  _GoalsScreenState createState() => _GoalsScreenState();
}

class _GoalsScreenState extends State<GoalsScreen> {
  
  int _day;
  int _weekDay;

  int computeWeekDay(int day){
    print("Day: $day");
    int result = day <0 ? 7+(day) : (day>7 ? day-7 : day); //o ultimo eh mais um pra corrigir um bug
    print("rsult: $result");
    return result;
  }

  @override
  void initState() {
    super.initState();
    _day = DateTime.now().day;
    _weekDay =DateTime.now().weekday;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        endDrawer: CustomDrawer(),
        body: Column(
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
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                DayWidget(_day-2,  computeWeekDay(_weekDay-2)),
                SizedBox(width: 10,),
                DayWidget(_day-1, computeWeekDay(_weekDay-1)),
                SizedBox(width: 10,),
                DayWidget(_day, _weekDay, currentDay: true),
                SizedBox(width: 10,),
                DayWidget(_day+1, computeWeekDay(_weekDay+1)),
                SizedBox(width: 10,),
                DayWidget(_day+2, computeWeekDay(_weekDay+2)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Text(
                    'Metas',
                    style: TextStyle(
                      fontFamily: _defaultFontFamily,
                      color: Theme.of(context).primaryColor,
                      fontSize: 40
                    ),
                  )
                ),
                Padding(
                  padding: EdgeInsets.only(right:20),
                  child: Container(
                    padding: EdgeInsets.all(5),
                    height: MediaQuery.of(context).size.height*0.08,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: Color(0xFF0CCF4F))
                    ),
                    child: FlatButton(
                      onPressed: (){
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context)=>AddGoalScreen())
                        );
                      },
                      child: Text(
                        '+ Adicionar',
                        style: TextStyle(
                          color: Color(0xFF0CCF4F)
                        ),
                      ),
                    ),
                  )
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Container(
                height: MediaQuery.of(context).size.height*0.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  border: Border.all(color: Color(0xFF7A928F))
                ),
                child: ListView(
                  padding: EdgeInsets.all(20),
                  children: <Widget>[
                    GoalTileWidget("Lavar louça",),
                    GoalTileWidget("Estudar flutter", checked: true,),
                    GoalTileWidget("Estudar investimentos", checked: true,),
                    GoalTileWidget("Estudar investimentos", checked: true,),
                    GoalTileWidget("Cantar", checked: true,),
                  ],
                ),
              ),
            ),
            Observer(
              builder: (_){
                return LinearPercentIndicator(
                  percent: 0.7,
                  lineHeight: 12.0,
                  linearStrokeCap: LinearStrokeCap.butt, //para deixar reto
                  backgroundColor: Theme.of(context).primaryColor,
                  linearGradient: LinearGradient(
                    colors: [
                      Color(0xFF0CCF4F),
                      Color(0xFF22BFC3),
                    ]
                  ),
                );
              }
            )
          ],
          
        ),
      )
    );
  }
}