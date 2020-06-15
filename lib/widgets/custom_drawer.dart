import 'package:dream_tasks/screens/settings_screen.dart';
import 'package:dream_tasks/widgets/drawer_item_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dream_tasks/stores/theme_store.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.2,
      child: Drawer(
        child: Container(
          color: Theme.of(context).primaryColor,
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
              DrawerItemButton(0, selected: true,),
              DrawerItemButton(1),
              DrawerItemButton(2),
              DrawerItemButton(3),
              DrawerItemButton(4)
            ],
          )
        ),
      ),
    );
  }
}