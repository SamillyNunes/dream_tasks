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
                color: Color(0xFFFFFFFF),
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
                        color: Color(0xFF0CCF4F)
                      )
                    ),
                    calendarStyle: CalendarStyle(
                      selectedColor:Color(0xFF0CCF4F),
                      todayColor: Color(0xFF0CCF4F),
                      weekdayStyle: TextStyle(
                        fontFamily: _defaultFontFamily
                      ),
                      weekendStyle: TextStyle(
                        fontFamily: _defaultFontFamily,
                        color: Color(0xFF0CCF4F)
                      ),
                      unavailableStyle: TextStyle(
                        fontFamily: _defaultFontFamily,
                        color: Color(0xFF7A928F)
                      ),
                      outsideWeekendStyle: TextStyle(
                        fontFamily: _defaultFontFamily,
                        color: Color(0xFF7A928F)
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
                    CustomEventWidget('Aniversário da bia', 'Na casa branca as 2 hrs', Color(0xFF0CCF4F)),
                    CustomEventWidget('Reunião do trabalho', 'Comparecer de terno e chamar o Jão', Color(0xFF22BFC3)),
                    CustomEventWidget('Aniversário da Sam', 'Na piscina bebeeee', Color(0xFF0CCF4F)),
                  ],
                )
              ),
          ],
        ),
      )
    );
  }
}