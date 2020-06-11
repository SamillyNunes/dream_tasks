import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

const String _defaultFontFamily = 'Raleway';

class ProjectWidget extends StatelessWidget {

  final String name;
  final double value;
  final bool newProject;

  ProjectWidget(this.name, this.value, {this.newProject=false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10),
      child: Container(
        // height: MediaQuery.of(context).size.height*0.15,
        width: MediaQuery.of(context).size.width*0.4,
        decoration: BoxDecoration(
          color: Color(0xFF7A928F),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          children: newProject ? _newProject(context) : _modelProject(context),
        ),
      ),
    );
  }

  List<Widget> _newProject(BuildContext context){
    return <Widget>[
      Padding(
        padding: EdgeInsets.all(10),
        child: Icon(
          Icons.add_circle_outline,
          size: 30,
          color: Theme.of(context).primaryColor,
        ),
      ),
      Text(
        'Adicionar projeto',
        style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontFamily: _defaultFontFamily,
          fontSize: 15
        ),
      )
    ];
  }

  List<Widget> _modelProject(BuildContext context){
    return <Widget>[
      Padding(
        padding: EdgeInsets.symmetric(horizontal:10, vertical: 10),
        child: CircularPercentIndicator(
          radius: 100.0,
          backgroundColor: Theme.of(context).primaryColor,
          percent: value,
          center: Text(
            "${(value*100).floor()}%",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color(0xFFFFFFFF)
            ),
          ),
          linearGradient: LinearGradient(
            colors: [
              Color(0xFF0CCF4F),
              Color(0xFF22BFC3),
            ]
          ),
        ),
      ),
      Text(
        name,
        style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontFamily: _defaultFontFamily,
          fontSize: 15
        ),
      )
    ];
  }
}