import 'package:dream_tasks/models/day_event.dart';
import 'package:dream_tasks/stores/list_event_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:table_calendar/table_calendar.dart';


class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {

  CalendarController _calendarController;
  final String _fontFamily = "Raleway";

  Color _backgroundColor = Colors.orange;

  ListEventStore _listEvents = ListEventStore();
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
        // backgroundColor: Colors.grey[300],
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
                  fontSize: 40,
                  fontFamily: _fontFamily
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
                    onDayLongPressed: (date, list){
                      print("Agora");
                      _listEvents.addEvent("Exemplo de evento", "Essa eh uma descricao bb", date);
                    },
                    onDaySelected: (date, listEvents){
                      print("day selected");
                      _listEvents.changeDaySelected(date);
                    },
                    availableCalendarFormats: const { //para assegurar que so mostrara em forma de mes
                      CalendarFormat.month: 'month',
                    },
                    calendarStyle: CalendarStyle(
                      selectedColor: Colors.orange,
                      todayColor: _backgroundColor,
                      weekendStyle: TextStyle(
                        color: _backgroundColor,
                        fontWeight: FontWeight.bold
                      ),
                    ),
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
                  fontSize: 20,
                  fontFamily: _fontFamily
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Expanded(
              child: Observer(
                builder: (context){
                  DateTime dayS = _listEvents.dateSelected;
                  String chave = dayS.day.toString()+"0"+dayS.month.toString()+dayS.year.toString();
                  return _listEvents.events2.containsKey(chave) ?
                    ListView.builder(
                      itemCount: _listEvents.events2[chave].length,
                      itemBuilder: (context, index){
                        DayEvent de = _listEvents.events2[chave][index];
                        return _eventCard(de.title, de.description);
                      }
                    ) : Container();
                }
              ),
            )
            // Expanded(
            //   child: Observer(
            //     builder: (context){
            //       return ListView.builder(
            //         itemCount: _listEvents.events.length,
            //         itemBuilder: (context, index){
            //           DayEvent de = _listEvents.events[index];
            //           return _listEvents.dateSelected==de.date ?
            //              _eventCard(_listEvents.events[index].title, _listEvents.events[index].description)
            //              : null ;
            //         }
            //       );
            //     }
            //   )
            // )
          ],
        ),
      )
    );
  }

  Widget _eventCard(String titleEvent, String description){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        color: Colors.orange[100],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16)
        ),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                titleEvent,
                style: TextStyle(
                  fontFamily: _fontFamily,
                  color: _backgroundColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                ),
              ),
              Text(
                description,
                style: TextStyle(
                  // fontFamily: _fontFamily,
                  // color: _backgroundColor,
                  // fontWeight: FontWeight.bold,
                  fontSize: 16
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      )
    );
  }
}
