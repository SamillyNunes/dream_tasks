import 'package:dream_tasks/screens/project_screen.dart';
import 'package:dream_tasks/stores/list_projects_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
class ProjectWidget extends StatelessWidget {

  final String name;
  final double value;
  final ListProjectsStore _listProjectsStore;

  ProjectWidget(this.name, this.value, this._listProjectsStore);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context)=>ProjectScreen(name, _listProjectsStore))
        );
      },
      child: Padding(
        padding: EdgeInsets.only(right: 10),
        child: Container(
          // height: MediaQuery.of(context).size.height*0.15,
          width: MediaQuery.of(context).size.width*0.4,
          decoration: BoxDecoration(
            color: Color(0xFF7A928F),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal:10, vertical: 10),
                child: Observer(
                  builder: (context){
                    return CircularPercentIndicator(
                      radius: 100.0,
                      backgroundColor: Color(0xFFFFFFFF), //cor fixa em ambos os temas
                      percent: _listProjectsStore.barValue,
                      center: Text(
                        ((_listProjectsStore.barValue*100).round().toString())+"%",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFFFFFF)
                        ),
                      ),
                      linearGradient: LinearGradient(
                        colors: [
                          Color(0xFF0CCF4F),
                          Color(0xFF22BFC3),
                        ]
                      ),
                    );
                  },
                ),
              ),
              Text(
                name,
                style: TextStyle(
                  color: Color(0xFFFFFFFF), //cor fixa em ambos os temas
                  fontSize: 15
                ),
              )
            ],
          ),
        ),
      )
    );
  }

}