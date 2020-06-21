import 'package:dream_tasks/stores/task_store.dart';
import 'package:mobx/mobx.dart';

part 'list_projects_store.g.dart';

class ListProjectsStore = _ListProjectsStore with _$ListProjectsStore;

abstract class _ListProjectsStore with Store{ //levantar excecao se o projeto ja existir

  @observable
  String projectName;

  @action
  void setProject(String value) => projectName = value;

  @observable
  String temporaryTaskName;

  @action
  void setTemporaryTaskName(String newValue){ 
    temporaryTaskName = newValue;
  }

  ObservableList<String> temporaryTasks = ObservableList<String>();

  @action
  void addTemporaryTask(){
    if(temporaryTaskName!=""){
      temporaryTasks.add(temporaryTaskName);
      temporaryTaskName="";
    }
  }


  @action
  void removeTemporaryTask(int index){
    temporaryTasks.removeAt(index);
  } 

  ObservableMap<String, ObservableList<TaskStore>> projects = ObservableMap<String, ObservableList<TaskStore>>();

  @action
  void addProject(){
    projects.addAll(
      {
        projectName: ObservableList<TaskStore>()
      }
    );
    
    for(String s in temporaryTasks){
      projects[projectName].add(new TaskStore(s));
    }

    /* barra de progresso 
     */
    setBarValueTax(projects[projectName].length); //o numero vai ser fixo, entao ja seta direitinho com o tanto de metas
    print("tax:"+barValueTax.toString());
    /* /barra de progresso 
     */

    temporaryTasks.clear();

  }

  /* OBSERVABLES TO THE PROGRESS BAR
  */
  
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
    for(TaskStore ts in projects[key]){
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

}