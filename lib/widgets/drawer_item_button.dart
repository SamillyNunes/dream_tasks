import 'package:dream_tasks/screens/calendar_screen.dart';
import 'package:dream_tasks/screens/goals_screen.dart';
import 'package:dream_tasks/screens/home_screen.dart';
import 'package:dream_tasks/screens/settings_screen.dart';
import 'package:dream_tasks/stores/drawer_store.dart';
import 'package:dream_tasks/stores/theme_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class DrawerItemButton extends StatelessWidget {
  final int index;
  DrawerStore _drawerStore;
  
  DrawerItemButton(this.index);


  final List<String> _itemsIcons = [
    'images/icons/home-icon.png',
    'images/icons/calendar-icon.png',
    'images/icons/check-icon.png',
    'images/icons/statitics-icon.png',
    'images/icons/settings-icon.png',
  ];

  final List<String> _itemsSelectedIcons = [
    'images/icons/home-icon-selected.png',
    'images/icons/calendar-icon-selected.png',
    'images/icons/check-icon-selected.png',
    'images/icons/statitics-icon-selected.png',
    'images/icons/settings-icon-selected.png',
  ];

  final List<String> _itemsLightIcons = [
    'images/icons/light-theme/home-icon-dark.png',
    'images/icons/light-theme/calendar-icon-dark.png',
    'images/icons/light-theme/check-icon-dark.png',
    'images/icons/light-theme/statitics-icon-dark.png',
    'images/icons/light-theme/settings-icon-dark.png',
  ];


  final List<Widget> _pages = [
    HomeScreen(),
    CalendarScreen(),
    GoalsScreen(),
    GoalsScreen(),
    SettingsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    _drawerStore = Provider.of<DrawerStore>(context);
    
    return GestureDetector(
      onTap: (){
        _drawerStore.setIndex(index);
        Navigator.of(context).pop();
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context)=>_pages[index])
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width*0.15,
        height: MediaQuery.of(context).size.height*0.10,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColorDark,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Color(0xFF000000),
              offset: Offset(2, 2)
            )
          ],
        ),
        child: Observer(
          builder: (context){
            return index==_drawerStore.selectedIndex ? 
                    Image.asset(_itemsSelectedIcons[index]) //se tiver selecionado
                      : Provider.of<ThemeStore>(context).dark ? //se nao tiver sleecionado entao vai ver os temas
                        Image.asset(_itemsIcons[index]) //tema dark
                        : Image.asset(_itemsLightIcons[index]);
          },
        ),
      )
    );
  }
}