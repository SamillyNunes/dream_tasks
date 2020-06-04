import 'package:flutter/material.dart';

class Goal{
  String _title;
  bool _done;
  String description;
  bool repetitionOn;
  DateTime dateTime;

  Goal(this._title,this._done, {this.description="",this.repetitionOn=false,this.dateTime});
}