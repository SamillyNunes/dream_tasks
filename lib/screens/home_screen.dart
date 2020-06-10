import 'package:dream_tasks/stores/list_task_store.dart';
import 'package:dream_tasks/widgets/custom_drawer.dart';
import 'package:dream_tasks/widgets/days_sequence_widget.dart';
import 'package:dream_tasks/widgets/home_check_widget.dart';
import 'package:dream_tasks/widgets/home_goal_widget.dart';
import 'package:dream_tasks/widgets/project_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

const String _defaultFontFamily = 'Raleway';

class HomeScreen extends StatelessWidget {

  ListTaskStore _listTaskStore = ListTaskStore();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        endDrawer: CustomDrawer(),
        drawerEdgeDragWidth: MediaQuery.of(context).size.width*0.1,
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
                    ProjectWidget('Flutter', 0.5),
                    ProjectWidget('Fitness', 0.1),
                    ProjectWidget('Teste', 0.9),
                    ProjectWidget('Fitness', 0.3),
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
                    child: Observer( //nao ta funfando pq o listview tem que ser um so para todas as paginas
                      builder: (_){
                        return ListView.builder(
                          padding: EdgeInsets.all(15),
                          itemCount: _listTaskStore.tasks.length,
                          itemBuilder: (context,index){
                            return Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: HomeCheckWidget(_listTaskStore.tasks[index].goalTitle, _listTaskStore.tasks[index].done)
                            );
                          }
                        );
                      },
                    )
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


