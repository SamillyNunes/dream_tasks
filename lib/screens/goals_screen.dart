import 'package:dream_tasks/screens/add_goal_screen.dart';
import 'package:dream_tasks/stores/list_task_store.dart';
import 'package:dream_tasks/stores/task_store.dart';
import 'package:dream_tasks/widgets/custom_list_tile.dart';
import 'package:dream_tasks/widgets/day_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class GoalsScreen extends StatelessWidget {

  Color _backgroundColor = Colors.purple[300];

  final _scaffoldGlobalKey = GlobalKey<ScaffoldState>(); 
  // final _inputController = GlobalKey<Te

  ListTaskStore _listTaskStore = ListTaskStore();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldGlobalKey,
        // appBar: AppBar(
        //   title: Text("Metas diárias"),
        // ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                DayWidget(),
                SizedBox(width: 10,),
                DayWidget(),
                SizedBox(width: 10,),
                DayWidget(currentDay: true,),
                SizedBox(width: 10,),
                DayWidget(),
                SizedBox(width: 10,),
                DayWidget(),
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
                      fontSize: 40
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
                      color: _backgroundColor
                    ),
                    // color: _backgroundColor,
                    child: FlatButton(
                      child: Icon(Icons.add, color: Colors.white,),
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
                  color: Colors.white,
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

  void _addGoal(context){
    showModalBottomSheet(
      context: context, 
      shape:  RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(50.0), topRight: Radius.circular(50.0)),
      ),
      builder: (builder){
        return Container(
          height: MediaQuery.of(context).size.height*0.4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top:10),
                child: Center(
                  child: Text(
                    "Adicionar meta",
                    style: TextStyle(
                      color: _backgroundColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      
                    ),
                  ),
                )
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10,top: 10),
                child: Container(
                  width: MediaQuery.of(context).size.width*0.9,
                  child: TextFormField(
                    onChanged: _listTaskStore.setNewTask,
                    cursorColor: _backgroundColor,                
                    decoration: InputDecoration(
                      hoverColor: _backgroundColor,
                      focusColor: _backgroundColor,
                      hintText: "Nome da meta:",                  
                      prefixIcon: Icon(Icons.track_changes)
                    ),
                  )
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:90, left:10, right:10),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: RaisedButton(
                    // onPressed: _listTaskStore.addTask,
                    onPressed: (){
                    },
                    color: _backgroundColor,
                    child: Text(
                      "Adicionar",
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                  )
                ),
              )
            ],
          ),
        );
      }
    );
     
  }
}

