import 'package:mobx/mobx.dart';

part 'day_store.g.dart';

class DayStore = _DayStore with _$DayStore;

abstract class _DayStore with Store{

  @observable
  DateTime dateSelected = DateTime.now();

  @action
  void changeDaySelected(DateTime newDate) => dateSelected = newDate;

}

