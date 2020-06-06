import 'package:dream_tasks/screens/add_goal_screen.dart';
import 'package:dream_tasks/stores/list_task_store.dart';
import 'package:dream_tasks/widgets/custom_list_tile.dart';
import 'package:dream_tasks/widgets/day_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class GoalsScreen extends StatefulWidget {
  @override
  _GoalsScreenState createState() => _GoalsScreenState();
}

class _GoalsScreenState extends State<GoalsScreen> {
  final Color _backgroundColor = Colors.purple[300];
  final String _fontFamily = "Raleway";

  final _scaffoldGlobalKey = GlobalKey<ScaffoldState>(); 
  
  final ListTaskStore _listTaskStore = ListTaskStore();

  int _day;
  int _weekDay;

  //calculando o dia da semana para os dias antes e depois do dia atual
  int computeWeekDay(int day){
    return day <0 ? 7+(day) : (day>7 ? day-7 : day );
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
        key: _scaffoldGlobalKey,
        // backgroundColor: Color.fromRGBO(r, g, b, opacity),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
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
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "Metas",
                    style: TextStyle(
                      color: _backgroundColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      fontFamily: _fontFamily
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right:15),
                  child: Container(
                    padding: const EdgeInsets.all(0),
                    height: 45,
                    decoration: BoxDecoration(
                      border: Border.all(color:_backgroundColor, width: 1),
                      borderRadius: BorderRadius.horizontal(left:Radius.circular(100), right:Radius.circular(100)),
                      // color: _backgroundColor
                    ),
                    // color: _backgroundColor,
                    child: FlatButton(
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.add, color: _backgroundColor,),
                          Text(
                            'Add meta',
                            style: TextStyle(
                              color: _backgroundColor,
                              fontFamily: _fontFamily
                            ),
                          )
                        ],
                      ),
                      onPressed: (){
                        // _addGoal(context);
                        Navigator.of(context).push(
                        MaterialPageRoute(builder: (_)=>AddGoalScreen(_listTaskStore))
                      );
                      }
                    ),
                  )
                )
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Card(
                  color: Colors.grey[350],
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)
                  ),
                  child: Observer(
                    builder: (_){
                      return Padding(
                        padding: const EdgeInsets.all(16),
                        child: ListView.separated(
                          itemBuilder: (context,index){
                            return CustomListTile(
                              _listTaskStore,
                              index
                            );
                          }, 
                          separatorBuilder: (context,index){
                            return Divider();
                          }, 
                          itemCount: _listTaskStore.tasks.length
                        )
                      );
                    }
                  )
                )
              )
            ),
            Observer(
              builder: (_){
                return LinearProgressIndicator(
                  value: _listTaskStore.barValue,
                  backgroundColor: Colors.white,
                  valueColor: AlwaysStoppedAnimation<Color>(_backgroundColor),
                );
              }
            )
          ],
        ),
      )
    );
  }

}

