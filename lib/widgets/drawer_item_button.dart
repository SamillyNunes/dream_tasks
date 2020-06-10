import 'package:dream_tasks/screens/goals_screen.dart';
import 'package:dream_tasks/screens/home_screen.dart';
import 'package:flutter/material.dart';

class DrawerItemButton extends StatelessWidget {
  final int index;
  final bool selected;

  DrawerItemButton(this.index, {this.selected=false});

  final List<String> _itemsIcons = [
    'images/icons/home-icon.png',
    'images/icons/calendar-icon.png',
    'images/icons/check-icon.png',
    'images/icons/statitics-icon.png',
  ];

  final List<String> _itemsSelectedIcons = [
    'images/icons/home-icon-selected.png',
    'images/icons/calendar-icon-selected.png',
    'images/icons/check-icon-selected.png',
    'images/icons/statitics-icon-selected.png',
  ];

  final List<Widget> _pages = [
    HomeScreen(),
    GoalsScreen(),
    GoalsScreen(),
    GoalsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context)=>_pages[index])
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width*0.15,
        height: MediaQuery.of(context).size.height*0.10,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Color(0xFF040506),
          borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        child: selected ? Image.asset(_itemsSelectedIcons[index]) : Image.asset(_itemsIcons[index]),
      )
    );
  }
}