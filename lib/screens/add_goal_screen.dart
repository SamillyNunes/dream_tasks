import 'package:dream_tasks/global/app_themes.dart';
import 'package:dream_tasks/stores/list_task_store.dart';
import 'package:dream_tasks/widgets/custom_check_widget.dart';
import 'package:dream_tasks/widgets/custom_drawer.dart';
import 'package:dream_tasks/widgets/custom_input.dart';
import 'package:dream_tasks/widgets/custom_select_weekday.dart';
import 'package:flutter/material.dart';

const String _defaultFontFamily = 'Raleway';

class AddGoalScreen extends StatelessWidget {

  final ListTaskStore _listTaskStore;

  AddGoalScreen(this._listTaskStore);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        endDrawer: CustomDrawer(),
        body: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.35,
              decoration: BoxDecoration(
                gradient: CustomTheme().defaultGradient(),
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(40))
              ),
              child: Column(
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
                  Padding(
                    padding: EdgeInsets.only(left: 20, top: 10),
                    child: Text(
                      'Adicione uma meta',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontFamily: _defaultFontFamily,
                        fontSize: 30
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left:20),
                    child: CustomInput("Nome:", _listTaskStore, nome: true),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left:20),
              child: CustomInput("Descrição:", _listTaskStore)
            ),
            Padding(
              padding: EdgeInsets.only(left:20),
              child: CustomInput("Data:", _listTaskStore,icon: Icons.calendar_today)
            ),
            Padding(
              padding: EdgeInsets.only(left:20),
              child: CustomInput("Horário:",_listTaskStore, icon: Icons.access_time)
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'Repetir meta?',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontFamily: _defaultFontFamily
                    ),
                  ),
                ),
                CustomCheckWidget(true, color: Theme.of(context).primaryColor,),
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
                  gradient: CustomTheme().defaultGradient(),
                  borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child: FlatButton(
                onPressed: (){
                  print(_listTaskStore.newTask);
                  _listTaskStore.addTask();
                  print(_listTaskStore.tasks);
                  Navigator.of(context).pop();
                }, 
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