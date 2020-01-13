import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:save_state_on_flutter/db_provider.dart';

import 'models/model.dart';

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
  List<States> _states = List<States>();

  CalendarCarousel _calendarCarouselNoHeader;
  Widget _stickyHeadersList;

  @override
  Widget build(BuildContext context) {
    _calendarCarouselNoHeader = CalendarCarousel<Event>(
      onDayPressed: (DateTime date, List<Event> events) {
        this.setState(() => _selectedDate = date);
        this.setState(() async {
          _states = await DBProvider.db.getStateForDate((DateFormat('yyyyMMdd').format(date)));
          _stickyHeadersList = Builder(builder: (BuildContext context) {
                return CustomScrollView(
                  slivers: _buildSlivers(context, _states),
                );
              });
        });
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
              child: _stickyHeadersList,
            )
          )
        ],
      );
  }

  List<Widget> _buildSlivers(BuildContext context, List<States> states) {
    List<Widget> slivers = new List<Widget>();
    slivers.addAll(_buildLists(context, 1, 1, states));
    return slivers;
  }

  List<Widget> _buildLists(BuildContext context, int firstIndex, int count, List<States> states) {
    return List.generate(count, (sliverIndex) {
      sliverIndex += firstIndex;
      return new SliverStickyHeader(
        header: _buildHeader(sliverIndex),
        sliver: new SliverList(
          delegate: new SliverChildBuilderDelegate(
            (context, index) => new ListTile(
              leading: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new CircleAvatar(
                      child: new Text(DateFormat('d').format(DateTime.parse(states[index].insertDateTime))),
                      radius: 16,
                    ),
                    Text(DateFormat('HH:mm').format(DateTime.parse(states[index].insertDateTime))),
                  ]),
              title: new Text('気分: ${states[index].feeling}、体調: ${states[index].condition}'),
              subtitle: Text(states[index].other),
            ),
            childCount: states.length == null ? 0 : states.length,
          ),
        ),
      );
    });
  }

  Widget _buildHeader(int index, {String text}) {
    return new Container(
      height: 52.0,
      color: Colors.red[300],
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      alignment: Alignment.centerLeft,
      child: new Text(
        text ?? DateFormat('yyyy年MM月').format(_selectedDate),
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
