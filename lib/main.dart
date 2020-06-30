import 'package:dream_tasks/screens/splash_screen.dart';
import 'package:dream_tasks/stores/drawer_store.dart';
import 'package:dream_tasks/stores/list_task_store.dart';
import 'package:dream_tasks/stores/theme_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ListTaskStore>(
          create: (_)=>ListTaskStore(),
        ),
        Provider<ThemeStore>(
          create: (_)=>ThemeStore(),
        ),
        Provider<DrawerStore>(
          create: (_)=>DrawerStore(),
        )
      ],
      child: Observer(
        builder: (context){
          return MaterialApp(
            title: 'Dream Tasks',
            debugShowCheckedModeBanner: false,
            theme: Provider.of<ThemeStore>(context).themeData,
            home: SplashScreen(),
          );
        },
      )
    );
  }
}
