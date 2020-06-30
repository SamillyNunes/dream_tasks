import 'package:dream_tasks/stores/list_projects_store.dart';
import 'package:dream_tasks/widgets/add_project_task_widget.dart';
import 'package:dream_tasks/widgets/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:dream_tasks/stores/theme_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class AddProjectScreen extends StatelessWidget {

  final ListProjectsStore _listProjectsStore ; //ver se o final vai atrapalhar o mobx

  AddProjectScreen(this._listProjectsStore);  
  
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:Scaffold(
        body: ListView(
          
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.35,
              decoration: BoxDecoration(
                gradient: Provider.of<ThemeStore>(context).defaultGradient,
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(40))
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.chevron_left,
                      color: Color(0xFFFFFFFF), //fixo
                      size: 40,
                    ), 
                    onPressed: (){
                      Navigator.of(context).pop();
                    }
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, top: 10),
                    child: Text(
                      'Adicione um projeto',
                      style: TextStyle(
                        color: Color(0xFFFFFFFF), //fixo
                        fontSize: 30
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left:20, right: 20),
                    child: CustomInput(
                      "Nome:", 
                      nome: true,
                      onCustomChange: _listProjectsStore.setProject,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Text(
                'Metas do projeto:',
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontSize: 20
                ),
              ),  
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              child: CustomInput(
                'Nome da meta:', 
                icon: Icons.add_box,
                onCustomSubmited: (value){
                  _listProjectsStore.addTemporaryTask();

                    //para limpar o campo depois de enviar
                    WidgetsBinding.instance.addPostFrameCallback(
                      (_)=>_controller.clear()
                    );
                  
                },
                onCustomChange: _listProjectsStore.setTemporaryTaskName,
                onSuffixPressed: (){
                  _listProjectsStore.addTemporaryTask();

                  //para limpar o campo depois de enviar
                  WidgetsBinding.instance.addPostFrameCallback(
                    (_)=>_controller.clear()
                  );
                },
                controller: _controller,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Container(
                height: MediaQuery.of(context).size.height*0.4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  border: Border.all(color: Theme.of(context).disabledColor)
                ),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Observer(
                    builder: (context){
                      return ListView.builder(
                        itemCount: _listProjectsStore.temporaryTasks.length,
                        itemBuilder: (context,index){
                          return AddProjectTaskWidget(
                            _listProjectsStore.temporaryTasks[index], 
                            (){
                              _listProjectsStore.removeTemporaryTask(index);  
                            }
                          );
                        }
                      );
                    },
                  )
                ),
                
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left:20, right: 20),
              child: Container(
                width: MediaQuery.of(context).size.width*0.9,
                decoration: BoxDecoration(
                  gradient: Provider.of<ThemeStore>(context).defaultGradient,
                  borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child: FlatButton(
                onPressed: (){
                  _listProjectsStore.addProject();
                  print(_listProjectsStore.projects);
                  Navigator.of(context).pop();
                }, 
                child: Text(
                  'Adicionar',
                  style: TextStyle(
                    color: Color(0xFFFFFFFF), //fixo
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