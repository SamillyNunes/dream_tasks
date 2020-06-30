import 'package:dream_tasks/stores/list_task_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

part 'task_store.g.dart';

class TaskStore = _TaskStore with _$TaskStore;

abstract class _TaskStore with Store{

  _TaskStore(this.goalTitle, {this.date, @required this.repeatDays});

  final String goalTitle;
  final DateTime date;
  final List<int> repeatDays;

  @observable
  bool done = false;  

  @action
  bool toggle(){
    done=!done;  
    return done;
  }

}