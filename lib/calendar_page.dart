import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:save_state_on_flutter/db_provider.dart';
import 'package:save_state_on_flutter/state_list.dart';

const String Language = 'ja_JP';

class CalendarPage extends StatefulWidget {
  CalendarPage() {
    initializeDateFormatting('ja_JP');
  }

  @override
  _CalendarPage createState() => _CalendarPage();
}

class _CalendarPage extends State<CalendarPage> {
  DateTime _currentDate = DateTime.now();
  DateTime _selectedDate = DateTime.now();
  String _currentMonth = DateFormat.yMMM(Language).format(DateTime.now());
  DateTime _targetDateTime = DateTime.now();

  CalendarCarousel _calendarCarouselNoHeader;

  @override
  Widget build(BuildContext context) {
    _calendarCarouselNoHeader = CalendarCarousel<Event>(
      onDayPressed: (DateTime date, List<Event> events) {
        this.setState(() => _selectedDate = date == null ? _selectedDate : date);
      },
      weekendTextStyle: TextStyle(
        color: Colors.red,
      ),
      // height: 320,
      weekFormat: false,
      selectedDateTime: _selectedDate,
      targetDateTime: _targetDateTime,
      customGridViewPhysics: NeverScrollableScrollPhysics(),
      markedDateCustomShapeBorder:
          CircleBorder(side: BorderSide(color: Colors.white)),
      markedDateCustomTextStyle: TextStyle(
        fontSize: 16,
        color: Colors.green,
      ),
      showHeader: false,
      todayTextStyle: TextStyle(color: Colors.blue, fontSize: 18),
      todayButtonColor: null,
      selectedDayTextStyle: TextStyle(
        color: Colors.white,
      ),
      selectedDayButtonColor: Colors.red,
      minSelectedDate: _currentDate.subtract(Duration(days: 360)),
      maxSelectedDate: _currentDate.add(Duration(days: 360)),
      onCalendarChanged: (DateTime date) {
        this.setState(() {
          _targetDateTime = date;
          _currentMonth = DateFormat.yMMM(Language).format(_targetDateTime);
        });
      },
      onDayLongPressed: (DateTime date) {
        print('long pressed date $date');
      },
    );

    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(flex: 1,  
            child: Container(
              margin: EdgeInsets.only(
                top: 12.0,
                bottom: 12.0,
                left: 16.0,
                right: 16.0,
              ),
              child: new Row(
                children: <Widget>[
                  Expanded(
                      child: Text(
                    _currentMonth,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                    ),
                  )),
                  FlatButton(
                    child: Text('PREV'),
                    onPressed: () {
                      setState(() {
                        _targetDateTime = DateTime(
                            _targetDateTime.year, _targetDateTime.month - 1);
                        _currentMonth =
                            DateFormat.yMMM(Language).format(_targetDateTime);
                      });
                    },
                  ),
                  FlatButton(
                    child: Text('NEXT'),
                    onPressed: () {
                      setState(() {
                        _targetDateTime = DateTime(
                            _targetDateTime.year, _targetDateTime.month + 1);
                        _currentMonth =
                            DateFormat.yMMM(Language).format(_targetDateTime);
                      });
                    },
                  )
                ],
              ),
            )
          ),
          Expanded(flex: 5, 
            child: Container(
              // height: 320,
              margin: EdgeInsets.symmetric(horizontal: 0.0),
              child: _calendarCarouselNoHeader,
              ) 
          ),
          Expanded(flex: 4, 
            child: Container(
              // height: MediaQuery.of(context).size.height - 300,
              margin: EdgeInsets.symmetric(horizontal: 0.0),
              child: FutureBuilder(
                future: DBProvider.db.getStateForDate((DateFormat('yyyyMMdd').format(_selectedDate))),
                builder: (context, future) {
                  return StateList(states: future.data, date: _selectedDate);
                },
              ) 
            )
          )
        ],
      );
  }
}
