import 'package:dream_tasks/global/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    if(dark){
      themeData = CustomTheme().lightTheme();
      _saveTheme('light');
    } else{
      themeData = CustomTheme().darkTheme();
      _saveTheme('dark');
    }
    toggleDark();
  }

  // @observable 
  // bool greenGradient = true; 

  // @action
  // void toggleGreenGradient() => greenGradient = greenGradient ? false : true;

  @observable
  LinearGradient defaultGradient = CustomTheme().greenGradient();

  // @action
  // void changeGradient(){
  //   defaultGradient= greenGradient ?CustomTheme().pinkGradient() : CustomTheme().greenGradient();
  //   toggleGreenGradient();
  // }

  void _saveTheme(String theme) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('theme', theme);
  }

  @action
  Future<void> getTheme() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    
    if(prefs.containsKey('theme')){
      if(prefs.getString('theme')=='light'){
        themeData = CustomTheme().lightTheme();
        dark = false;
      } else{
        themeData = CustomTheme().darkTheme();
        dark=true;
      }

    }
  }
}