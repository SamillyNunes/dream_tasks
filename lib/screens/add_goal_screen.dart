import 'package:dream_tasks/global/app_themes.dart';
import 'package:dream_tasks/stores/day_store.dart';
import 'package:dream_tasks/stores/list_task_store.dart';
import 'package:dream_tasks/widgets/custom_check_widget.dart';
import 'package:dream_tasks/widgets/custom_drawer.dart';
import 'package:dream_tasks/widgets/custom_input.dart';
import 'package:dream_tasks/widgets/custom_select_weekday.dart';
import 'package:flutter/material.dart';

const String _defaultFontFamily = 'Raleway';

class AddGoalScreen extends StatefulWidget {
  final ListTaskStore _listTaskStore;
  final DayStore _dayStore;

  AddGoalScreen(this._listTaskStore, this._dayStore);

  @override
  _AddGoalScreenState createState() => _AddGoalScreenState(this._listTaskStore, this._dayStore);
}

class _AddGoalScreenState extends State<AddGoalScreen> {
  
  final ListTaskStore _listTaskStore;
  final DayStore _dayStore;
  DateTime _dateTime;

  _AddGoalScreenState(this._listTaskStore, this._dayStore);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _dateTime = _dayStore.dateSelected;
  }

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
              child: _dateInput(context), 
              
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
                  
                  _listTaskStore.addTask(_dateTime, _dayStore.dateSelected);
                  
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

  Widget _dateInput(BuildContext context){
    return InkWell(
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: 'Data:',
          labelStyle: TextStyle(
            color: Theme.of(context).primaryColor,
            fontFamily: _defaultFontFamily //ver isso aqui q n ta de acordo com a fonte padrao
          ),
          
          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Theme.of(context).primaryColor)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              '${_dateTime.day} de ${_dateTime.month} de ${_dateTime.year}',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 20
              ),
              
            ),
            IconButton(
              icon: Icon(
                Icons.date_range,
                color: Theme.of(context).primaryColor,
              ), 
              onPressed: () async{
                DateTime date = await showDatePicker(
                  context: context, 
                  initialDate: DateTime.now(), 
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2030)
                );
                setState(() {
                  _dateTime = date;  
                });
                
              }
            )
          ],
        ),
      ),
    );
  }
}