import 'package:dream_tasks/screens/add_project_screen.dart';
import 'package:dream_tasks/stores/list_projects_store.dart';
import 'package:dream_tasks/stores/list_task_store.dart';
import 'package:dream_tasks/widgets/custom_drawer.dart';
import 'package:dream_tasks/widgets/days_sequence_widget.dart';
import 'package:dream_tasks/widgets/home_check_widget.dart';
import 'package:dream_tasks/widgets/home_goal_widget.dart';
import 'package:dream_tasks/widgets/project_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

const String _defaultFontFamily = 'Raleway';

class HomeScreen extends StatelessWidget {

  final ListProjectsStore _listProjectsStore = ListProjectsStore();

  @override
  Widget build(BuildContext context) {
    ListTaskStore _listTaskStore = Provider.of<ListTaskStore>(context);

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
                alignment: Alignment.centerLeft,
                height: MediaQuery.of(context).size.height*0.3,
                child: Observer(
                  builder: (context){
                    if(_listProjectsStore.projects.length==0){
                      return Padding(
                        padding: EdgeInsets.only(left:20),
                        child: _newProject(context),
                      );
                    } else{
                      return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _listProjectsStore.projects.length,
                      itemBuilder: (context,index){
                        String name = _listProjectsStore.projects.keys.toList()[index];
                        if(index==_listProjectsStore.projects.length-1){
                          return Row(
                            children: <Widget>[
                              ProjectWidget(name, 0.1, _listProjectsStore),
                              _newProject(context)
                            ],
                          );
                        } else {
                          return ProjectWidget(name, 0.1, _listProjectsStore);
                        }
                      }
                    );
                    }
                    
                  },
                )
              ),
            
              
              // Container(
              //   height: MediaQuery.of(context).size.height*0.3,
              //   // width: MediaQuery.of(context).size.width*1,  
              //   child: Row(
              //     // scrollDirection: Axis.horizontal,
              //     children: <Widget>[
              //       Observer(
              //         builder: (context){
              //           return ListView.builder(
              //             itemCount: _listProjectsStore.projects.length,
              //             itemBuilder: (context,index){
              //               String name = _listProjectsStore.temporaryTasks[index];
              //               return ProjectWidget(name,0.1);
              //             }
              //           );
              //         },
              //       ),
              //       _newProject(context)
              //     ],
              //   )
              // )
                
                // ListView(
                //   scrollDirection: Axis.horizontal,
                //   children: <Widget>[
                //     ProjectWidget('Flutter', 0.5),
                //     ProjectWidget('Fitness', 0.1),
                //     ProjectWidget('Teste', 0.9),
                //     _newProject(context)
                //   ],
                // )
              // )
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
                      HomeGoalWidget(
                        _listTaskStore.dones, 
                        true
                      ),
                      HomeGoalWidget(
                        _listTaskStore.pending, 
                        false
                      ),
                    ],
                  ),
                  Container( //caixa das metas
                    width: MediaQuery.of(context).size.width*0.6,
                    height: MediaQuery.of(context).size.height*0.2,
                    decoration: BoxDecoration(
                      border: Border.all(color: Theme.of(context).disabledColor),
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
                  color: Theme.of(context).disabledColor,
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

  
  Widget _newProject(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context)=>AddProjectScreen(_listProjectsStore)
          )
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.add_circle_outline,
            color: Theme.of(context).primaryColor,
            size: 40,

          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              'Adicionar',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontFamily: _defaultFontFamily
              ),
            ),
          ),
        ],
      ),
    );
  }
}



