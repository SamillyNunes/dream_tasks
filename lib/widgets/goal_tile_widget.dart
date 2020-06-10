import 'package:dream_tasks/widgets/custom_check_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class GoalTileWidget extends StatelessWidget {
  final String title;
  final bool checked;

  GoalTileWidget(this.title,{this.checked=false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Slidable(
        actionPane: SlidableBehindActionPane(),
        child: Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          child: ListTile(
            leading: CustomCheckWidget(checked),
            title: Text(
              this.title,
              style: TextStyle(
                color: checked ? Color(0xFF7A928F) : Color(0xFF0CCF4F),
              ),
            ),
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