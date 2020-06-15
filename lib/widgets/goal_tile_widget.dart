import 'package:dream_tasks/stores/list_task_store.dart';
import 'package:dream_tasks/widgets/custom_check_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class GoalTileWidget extends StatelessWidget {
  final ListTaskStore _listTaskStore;
  final int index;

  GoalTileWidget(this._listTaskStore,this.index);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Slidable(
        actionPane: SlidableBehindActionPane(),
        child: Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          child: Observer(
            builder: (_){
              return ListTile(
                onTap: (){
                  bool value = _listTaskStore.tasks[index].toggle();
                  if(value){
                    _listTaskStore.addBarValue();
                    _listTaskStore.incrementDones();
                    _listTaskStore.decrementPending();
                  } else {
                    _listTaskStore.subBarValue();
                    _listTaskStore.decrementDones();
                    _listTaskStore.incrementPending();
                  }
                },
                leading: CustomCheckWidget(_listTaskStore.tasks[index].done),
                title: Text(
                  _listTaskStore.tasks[index].goalTitle,
                  style: TextStyle(
                    color: _listTaskStore.tasks[index].done ? 
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