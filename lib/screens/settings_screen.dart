import 'package:dream_tasks/stores/theme_store.dart';
import 'package:dream_tasks/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  @override
  Widget build(BuildContext context) {
    ThemeStore _themeStore = Provider.of<ThemeStore>(context);

    return SafeArea(
      child: Scaffold(
        endDrawer: CustomDrawer(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.chevron_left,
                color: Theme.of(context).primaryColor,
                size: 40,
              ), 
              onPressed: (){
                Navigator.of(context).pop();
              }
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                'Configurações',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 40
                ),
              )
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                
                Padding(
                  padding: EdgeInsets.only(top: 50, left: 20),
                  child: Text(
                    'Modo noturno?',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize:20 
                    ),
                  )
                ),
                Padding(
                  padding: EdgeInsets.only(top: 40, left: 20),
                  child: Switch(
                    value: _themeStore.dark, 
                    onChanged: (value){
                      _themeStore.changeTheme();  
                    },
                    activeColor: Theme.of(context).accentColor,
                  )
                ),
                
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                
                Padding(
                  padding: EdgeInsets.only(top: 50, left: 20),
                  child: Text(
                    'Gradiente:',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize:20 
                    ),
                  )
                ),
                Padding(
                  padding: EdgeInsets.only(top: 40, left: 20),
                  child: Switch(
                    value: _themeStore.greenGradient, 
                    onChanged: (value){
                      _themeStore.changeGradient();  
                    },
                    activeColor: Theme.of(context).accentColor,
                    inactiveThumbColor: Color(0xFFD9328E),
                    inactiveTrackColor: Color.fromRGBO(217, 50, 142, 0.5),
                  )
                ),
                
              ],
            )
          ]
        )
      )
    );
  }
}


