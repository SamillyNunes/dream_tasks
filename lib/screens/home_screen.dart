import 'package:dream_tasks/screens/calendar_screen.dart';
import 'package:dream_tasks/screens/goals_screen.dart';
import 'package:dream_tasks/widgets/home_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text('Dream tasks')
        // ),
        body:  Stack(
          children: <Widget>[
            // _backgroundColor(),
            CustomScrollView(
              slivers: <Widget>[
                SliverList(
                  delegate: SliverChildListDelegate(
                    <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left:10,top:20),
                        child: Text(
                          "Olá, Sam!",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left:10),
                        child: Text(
                          "Você tem 10 metas para hoje.",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Theme.of(context).primaryColor
                          ),
                        )
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height*0.05,
                      )
                      
                    ]
                  )
                ),
                SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.9,
                    mainAxisSpacing: 10
                  ),
                  delegate: SliverChildListDelegate(
                    <Widget>[
                      HomeButton("Calendário", Icons.calendar_today, Colors.pinkAccent, 10, 0, 10, CalendarScreen()),
                      HomeButton("Metas diárias", Icons.check_circle, Colors.purpleAccent, 0, 10, 10, GoalsScreen()),
                      HomeButton("Anotações", Icons.speaker_notes, Colors.blueAccent, 10, 0, 0, GoalsScreen()),
                      FlatButton(
                        onPressed: (){
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context)=>GoalsScreen())
                          );
                        }, 
                        child: null
                        )
                    ]
                  )
                )
              ]
            )
          ],
        ),
      )
    );
  }
}