import 'package:dream_tasks/models/day_event.dart';
import 'package:mobx/mobx.dart';

part 'list_event_store.g.dart';

class ListEventStore = _ListEventStore with _$ListEventStore;

abstract class _ListEventStore with Store {

  @observable
  DateTime dateSelected = DateTime.now();

  @action
  void changeDaySelected(DateTime newDate){
    print("Entrou");
    dateSelected = newDate;
  }
  
  ObservableMap<String,List<DayEvent>> events = ObservableMap<String,List<DayEvent>>();

  @action
  void addEvent(DateTime date){
    String chave = date.day.toString()+"0"+date.month.toString()+date.year.toString();

    //Se nao tiver a chave, ele cria uma nova
    if(!events.containsKey(chave)){
      events.addAll({
        '$chave':[]
      });
    } 
    events[chave].add(new DayEvent(nameEvent, descriptionEvent, date));

  }

  
    @observable
    String nameEvent;

    @action
    void setNameEvent(String newName) => nameEvent = newName;

    
    @observable
    String descriptionEvent;

    @action
    void setDescriptionEvent(String newDesc) => descriptionEvent = newDesc;
    
}
