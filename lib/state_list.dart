import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:intl/intl.dart';

import 'models/model.dart';

class StateList extends StatefulWidget {
  final List<States> states;

  StateList({
    Key key, @required this.states
  }) : super(key: key);

  @override
  _StateList createState() => _StateList();
}

class _StateList extends State<StateList> {
  @override
  Widget build(BuildContext context) {
    return new CustomScrollView(
      slivers: _buildSlivers(context, widget.states),
    );
  }

  List<Widget> _buildSlivers(BuildContext context, List<States> states) {
    List<Widget> slivers = new List<Widget>();
    var month = states.map((state) => DateTime.parse(state.insertDateTime.substring(0, 6) + "01")).toSet().toList();
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
              title: new Text('気分: ${states[index].feeling}、体調: ${states[index].condition}'),
              subtitle: Text(states[index].other),
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
