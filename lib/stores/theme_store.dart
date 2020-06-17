import 'package:dream_tasks/global/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'theme_store.g.dart';

class ThemeStore = _ThemeStore with _$ThemeStore;

abstract class _ThemeStore with Store {
  @observable
  bool dark = true;

  @action
  void toggleDark() => dark = dark? false : true;

  @observable
  ThemeData themeData = CustomTheme().darkTheme();

  @action
  void changeTheme(){
    print("dark: "+dark.toString());
    themeData= dark ? CustomTheme().lightTheme() : CustomTheme().darkTheme();
    toggleDark();
  }
}