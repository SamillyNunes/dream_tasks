import 'package:dream_tasks/screens/settings_screen.dart';
import 'package:dream_tasks/stores/drawer_store.dart';
import 'package:dream_tasks/widgets/drawer_item_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dream_tasks/stores/theme_store.dart';

class CustomDrawer extends StatelessWidget {

  static DrawerStore _drawerStore = DrawerStore();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.2,
      child: Drawer(
        child: Container(
          color: Theme.of(context).cardColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              FlatButton(
                onPressed: (){
                  Navigator.of(context).pop();
                }, 
                child: Provider.of<ThemeStore>(context).dark ? 
                        Image.asset('images/icons/back-three-lines.png')
                        : Image.asset('images/icons/light-theme/back-three-lines-light.png')
              ),
              DrawerItemButton(0, _drawerStore),
              DrawerItemButton(1, _drawerStore),
              DrawerItemButton(2, _drawerStore),
              DrawerItemButton(3, _drawerStore),
              DrawerItemButton(4, _drawerStore),
            ],
          )
        ),
      ),
    );
  }
}