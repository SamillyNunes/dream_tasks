import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';


class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {

  CalendarController _calendarController;

  Color _backgroundColor = Colors.yellow[300];

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
        // backgroundColor: Colors.blue,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20, top: 20),
              child: Text(
                "Calendário",
                style: TextStyle(
                  color: _backgroundColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 40
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top:10, left:10, right: 10),
              child: Card(
                elevation: 16,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 0),
                  child: TableCalendar(
                    calendarController: _calendarController,
                    availableCalendarFormats: const { //para assegurar que so mostrara em forma de mes
                      CalendarFormat.month: 'month',
                    },
                    rowHeight: 30,         
                  ),
                )
              )
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, top: 20),
              child: Text(
                "Eventos",
                style: TextStyle(
                  color: _backgroundColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
      )
    );
  }
}
