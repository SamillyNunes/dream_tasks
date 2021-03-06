import 'package:date_format/date_format.dart';
import 'package:dream_tasks/stores/task_store.dart';
import 'package:dream_tasks/utils/utils.dart';
import 'package:mobx/mobx.dart';

part 'list_task_store.g.dart';

class ListTaskStore = _ListTaskStore with _$ListTaskStore;

abstract class _ListTaskStore with Store {
  
  @observable
  String newTask ="";

  @observable 
  double barValue = 0.0; //sera correspondente a barra do dia atual

  @action
  void addBarValue(){   
    barValue = barValue + barValueTax;
  }

  @action
  void subBarValue(){
    barValue = barValue - barValueTax;
  }

  @action
  void restartBarValue(String key){
    int dones=0;
    for(TaskStore ts in tasksMap[key]){
      if(ts.done){
        dones+=1;
      }
    }
    barValue = dones>0 ? dones*barValueTax : 0;
  }

  @observable
  double barValueTax = 0.1;

  @action
  void setBarValueTax(int quantItems){
    barValueTax = 1/quantItems;
  }

  @action
  void setNewTask(String value) => newTask=value;

  ObservableMap<String, ObservableList<TaskStore>> tasksMap = ObservableMap<String, ObservableList<TaskStore>>();

  ObservableList<TaskStore> tasks = ObservableList<TaskStore>();

  @action
  void addTask(DateTime date, DateTime selectedDate, List<int> repeatDaysList){
    //formatando a atual data selecionada p calcular a barra
    final dateSelected = Utils.formatDateTime(selectedDate);
     //formatanto a data chave da meta
    final dateF = Utils.formatDateTime(date);

    if(tasksMap.containsKey(dateF)){ //se ja tiver a chave, so vai adicionar mais uma meta a essa data
      tasksMap[dateF].insert(0, new TaskStore(newTask,date: date, repeatDays:repeatDaysList ));
    } else {
      tasksMap.addAll( //se nao tiver, vai primeiro criar a chave
        {
          dateF:ObservableList<TaskStore>()
        }
      );
      tasksMap[dateF].insert(0, new TaskStore(newTask, date:date, repeatDays: repeatDaysList)); //e depois adicionar a tarefa na chave

    }

    print(tasksMap[dateF].first.repeatDays);

    if(dateSelected==dateF){ //se as duas datas forem iguais, vai ajeitar a barra de progresso
      setBarValueTax(tasksMap[dateF].length); 
      restartBarValue(dateF);
      incrementPending();
    }
    

    
    tasks.insert(0, new TaskStore(newTask, date:date));
    newTask="";
    
  }

  @action
  void removeTask(int index, String dateKey){
    tasksMap[dateKey][index].done ? decrementDones() : decrementPending(); //decrementando da contagem de tarefas do dia
    tasksMap[dateKey].removeAt(index);
    setBarValueTax(tasksMap[dateKey].length);
    restartBarValue(dateKey);
  }

  @observable
  int dones=0;

  @observable
  int pending=0;

  @action
  void incrementDones() => dones+=1;

  @action
  void decrementDones() => dones-=1;
  
  @action
  void incrementPending() => pending+=1;

  @action
  void decrementPending() => pending-=1;

}