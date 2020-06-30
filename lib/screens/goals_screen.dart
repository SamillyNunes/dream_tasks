import 'package:dream_tasks/screens/add_goal_screen.dart';
import 'package:dream_tasks/stores/day_store.dart';
import 'package:dream_tasks/stores/list_task_store.dart';
import 'package:dream_tasks/utils/utils.dart';
import 'package:dream_tasks/widgets/custom_drawer.dart';
import 'package:dream_tasks/widgets/day_widget.dart';
import 'package:dream_tasks/widgets/goal_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:dream_tasks/stores/theme_store.dart';

class GoalsScreen extends StatefulWidget {
  @override
  _GoalsScreenState createState() => _GoalsScreenState();
}

class _GoalsScreenState extends State<GoalsScreen> {
  
  DateTime _date;
  String dateKey;

  ListTaskStore _listTaskStore;
  DayStore _dayStore = DayStore();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _listTaskStore = Provider.of<ListTaskStore>(context);

    reaction(
      (_)=>_dayStore.dateSelected, 
      (dateSelected){
        dateKey = Utils.formatDateTime(dateSelected);
         _listTaskStore.setBarValueTax(_listTaskStore.tasksMap[dateKey].length);
        
        _listTaskStore.restartBarValue(
          dateKey
        );
      }
    );
    

  }

  @override
  void initState() {
    super.initState();
    _date = DateTime.now(); 
    dateKey = Utils.formatDateTime(_date);
    _dayStore.changeDaySelected(_date); //ja para iniciar com o dia atual

    
    
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
                DayWidget(_date.subtract(Duration(days: 2)), _dayStore),
                SizedBox(width: 10,),
                DayWidget(_date.subtract(Duration(days: 1)), _dayStore),
                SizedBox(width: 10,),
                DayWidget(_date,  _dayStore),
                SizedBox(width: 10,),
                DayWidget(_date.add(Duration(days: 1)),  _dayStore),
                SizedBox(width: 10,),
                DayWidget(_date.add(Duration(days: 2)),  _dayStore)
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
                          MaterialPageRoute(builder: (context)=>AddGoalScreen(_listTaskStore, _dayStore))
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
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Observer(
                    builder: (context){
                      dateKey = Utils.formatDateTime(_dayStore.dateSelected);
                      return Observer(
                        builder: (context){
                          if(_listTaskStore.tasksMap.containsKey(dateKey)){
                            return ListView.builder(
                              itemCount: _listTaskStore.tasksMap[dateKey].length, //ver isso, o ide
                              itemBuilder: (context,index){
                                return GoalTileWidget(index, dateKey:dateKey, listTaskStore: _listTaskStore);
                              }
                            );
                          } else {
                            return Container();
                          }
                        },
                      );
                    },
                  )
                ),
                
              ),
            ),
            Observer( //n funcionando pq tem q ser uma barra de acordo com o dia
              builder: (_){
                return LinearPercentIndicator(
                  percent: _listTaskStore.barValue,
                  lineHeight: 12.0,
                  linearStrokeCap: LinearStrokeCap.butt, //para deixar reto
                  backgroundColor: Theme.of(context).cardColor,
                  linearGradient: Provider.of<ThemeStore>(context).defaultGradient,
                );
              }
            )
          ],
          
        ),
      )
    );
  }

}