import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:save_state_on_flutter/db_provider.dart';
import 'appbar.dart';
import 'models/model.dart';

import 'register/feeling.dart';
import 'register/condition.dart';
import 'register/ate_breakfast.dart';
import 'register/ate_lunch.dart';
import 'register/ate_dinner.dart';
import 'register/ate_snack.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPage createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {
  Map<String, dynamic> _state = new Map<String, dynamic>();

  Feeling _feeling;
  Condition _condition;
  AteBreakfast _ateBreakfast;
  AteLunch _ateLunch;
  AteDinner _ateDinner;
  AteSnack _ateSnack;

  _RegisterPage() {
    // TODO コンストラクタで初期化がいいのか、initStateで初期化がいいのか。
    this._feeling = Feeling(
        (value) => {debugPrint(value.toString()), _state["feeling"] = value});
    this._condition = Condition(
        (value) => {debugPrint(value.toString()), _state["condition"] = value});
    this._ateBreakfast = AteBreakfast((value) =>
        {debugPrint(value.toString()), _state["ateBreakfast"] = value});
    this._ateLunch = AteLunch(
        (value) => {debugPrint(value.toString()), _state["ateLunch"] = value});
    this._ateDinner = AteDinner(
        (value) => {debugPrint(value.toString()), _state["ateDinner"] = value});
    this._ateSnack = AteSnack(
        (value) => {debugPrint(value.toString()), _state["ateSnack"] = value});
  }

  @override
  void initState() {
    super.initState();
    _state = new Map<String, dynamic>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: MyDrawer(),
      appBar: ReigsterAppBar(title: 'Register', function: _pushedRegistration),
      body: ListView(
        children: <Widget>[
          _feeling,
          _condition,
          _ateBreakfast,
          _ateLunch,
          _ateDinner,
          _ateSnack,
          _itemGoodPoint(),
          _itemBadPoint(),
          _itemOther()
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    goodPointControllerList.clear();
    goodPointControllerList.add(TextEditingController());
    goodPointControllerList.add(TextEditingController());
    goodPointControllerList.add(TextEditingController());
    badPointControllerList.clear();
    badPointControllerList.add(TextEditingController());
    badPointControllerList.add(TextEditingController());
    badPointControllerList.add(TextEditingController());
  }

  // staticにしないと使えなかった ⇒ どちらもクラス変数のため
  static List<TextEditingController> goodPointControllerList = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  List<Widget> _goodPointFields = [
    Align(
      alignment: Alignment.centerLeft,
      child: Text(
        '良かったこと（+ボタンで増やせる）',
        textAlign: TextAlign.right,
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
        ),
      ),
    ),
    TextField(
        enabled: true,
        maxLengthEnforced: true,
        style: TextStyle(color: Colors.black),
        obscureText: false,
        maxLines: 1,
        controller: goodPointControllerList[0],
        decoration: const InputDecoration(
          icon: Icon(
            Icons.thumb_up,
            color: Colors.orange,
          ),
          hintText: 'クララが立った',
        )),
    TextField(
        enabled: true,
        maxLengthEnforced: true,
        style: TextStyle(color: Colors.black),
        obscureText: false,
        maxLines: 1,
        controller: goodPointControllerList[1],
        decoration: const InputDecoration(
          icon: Icon(
            Icons.thumb_up,
            color: Colors.orange,
          ),
          hintText: 'ソロモンに帰ってきた',
        )),
    TextField(
        enabled: true,
        maxLengthEnforced: true,
        style: TextStyle(color: Colors.black),
        obscureText: false,
        maxLines: 1,
        controller: goodPointControllerList[2],
        decoration: const InputDecoration(
          icon: Icon(
            Icons.thumb_up,
            color: Colors.orange,
          ),
          hintText: '俺がその幻想をぶち殺す',
        ))
  ];
  _addGoodField() {
    setState(() {
      goodPointControllerList.add(new TextEditingController());
      _goodPointFields.add(TextField(
          enabled: true,
          maxLengthEnforced: true,
          style: TextStyle(color: Colors.black),
          obscureText: false,
          maxLines: 1,
          controller:
              goodPointControllerList[goodPointControllerList.length - 1],
          decoration: const InputDecoration(
            icon: Icon(
              Icons.thumb_up,
              color: Colors.orange,
            ),
          )));
    });
  }

  static List<TextEditingController> badPointControllerList = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  List<Widget> _badPointFields = [
    Align(
      alignment: Alignment.centerLeft,
      child: Text(
        '悪かったこと（+ボタンで増やせる）',
        textAlign: TextAlign.right,
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
        ),
      ),
    ),
    TextField(
        enabled: true,
        maxLengthEnforced: true,
        style: TextStyle(color: Colors.black),
        obscureText: false,
        maxLines: 1,
        controller: badPointControllerList[0],
        decoration: const InputDecoration(
          icon: Icon(
            Icons.thumb_down,
            color: Colors.blue,
          ),
          hintText: '感染レベルがLevel 5',
        )),
    TextField(
        enabled: true,
        maxLengthEnforced: true,
        style: TextStyle(color: Colors.black),
        obscureText: false,
        maxLines: 1,
        controller: badPointControllerList[1],
        decoration: const InputDecoration(
          icon: Icon(
            Icons.thumb_down,
            color: Colors.blue,
          ),
          hintText: '信じてくれず、また死に戻り',
        )),
    TextField(
        enabled: true,
        maxLengthEnforced: true,
        style: TextStyle(color: Colors.black),
        obscureText: false,
        maxLines: 1,
        controller: badPointControllerList[2],
        decoration: const InputDecoration(
          icon: Icon(
            Icons.thumb_down,
            color: Colors.blue,
          ),
          hintText: '何股もかけて殺された',
        )),
  ];
  _addBadField() {
    setState(() {
      badPointControllerList.add(TextEditingController());
      _badPointFields.add(TextField(
          enabled: true,
          maxLengthEnforced: true,
          style: TextStyle(color: Colors.black),
          obscureText: false,
          maxLines: 1,
          controller: badPointControllerList[badPointControllerList.length - 1],
          decoration: const InputDecoration(
            icon: Icon(
              Icons.thumb_down,
              color: Colors.blue,
            ),
          )));
    });
  }

  final otherController = TextEditingController();

  Future<void> _pushedRegistration() async {
    final goodPoints = List<GoodPoints>();
    final badPoints = List<BadPoints>();

    goodPointControllerList
        .where((controller) => controller.text != "")
        .forEach((goodPoint) =>
            goodPoints.add(new GoodPoints.fromMap({'point': goodPoint.text})));
    _state['GoodPoints'] = goodPoints;

    badPointControllerList.where((controller) => controller.text != "").forEach(
        (badPoint) =>
            badPoints.add(new BadPoints.fromMap({'point': badPoint.text})));
    _state['BadPoints'] = badPoints;

    _state['other'] = otherController.text;
    _state['insertDateTime'] =
        (DateFormat('yyyyMMddTHHmmss').format(DateTime.now()));

    var state = new States.fromMap(_state);

    DBProvider.db.insertState(state);

    Navigator.of(context).pop();
  }

  Widget _itemGoodPoint() {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: new BoxDecoration(
            border:
                new Border(bottom: BorderSide(width: 1.0, color: Colors.grey))),
        child: Column(
          children: <Widget>[
            Column(
              children: _goodPointFields,
            ),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                _addGoodField();
              },
            )
          ],
        ),
      ),
      onTap: () {},
    );
  }

  Widget _itemBadPoint() {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: new BoxDecoration(
            border:
                new Border(bottom: BorderSide(width: 1.0, color: Colors.grey))),
        child: Column(
          children: <Widget>[
            Column(
              children: _badPointFields,
            ),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                _addBadField();
              },
            )
          ],
        ),
      ),
      onTap: () {},
    );
  }

  Widget _itemOther() {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: new BoxDecoration(
            border:
                new Border(bottom: BorderSide(width: 1.0, color: Colors.grey))),
        child: Column(children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'その他（なんでも！）',
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ),
          TextField(
            keyboardType: TextInputType.multiline,
            maxLines: 5,
            controller: otherController,
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.only(left: 8, top: 10), // Set new height here
              border: OutlineInputBorder(),
              hintText: "やったね",
            ),
          )
        ]),
      ),
      onTap: () {},
    );
  }
}
