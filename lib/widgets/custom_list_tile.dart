import 'package:dream_tasks/stores/list_task_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CustomListTile extends StatelessWidget {

  final Color _backgroundColor = Colors.purple[300];
  final ListTaskStore lts;
  final int index;
  
  CustomListTile(this.lts, this.index);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context){
        return Slidable(
          child: ListTile(
            onTap: (){
              bool value = lts.tasks[index].toggle();
              value ? lts.addBarValue() : lts.subBarValue();
            },
            title: Text(
              lts.tasks[index].goalTitle,
              style: TextStyle(
                fontSize: 15,
                decoration: lts.tasks[index].done ? TextDecoration.lineThrough : null
              ),
            ),
            
            leading: lts.tasks[index].done ? 
              Icon(Icons.check_box, color: _backgroundColor,) : 
              Icon(Icons.check_box_outline_blank,
            ),
          ), 
          actionPane: SlidableBehindActionPane(),
          secondaryActions: <Widget>[
            IconSlideAction(
              caption: "Excluir tarefa",
              color: Colors.red,
              icon: Icons.delete_outline,
              onTap: (){
                lts.removeTask(index);
              },
            ),
          ],
          
        );
      }
    );
  }
}