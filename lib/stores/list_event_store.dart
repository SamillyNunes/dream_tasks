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
  
  ObservableList<DayEvent> events = ObservableList<DayEvent>();
  ObservableMap<String,List<DayEvent>> events2 = ObservableMap<String,List<DayEvent>>();

  @action
  void addEvent(String titleEvent, String description, DateTime date){
    // events.add(new DayEvent(titleEvent, description, date));
    String chave = date.day.toString()+"0"+date.month.toString()+date.year.toString();
    print("chave::"+chave);
    events2[chave].add(new DayEvent(titleEvent, description, date));
    
  }
}
