import 'package:dream_tasks/widgets/days_sequence_widget.dart';
import 'package:dream_tasks/widgets/home_check_widget.dart';
import 'package:dream_tasks/widgets/home_goal_widget.dart';
import 'package:dream_tasks/widgets/project_widget.dart';
import 'package:flutter/material.dart';

const String _defaultFontFamily = 'Raleway';

class HomeScreen extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: <Widget>[
            Padding(
              padding:EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                'Olá, Samilly!',
                style: TextStyle(
                  fontFamily: _defaultFontFamily,
                  color: Theme.of(context).primaryColor,
                  fontSize: 30
                ),
              )
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: DaysSequenceWidget(10, 6)
            ),
            _titleSections(context, 'Projetos'),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Container(
                height: MediaQuery.of(context).size.height*0.3,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    ProjectWidget('Flutter', 50),
                    ProjectWidget('Fitness', 10),
                    ProjectWidget('Teste', 90),
                    ProjectWidget('Fitness', 30),
                  ],
                )
              )
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: <Widget>[
                  Text(
                    'Metas diárias',
                    style: TextStyle(
                      fontFamily: _defaultFontFamily,
                      color: Theme.of(context).primaryColor,
                      fontSize: 20
                    ),
                  ),
                ],
              )
            ),
            Padding( // parte das metas
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      HomeGoalWidget(15, true),
                      HomeGoalWidget(10, false),
                    ],
                  ),
                  Container( //caixa das metas
                    width: MediaQuery.of(context).size.width*0.6,
                    height: MediaQuery.of(context).size.height*0.2,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFF7A928F)),
                      borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    child: ListView(
                      padding: EdgeInsets.all(15),
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: HomeCheckWidget('Estudar design', false),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: HomeCheckWidget('Estudar flutter', true),
                        ),
                      ],
                    ),
                  )

                ],
              )
            ), // fim secao de metas
            _titleSections(context, 'Produtividade'),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Container(
                height: MediaQuery.of(context).size.height*0.3,
                decoration: BoxDecoration(
                  color: Color(0xFF7A928F),
                  borderRadius: BorderRadius.all(Radius.circular(10))
                ),
              ),
            )

          ],
        ),
      )
    );
  }

  Widget _titleSections(BuildContext context,String title){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Text(
        title,
        style: TextStyle(
          fontFamily: _defaultFontFamily,
          color: Theme.of(context).primaryColor,
          fontSize: 20
        ),
      )
    );
  }
}


