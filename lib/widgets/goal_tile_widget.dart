import 'package:dream_tasks/stores/list_projects_store.dart';
import 'package:dream_tasks/stores/list_task_store.dart';
import 'package:dream_tasks/widgets/custom_check_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class GoalTileWidget extends StatelessWidget {
  final ListTaskStore listTaskStore;
  final ListProjectsStore listProjectsStore;
  final String projectName;
  final int index;
  final String dateKey;
  GoalTileWidget(this.index, {this.listTaskStore,this.dateKey, this.projectName, this.listProjectsStore});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Slidable(
        actionPane: SlidableBehindActionPane(),
        child: Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          child: Observer(
            builder: (_){
              bool isGoalDone = listTaskStore!=null? 
                                listTaskStore.tasksMap[dateKey][index].done
                                : listProjectsStore.projects[projectName][index].done;

              return ListTile(
                onTap: (){
                  if(listTaskStore!=null){
                    bool value = listTaskStore.tasksMap[dateKey][index].toggle();
                    if(value){
                      listTaskStore.addBarValue();
                      listTaskStore.incrementDones();
                      listTaskStore.decrementPending();
                    } else {
                      listTaskStore.subBarValue();
                      listTaskStore.decrementDones();
                      listTaskStore.incrementPending();
                    }
                  } else {

                  }
                  
                },
                leading: listTaskStore!=null ?
                           CustomCheckWidget(isGoalDone)
                           : CustomCheckWidget(isGoalDone),
                title: Text(
                  listTaskStore!=null ?
                    listTaskStore.tasksMap[dateKey][index].goalTitle
                    : listProjectsStore.projects[projectName][index].goalTitle,
                  style: TextStyle(
                    color: isGoalDone ? 
                      Theme.of(context).disabledColor 
                      : Theme.of(context).accentColor,
                  ),
                ),
              );
            },
          ),
        ),
        secondaryActions: <Widget>[
          IconSlideAction(
            caption: "Excluir",
            color: Colors.red,
            icon: Icons.delete_outline,
            onTap: (){
              // lts.removeTask(index);
            },
          )
        ],
      )
    );
  }
}