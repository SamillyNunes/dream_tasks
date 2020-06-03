import 'package:dream_tasks/stores/task_store.dart';
import 'package:mobx/mobx.dart';

part 'list_task_store.g.dart';

class ListTaskStore = _ListTaskStore with _$ListTaskStore;

abstract class _ListTaskStore with Store {
  
  @observable
  String newTask ="";

  @observable 
  double barValue = 0.0;

  @action
  void addBarValue(){   
    barValue = barValue + barValueTax;
  }

  @action
  void subBarValue(){
    barValue = barValue - barValueTax;
  }

  @action
  void restartBarValue(double newValue){
    int dones=0;
    for(TaskStore ts in tasks){
      if(ts.done){
        dones+=1;
      }
    }
    barValue = dones>0 ? dones*newValue : 0;
  }

  @observable
  double barValueTax = 0.1;

  void setBarValueTax(int quantItems){
    barValueTax = 1/quantItems;
  }

  @action
  void setNewTask(String value) => newTask=value;

  ObservableList<TaskStore> tasks = ObservableList<TaskStore>();

  @action
  void addTask(){
    tasks.insert(0, new TaskStore(newTask));
    newTask="";
    setBarValueTax(tasks.length); 
    restartBarValue(barValueTax);
  }

  @action
  void removeTask(int index){
    tasks.removeAt(index);
    setBarValueTax(tasks.length); 
    restartBarValue(barValueTax);
  }

}