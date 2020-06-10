import 'package:dream_tasks/stores/list_task_store.dart';
import 'package:dream_tasks/widgets/day_repeat_widget.dart';
import 'package:flutter/material.dart';

class AddGoalScreen extends StatelessWidget {

  final ListTaskStore _listTaskStore;

  AddGoalScreen(this._listTaskStore);

  final TextStyle _titleStyle = TextStyle(
    fontSize: 35,
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontFamily: 'Raleway'
  );

  final Color _mainColor = Color.fromRGBO(161, 9, 62, 1);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/fundo.png"),
            fit: BoxFit.cover
          )
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: ListView(
            children: <Widget>[
              
              IconButton(
                padding: EdgeInsets.all(8),
                iconSize: 30,
                alignment: Alignment.centerLeft,
                icon: Icon(
                  Icons.keyboard_backspace,
                  color: Colors.white,
                ), 
                onPressed: (){
                  Navigator.of(context).pop();
                }
              ),
              Padding(
                padding: EdgeInsets.only(left:10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Adicione',
                      style: _titleStyle,
                    ),
                    Text(
                      'Uma meta',
                      style: _titleStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left:10),
                child: Container(
                  width: MediaQuery.of(context).size.width*0.5,
                  child: TextFormField(
                    onChanged:  _listTaskStore.setNewTask,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      
                    ),
                    decoration: InputDecoration(
                      labelText: 'Nome:',
                      labelStyle: TextStyle(color: Colors.white54),
                      
                      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white54)),
                    ),
                    cursorColor: Colors.lightBlue,
                  )
                )
              ),
              Container(
                padding: EdgeInsets.only(top: 20),
                height: MediaQuery.of(context).size.height*0.65,
                child: Card(
                  margin: EdgeInsets.all(0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                            suffixIcon: Icon(Icons.date_range),
                            labelText: 'Data:',
                            // labelStyle: TextStyle(color: Colors.grey[200]),
                            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: _mainColor)),
                            focusColor: _mainColor,
                            labelStyle: TextStyle(
                              color: _mainColor
                            )
                          ),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            suffixIcon: Icon(Icons.access_time),
                            labelText: 'Horário:',
                            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: _mainColor)),
                            focusColor: _mainColor,
                            labelStyle: TextStyle(
                              color: _mainColor
                            )
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              "Repetir meta?",
                              style: TextStyle(
                                color: _mainColor
                              ),
                            ),
                            Checkbox(
                              value: true,
                              tristate: true,
                              onChanged: (value){},
                              activeColor: _mainColor,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            DayRepeatWidget('Dom'),
                            DayRepeatWidget('Seg'),
                            DayRepeatWidget('Ter'),
                            DayRepeatWidget('Qua'),
                            DayRepeatWidget('Qui'),
                            DayRepeatWidget('Sex'),
                            DayRepeatWidget('Sab'),
                            
                          ],
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width*0.9,
                          margin: EdgeInsets.only(top:50),
                          child: RaisedButton(
                            onPressed: (){
                              _listTaskStore.addTask();
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              "Adicionar",
                              style: TextStyle(
                                color: Colors.white
                              ),
                            ),
                            color: _mainColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(16))
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ),
              )
              
            ],
          ),
        )
      )
    );
  }
}