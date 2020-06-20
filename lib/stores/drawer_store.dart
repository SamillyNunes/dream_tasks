import 'package:mobx/mobx.dart';

part 'drawer_store.g.dart';

class DrawerStore = _DrawerStore with _$DrawerStore;

abstract class _DrawerStore with Store{

  @observable
  int selectedIndex = 0;

  @action
  void setIndex(int newValue) => selectedIndex = newValue;

}