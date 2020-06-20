import 'package:dream_tasks/stores/list_task_store.dart';
import 'package:mobx/mobx.dart';

part 'task_store.g.dart';

class TaskStore = _TaskStore with _$TaskStore;

abstract class _TaskStore with Store{

  _TaskStore(this.goalTitle, this.date);

  final String goalTitle;
  final DateTime date;

  @observable
  bool done = false;  

  @action
  bool toggle(){
    done=!done;  
    return done;
  }

}