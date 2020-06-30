import 'package:dream_tasks/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dream_tasks/stores/theme_store.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    Provider.of<ThemeStore>(context, listen: false).getTheme().then(
      (value){
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_)=>HomeScreen())
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height*0.3,
          ),
          Image.asset("images/video-dreamtasks.gif"),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.2,
          ),
          Center( 
            child: Column(
              children: <Widget>[
                CircularProgressIndicator(),
                Padding(
                  padding: EdgeInsets.only(top:10),
                  child: Text(
                    "Carregando",
                    style: TextStyle(
                      color: Theme.of(context).accentColor
                    ),
                  )
                )
              ],
            ),
          )
          
        ],
      ),
    );
  }
}