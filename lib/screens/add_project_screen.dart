import 'package:dream_tasks/stores/list_projects_store.dart';
import 'package:flutter/material.dart';

const String _defaultFontFamily = 'Raleway';


class AddProjectScreen extends StatelessWidget {
  
  List<String> temporaryTasks = List<String>();

  ListProjectsStore _listProjectsStore = ListProjectsStore();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:Scaffold(
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
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Text(
                'Adicionar projeto',
                style: TextStyle(
                  fontFamily: _defaultFontFamily,
                  color: Theme.of(context).primaryColor,
                  fontSize: 40
                ),
              )
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                onChanged: _listProjectsStore.setProject,
                decoration: InputDecoration(
                  labelText: 'Nome:',
                  labelStyle: TextStyle(
                    color: Theme.of(context).primaryColor
                  ),
                  enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor, //fixo se for o nome
                  )
                ),
                ),
              )
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                'Metas do projeto:',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 20
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextFormField(
                onChanged: _listProjectsStore.setTemporaryTaskName,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.add_box,
                      color: Theme.of(context).primaryColor,
                    ), 
                    onPressed: (){
                      print(_listProjectsStore.temporaryTaskName);
                      _listProjectsStore.addTemporaryTask();
                    }
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor, //fixo se for o nome
                    )
                  ),
                ),
              )
            ),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            //   child: Container(
            //     height: MediaQuery.of(context).size.height*0.5,
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.all(Radius.circular(10)),
            //       border: Border.all(color: Theme.of(context).disabledColor)
            //     ),
            //     child: Text('ola testando '),
            //   ),
            // )
          ],
        ),
      )
    );
  }
}