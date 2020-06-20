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
  void setTemporaryTaskName(String newValue) => temporaryTaskName = newValue;

  ObservableList<String> temporaryTasks = ObservableList<String>();

  @action
  void addTemporaryTask() => temporaryTasks.add(temporaryTaskName);

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

  }
}