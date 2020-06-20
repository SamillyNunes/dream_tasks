import 'package:dream_tasks/global/app_themes.dart';
import 'package:dream_tasks/screens/goals_screen.dart';
import 'package:dream_tasks/screens/home_screen.dart';
import 'package:dream_tasks/screens/settings_screen.dart';
import 'package:dream_tasks/stores/list_task_store.dart';
import 'package:dream_tasks/stores/theme_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider<ListTaskStore>(
      create: (_)=>ListTaskStore(),
      child: Provider<ThemeStore>(
        create: (_)=>ThemeStore(),
        child: Observer(
          builder: (context){
            print('testando');
            return MaterialApp(
              title: 'Dream Tasks',
              debugShowCheckedModeBanner: false,
              theme: Provider.of<ThemeStore>(context).themeData,
              home: HomeScreen(),
            );
          },
        )
      )
    );
  }
}
