import 'package:dream_tasks/models/day_event.dart';
import 'package:dream_tasks/stores/list_event_store.dart';
import 'package:dream_tasks/widgets/custom_drawer.dart';
import 'package:dream_tasks/widgets/custom_event_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:dream_tasks/stores/theme_store.dart';
import 'package:table_calendar/table_calendar.dart';

const String _defaultFontFamily = 'Raleway';
class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  
  CalendarController _calendarController;
  DateTime _dateSelected;

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  
  ListEventStore _listEvents = ListEventStore();

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
        key: _scaffoldKey,
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
                    onDaySelected: (date, listEvents){
                      print("day selected");
                      _listEvents.changeDaySelected(date);
                    },
                    availableCalendarFormats: const { //para assegurar que so mostrara em forma de mes
                      CalendarFormat.month: 'month',
                    },
                    builders: CalendarBuilders(
                      dayBuilder: (context, date, lista){
                       return InkWell(
                         onDoubleTap: (){
                           _showBottomSheet(context, date);
                           
                         },
                         child: Text(
                           date.day.toString(),
                           textAlign: TextAlign.center,
                           style: TextStyle(
                             color: Color(0xFF000000)
                           ),
                         ),
                       ); 
                      },
                      selectedDayBuilder: (context, date, lista){
                       return InkWell(
                         onDoubleTap: (){
                           _showBottomSheet(context, date);
                           
                         },
                         child: Container(
                           padding: EdgeInsets.all(5),
                           decoration: BoxDecoration(
                             color: Theme.of(context).accentColor,
                             borderRadius: BorderRadius.all(Radius.circular(10))
                             
                           ),
                           child: Text(
                            date.day.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF000000),
                            ),
                          ),
                         ),
                       ); 
                      },
                      
                      
                    ),
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
              child: Observer(
                builder: (context){
                  DateTime dayS = _listEvents.dateSelected;
                  String chave = dayS.day.toString()+"0"+dayS.month.toString()+dayS.year.toString();
                  return _listEvents.events.containsKey(chave) ?
                    ListView.builder(
                      itemCount: _listEvents.events[chave].length,
                      itemBuilder: (context, index){
                        DayEvent de = _listEvents.events[chave][index];
                        return CustomEventWidget(de.title,de.description, Theme.of(context).accentColor);
                      }
                    ) : Container();
                }
              ),
            )
          ],
        ),
      )
    );
  }

  void _showBottomSheet(BuildContext context, DateTime date){
    _scaffoldKey.currentState.showBottomSheet<void>(
      
      (context){
        return Container(
        padding: EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height*0.5,
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Adicionar evento',
              style: TextStyle(
                color: Theme.of(context).accentColor,
                fontSize: 30
              ),
            ),
            TextFormField(
              onChanged: _listEvents.setNameEvent,
              onFieldSubmitted: (_)=> _listEvents.setNameEvent(_listEvents.nameEvent),
              decoration: InputDecoration(
                labelText: 'Nome do evento:',
                
              ),
            ),
            TextFormField(
              onChanged: _listEvents.setDescriptionEvent,
              onFieldSubmitted: (_)=> _listEvents.setDescriptionEvent(_listEvents.descriptionEvent),
              decoration: InputDecoration(
                labelText: 'Descrição do evento:',

              ),
            ),
            Padding(
              padding: EdgeInsets.only(left:0),
              child: Container(
                width: MediaQuery.of(context).size.width*0.9,
                decoration: BoxDecoration(
                  gradient: Provider.of<ThemeStore>(context).defaultGradient,
                  borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child: FlatButton(
                onPressed: (){
                  _listEvents.addEvent(date);                              
                  Navigator.of(context).pop();
                }, 
                child: Text(
                  'Adicionar',
                  style: TextStyle(
                    color: Color(0xFFFFFFFF), //fixo
                    fontFamily: _defaultFontFamily,
                    fontSize: 20
                  ),
                )
              ),
            )
          )
          ],
        )
      );
      },
      elevation: 16,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5))
      ),
      backgroundColor: Theme.of(context).primaryColor
    );
  }

}