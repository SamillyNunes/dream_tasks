import 'package:dream_tasks/widgets/custom_drawer.dart';
import 'package:dream_tasks/widgets/custom_event_widget.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

const String _defaultFontFamily = 'Raleway';
class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  
  CalendarController _calendarController;
  DateTime _dateSelected;

  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
  }

  @override
  void dispose() {
    _calendarController.dispose();    
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
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
                'Calendário',
                style: TextStyle(
                  fontFamily: _defaultFontFamily,
                  color: Theme.of(context).primaryColor,
                  fontSize: 40
                ),
              )
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Card(
                color: Color(0xFFFFFFFF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16))
                ),
                elevation: 16,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 0),
                  child: TableCalendar(
                    calendarController: _calendarController,
                    availableCalendarFormats: const { //para assegurar que so mostrara em forma de mes
                      CalendarFormat.month: 'month',
                    },
                    headerStyle: HeaderStyle(
                      centerHeaderTitle: true,
                      titleTextStyle: TextStyle(
                        fontFamily: _defaultFontFamily,
                      )
                    ),
                    daysOfWeekStyle: DaysOfWeekStyle(
                      weekdayStyle: TextStyle(
                        fontFamily: _defaultFontFamily,
                      ),
                      weekendStyle: TextStyle(
                        fontFamily: _defaultFontFamily,
                        color: Theme.of(context).accentColor
                      )
                    ),
                    calendarStyle: CalendarStyle(
                      selectedColor:Theme.of(context).accentColor,
                      todayColor: Theme.of(context).accentColor,
                      weekdayStyle: TextStyle(
                        fontFamily: _defaultFontFamily
                      ),
                      weekendStyle: TextStyle(
                        fontFamily: _defaultFontFamily,
                        color: Theme.of(context).accentColor
                      ),
                      unavailableStyle: TextStyle(
                        fontFamily: _defaultFontFamily,
                        color:Theme.of(context).disabledColor
                      ),
                      outsideWeekendStyle: TextStyle(
                        fontFamily: _defaultFontFamily,
                        color: Theme.of(context).disabledColor
                      ),
                    ),
                    rowHeight: 30,         
                  ),
                )
              )
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                'Eventos',
                style: TextStyle(
                  fontFamily: _defaultFontFamily,
                  color: Theme.of(context).primaryColor,
                  fontSize: 25
                ),
              )
            ),
            Expanded(
                child: ListView(
                  children: <Widget>[
                    CustomEventWidget('Aniversário da bia', 'Na casa branca as 2 hrs', Theme.of(context).accentColor),
                    CustomEventWidget('Reunião do trabalho', 'Comparecer de terno e chamar o Jão', Theme.of(context).highlightColor),
                    CustomEventWidget('Aniversário da Sam', 'Na piscina bebeeee', Theme.of(context).accentColor),
                  ],
                )
              ),
          ],
        ),
      )
    );
  }
}