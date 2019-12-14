import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

import 'drawer.dart';
import 'appbar.dart';

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
  DateTime _currentDate2 = DateTime.now();
  String _currentMonth = DateFormat.yMMM(Language).format(DateTime.now());
  DateTime _targetDateTime = DateTime.now();
//  List<DateTime> _markedDate = [DateTime(2018, 9, 20), DateTime(2018, 10, 11)];
  // static Widget _eventIcon = new Container(
  //   decoration: new BoxDecoration(
  //       color: Colors.white,
  //       borderRadius: BorderRadius.all(Radius.circular(1000)),
  //       border: Border.all(color: Colors.red, width: 5.0)),
  //   child: new Icon(
  //     Icons.access_alarm,
  //     color: Colors.red,
  //   ),
  // );

  // EventList<Event> _markedDateMap = new EventList<Event>(
  //   events: {
  //     new DateTime(2019, 2, 10): [
  //       new Event(
  //         date: new DateTime(2019, 2, 10),
  //         title: 'Event 1',
  //         icon: _eventIcon,
  //         dot: Container(
  //           margin: EdgeInsets.symmetric(horizontal: 1.0),
  //           color: Colors.red,
  //           height: 5.0,
  //           width: 5.0,
  //         ),
  //       ),
  //       new Event(
  //         date: new DateTime(2019, 2, 10),
  //         title: 'Event 2',
  //         icon: _eventIcon,
  //       ),
  //       new Event(
  //         date: new DateTime(2019, 2, 10),
  //         title: 'Event 3',
  //         icon: _eventIcon,
  //       ),
  //     ],
  //   },
  // );

  // CalendarCarousel _calendarCarousel, _calendarCarouselNoHeader;
  CalendarCarousel _calendarCarouselNoHeader;

  @override
  void initState() {
    /// Add more events to _markedDateMap EventList
    // _markedDateMap.add(
    //     new DateTime(2019, 2, 25),
    //     new Event(
    //       date: new DateTime(2019, 2, 25),
    //       title: 'Event 5',
    //       icon: _eventIcon,
    //     ));

    // _markedDateMap.add(
    //     new DateTime(2019, 2, 10),
    //     new Event(
    //       date: new DateTime(2019, 2, 10),
    //       title: 'Event 4',
    //       icon: _eventIcon,
    //     ));

    // _markedDateMap.addAll(new DateTime(2019, 2, 11), [
    //   new Event(
    //     date: new DateTime(2019, 2, 11),
    //     title: 'Event 1',
    //     icon: _eventIcon,
    //   ),
    //   new Event(
    //     date: new DateTime(2019, 2, 11),
    //     title: 'Event 2',
    //     icon: _eventIcon,
    //   ),
    //   new Event(
    //     date: new DateTime(2019, 2, 11),
    //     title: 'Event 3',
    //     icon: _eventIcon,
    //   ),
    //   new Event(
    //     date: new DateTime(2019, 2, 11),
    //     title: 'Event 4',
    //     icon: _eventIcon,
    //   ),
    //   new Event(
    //     date: new DateTime(2019, 2, 11),
    //     title: 'Event 23',
    //     icon: _eventIcon,
    //   ),
    //   new Event(
    //     date: new DateTime(2019, 2, 11),
    //     title: 'Event 123',
    //     icon: _eventIcon,
    //   ),
    // ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /// Example with custom icon
//     _calendarCarousel = CalendarCarousel<Event>(
//       onDayPressed: (DateTime date, List<Event> events) {
//         this.setState(() => _currentDate = date);
//         events.forEach((event) => print(event.title));
//       },
//       weekendTextStyle: TextStyle(
//         color: Colors.red,
//       ),
//       thisMonthDayBorderColor: Colors.red,
// //          weekDays: null, /// for pass null when you do not want to render weekDays
//       headerText: 'Custom Header',
// //          markedDates: _markedDate,
//       weekFormat: true,
//       markedDatesMap: _markedDateMap,
//       height: 200.0,
//       selectedDateTime: _currentDate2,
//       showIconBehindDayText: true,
// //          daysHaveCircularBorder: false, /// null for not rendering any border, true for circular border, false for rectangular border
//       customGridViewPhysics: NeverScrollableScrollPhysics(),
//       markedDateShowIcon: true,
//       markedDateIconMaxShown: 2,
//       selectedDayTextStyle: TextStyle(
//         color: Colors.yellow,
//       ),
//       todayTextStyle: TextStyle(
//         color: Colors.blue,
//       ),
//       markedDateIconBuilder: (event) {
//         return event.icon;
//       },
//       minSelectedDate: _currentDate.subtract(Duration(days: 360)),
//       maxSelectedDate: _currentDate.add(Duration(days: 360)),
//       todayButtonColor: Colors.transparent,
//       todayBorderColor: Colors.green,
//       markedDateMoreShowTotal:
//           false, // null for not showing hidden events indicator
// //          markedDateIconMargin: 9,
// //          markedDateIconOffset: 3,
//     );

    /// Example Calendar Carousel without header and custom prev & next button
    _calendarCarouselNoHeader = CalendarCarousel<Event>(
      // todayBorderColor: Colors.blue,
      onDayPressed: (DateTime date, List<Event> events) {
        this.setState(() => _currentDate2 = date);
        events.forEach((event) => print(event.title));
      },
      // daysHaveCircularBorder: true,
      // showOnlyCurrentMonthDate: false,
      weekendTextStyle: TextStyle(
        color: Colors.red,
      ),
      // thisMonthDayBorderColor: Colors.grey,
      weekFormat: false,
      // firstDayOfWeek: 4,
      // markedDatesMap: _markedDateMap,
      height: 280.0,
      selectedDateTime: _currentDate2,
      targetDateTime: _targetDateTime,
      customGridViewPhysics: NeverScrollableScrollPhysics(),
      markedDateCustomShapeBorder:
          CircleBorder(side: BorderSide(color: Colors.white)),
      markedDateCustomTextStyle: TextStyle(
        fontSize: 16,
        color: Colors.green,
      ),
      showHeader: false,
      // markedDateIconBuilder: (event) {
      //   return Container(
      //     color: Colors.blue,
      //   );
      // },
      todayTextStyle: TextStyle(color: Colors.blue, fontSize: 18),
      todayButtonColor: null,
      selectedDayTextStyle: TextStyle(
        color: Colors.white,
      ),
      selectedDayButtonColor: Colors.red,
      minSelectedDate: _currentDate.subtract(Duration(days: 360)),
      maxSelectedDate: _currentDate.add(Duration(days: 360)),
      // prevDaysTextStyle: TextStyle(
      //   fontSize: 16,
      //   color: Colors.grey,
      // ),
      // inactiveDaysTextStyle: TextStyle(
      //   color: Colors.red,
      //   fontSize: 16,
      // ),
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

    return Scaffold(
      drawer: MyDrawer(),
      appBar: MyAppBar(
        title: 'Calendar',
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                top: 12.0,
                bottom: 16.0,
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
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 0.0),
              child: _calendarCarouselNoHeader,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 0.0),
              height: 320,
              child: new Builder(builder: (BuildContext context) {
                return new CustomScrollView(
                  slivers: _buildSlivers(context),
                );
              }),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }

  List<Widget> _buildSlivers(BuildContext context) {
    List<Widget> slivers = new List<Widget>();
    int i = 1;
    slivers.addAll(_buildLists(context, i, i += 11));
    return slivers;
  }

  List<Widget> _buildLists(BuildContext context, int firstIndex, int count) {
    return List.generate(count, (sliverIndex) {
      sliverIndex += firstIndex;
      return new SliverStickyHeader(
        header: _buildHeader(sliverIndex),
        sliver: new SliverList(
          delegate: new SliverChildBuilderDelegate(
            (context, i) => new ListTile(
              leading: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new CircleAvatar(
                      child: new Text('${i + 1}'),
                      radius: 16,
                    ),
                    Text(new DateFormat('HH:mm').format(DateTime.now())),
                  ]),
              title: new Text('Today is Good #$i'),
              subtitle: Text('This is Subtitle. My name is suzuki.'),
            ),
            childCount: 30,
          ),
        ),
      );
    });
  }

  Widget _buildHeader(int index, {String text}) {
    return new Container(
      height: 60.0,
      color: Colors.red[300],
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      alignment: Alignment.centerLeft,
      child: new Text(
        text ?? '2019年$index月',
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
