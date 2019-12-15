import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:save_state_on_flutter/calendar_page.dart';
import 'package:save_state_on_flutter/register_page.dart';

import 'appbar.dart';
import 'drawer.dart';
import 'list_page.dart';

void main() => runApp(new Main());

class Main extends StatelessWidget {
  Main() {
    initializeDateFormatting('ja_JP');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'save-sate',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: MainPage());
  }
}

const String Language = 'ja_JP';

class MainPage extends StatefulWidget {
  MainPage() {
    initializeDateFormatting('ja_JP');
  }

  @override
  _MainPage createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  int _currentIndex = 0;
  List<String> _titles = List();
  List<Widget> _pages = List();

  Widget _getCurrentPage() => _pages[_currentIndex];
  String _getCurrentTitle() => _titles[_currentIndex];

  @override
  void initState() {
    setState(() {
      _currentIndex = 0;

      _pages.add(CalendarPage());
      _pages.add(ListPage());
      _titles.add('Calendar');
      _titles.add('List');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: MyDrawer(),
      appBar: MyAppBar(
        title: _getCurrentTitle(),
      ),
      body: _getCurrentPage(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(
            () {
              _currentIndex = index;
            },
          );
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            title: Text('Calendar'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            title: Text('List'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return RegisterPage();
              },
              fullscreenDialog: true
            ),
          );
        },
      ),
    );
  }
}
