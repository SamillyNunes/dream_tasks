import 'package:dream_tasks/global/app_themes.dart';
import 'package:dream_tasks/screens/add_goal_screen.dart';
import 'package:dream_tasks/stores/list_task_store.dart';
import 'package:dream_tasks/widgets/custom_drawer.dart';
import 'package:dream_tasks/widgets/day_widget.dart';
import 'package:dream_tasks/widgets/goal_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

const String _defaultFontFamily = 'Raleway';
class GoalsScreen extends StatefulWidget {
  @override
  _GoalsScreenState createState() => _GoalsScreenState();
}

class _GoalsScreenState extends State<GoalsScreen> {
  
  int _day;
  int _weekDay;

  ListTaskStore _listTaskStore;

  int computeWeekDay(int day){
    int result = day <0 ? 7+(day) : (day>7 ? day-7 : day); //o ultimo eh mais um pra corrigir um bug
    return result;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _listTaskStore = Provider.of<ListTaskStore>(context);

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
                color: Theme.of(context).primaryColor,
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
                      border: Border.all(color: Theme.of(context).accentColor)
                    ),
                    child: FlatButton(
                      onPressed: (){
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context)=>AddGoalScreen(_listTaskStore))
                        );
                      },
                      child: Text(
                        '+ Adicionar',
                        style: TextStyle(
                          color: Theme.of(context).accentColor
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
                  border: Border.all(color: Theme.of(context).disabledColor)
                ),
                child: Observer(
                  builder: (_){
                    return ListView.builder(
                      padding: EdgeInsets.all(20),
                      itemCount: _listTaskStore.tasks.length,
                      itemBuilder: (context, index){
                        return GoalTileWidget(_listTaskStore, index);
                      }
                    );
                  }
                )
                
              ),
            ),
            Observer(
              builder: (_){
                return LinearPercentIndicator(
                  percent: _listTaskStore.barValue,
                  lineHeight: 12.0,
                  linearStrokeCap: LinearStrokeCap.butt, //para deixar reto
                  backgroundColor: Theme.of(context).primaryColor,
                  linearGradient: CustomTheme().defaultGradient(),
                );
              }
            )
          ],
          
        ),
      )
    );
  }
}