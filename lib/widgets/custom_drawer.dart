import 'package:dream_tasks/widgets/drawer_item_button.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.2,
      child: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            FlatButton(
              onPressed: (){
                Navigator.of(context).pop();
              }, 
              child: Image.asset('images/icons/back-three-lines.png')
            ),
            DrawerItemButton(0, selected: true,),
            DrawerItemButton(1),
            DrawerItemButton(2),
            DrawerItemButton(3),
          ],
        ),
      ),
    );
  }
}