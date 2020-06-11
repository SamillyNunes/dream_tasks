import 'package:dream_tasks/screens/goals_screen.dart';
import 'package:dream_tasks/screens/home_screen.dart';
import 'package:dream_tasks/stores/list_task_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider<ListTaskStore>(
      create: (_)=> ListTaskStore(),
      child: MaterialApp(
        title: 'Dream Tasks',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.white,
          cursorColor: Colors.deepPurpleAccent,
          scaffoldBackgroundColor: Colors.black,   
            
        ),
        home: HomeScreen(),
      )
    );
  }
}
