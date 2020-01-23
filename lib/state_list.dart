import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:intl/intl.dart';
import 'package:save_state_on_flutter/reference_page.dart';

import 'models/model.dart';

const List<String> fiveName = ["","最低","悪い","普通","良い","最高"]; 
const List<String> threeName = ["なし","あり","まだ"];

class StateList extends StatefulWidget {
  final List<States> states;
  final DateTime date;

  StateList({
    Key key, @required this.states, this.date,
  }) : super(key: key);

  @override
  _StateList createState() => _StateList();
}

class _StateList extends State<StateList> {
  @override
  Widget build(BuildContext context) {
    return new CustomScrollView(
      slivers: _buildSlivers(context, widget.states, widget.date),
    );
  }

  List<Widget> _buildSlivers(BuildContext context, List<States> states, DateTime date) {
    List<Widget> slivers = new List<Widget>();
    var month = states.map((state) => DateTime.parse(state.insertDateTime.substring(0, 6) + "01")).toSet().toList();
    if (month.length == 0) month.add(date);
    slivers.addAll(_buildLists(context, 1, month.length, states, month));
    return slivers;
  }

  List<Widget> _buildLists(BuildContext context, int firstIndex, int count, List<States> states, List<DateTime> date) {
    return List.generate(count, (sliverIndex) {
      sliverIndex += firstIndex;
      return new SliverStickyHeader(
        header: _buildHeader(sliverIndex, date[sliverIndex - 1]),
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
              title: new Text('気分: ${fiveName[states[index].feeling == null ? 0 : states[index].feeling]}、体調: ${fiveName[states[index].condition == null ? 0 : states[index].condition]}、朝食: ${threeName[states[index].ateBreakfast == null ? 2 : states[index].ateBreakfast]}、昼食: ${threeName[states[index].ateLunch == null ? 2 : states[index].ateLunch]}、夜食: ${threeName[states[index].ateDinner == null ? 2 : states[index].ateDinner]}、間食: ${threeName[states[index].ateSnack == null ? 2 : states[index].ateSnack]}'),
              subtitle: Text(states[index].other),
              onTap:  () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return ReferencePage(state: states[index].toMapAddPoints());
                    },
                    fullscreenDialog: true
                  ),
                );
              },
            ),
            childCount: states.length == null ? 0 : states.length,
          ),
        ),
      );
    });
  }

  Widget _buildHeader(int index, DateTime date, {String text}) {
    return new Container(
      height: 52.0,
      color: Colors.red[300],
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      alignment: Alignment.centerLeft,
      child: new Text(
        text ?? DateFormat('yyyy年MM月').format(date),
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
