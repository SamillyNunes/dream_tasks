import 'package:dream_tasks/stores/list_projects_store.dart';
import 'package:dream_tasks/widgets/goal_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:dream_tasks/stores/theme_store.dart';
class ProjectScreen extends StatelessWidget {
  final String name;
  final ListProjectsStore _listProjectsStore;

  ProjectScreen(this.name,this._listProjectsStore);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Text(
                name,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 40
                ),
              )
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
                  child: ListView.builder(
                    itemCount: _listProjectsStore.projects[name].length,
                    itemBuilder: (context,index){
                      return GoalTileWidget(index, projectName: name, listProjectsStore: _listProjectsStore,);
                    }
                  )
                ),
                
              ),
            ),
            Observer(
              builder: (_){
                return LinearPercentIndicator(
                  percent: _listProjectsStore.barValue, //implementar uma animacao pra quanto completar tudo
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