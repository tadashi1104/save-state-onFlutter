import 'package:flutter/material.dart';
//import 'package:flutter_sticky_header/flutter_sticky_header.dart';

import 'appbar.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPage createState() => _ListPage();
}

class _ListPage extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(),
        // body: SliverStickyHeader(
        //   header: new Container(
        //     height: 60.0,
        //     color: Colors.lightBlue,
        //     padding: EdgeInsets.symmetric(horizontal: 16.0),
        //     alignment: Alignment.centerLeft,
        //     child: new Text(
        //       'Header #0',
        //       style: const TextStyle(color: Colors.white),
        //     ),
        //   ),
        //   sliver: new SliverList(
        //     delegate: new SliverChildBuilderDelegate(
        //       (context, i) => new ListTile(
        //         leading: new CircleAvatar(
        //           child: new Text('0'),
        //         ),
        //         title: new Text('List tile #$i'),
        //       ),
        //       childCount: 4,
        //     ),
        //   ),
        // )
        body: Text("aaa"));
  }
}
