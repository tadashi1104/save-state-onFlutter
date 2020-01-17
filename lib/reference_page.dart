import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:save_state_on_flutter/db_provider.dart';
import 'appbar.dart';
import 'models/model.dart';

Map<String, dynamic> _state = new Map<String, dynamic>();

class ReferencePage extends StatefulWidget {
  final Map<String, dynamic> state;
  ReferencePage({this.state});
  @override
  _ReferencePage createState() => _ReferencePage();
}

class _ReferencePage extends State<ReferencePage> {

  int _currentFeeling;
  int _currentCondition;
  int _currentBreakfast;
  int _currentLunch;
  int _currentDinner;
  int _currentSnack;

  // staticにしないと使えなかった ⇒ どちらもクラス変数のため
  static List<TextEditingController> goodPointControllerList;

  List<Widget> _goodPointFields = [
    Align(
      alignment: Alignment.centerLeft,
      child: Text(
        '良かったこと',
        textAlign: TextAlign.right,
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
        ),
      ),
    ),
  ];

  static List<TextEditingController> badPointControllerList;

  List<Widget> _badPointFields = [
    Align(
      alignment: Alignment.centerLeft,
      child: Text(
        '悪かったこと',
        textAlign: TextAlign.right,
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
        ),
      ),
    ),
  ];

  TextEditingController otherController = TextEditingController();

  // Future<void> _pushedRegistration() async {
  //   final goodPoints = List<GoodPoints>();
  //   final badPoints = List<BadPoints>();

  //   goodPointControllerList.where((controller) => controller.text != "")
  //     .forEach((goodPoint) => goodPoints.add(new GoodPoints.fromMap({'point' : goodPoint.text})));
  //   _state['goodPoints'] = goodPoints;

  //   badPointControllerList.where((controller) => controller.text != "")
  //     .forEach((badPoint) => badPoints.add(new BadPoints.fromMap({'point' : badPoint.text})));
  //   _state['badPoints'] = badPoints;

  //   _state['other'] = otherController.text;
  //   _state['insertDateTime'] = (DateFormat('yyyyMMddTHHmmss').format(DateTime.now()));

  //   var state = new States.fromMap(_state);

  //   DBProvider.db.insertState(state);    

  //   Navigator.of(context).pop();
  // }

  @override
  void dispose() {
    super.dispose();
    goodPointControllerList.clear();
    goodPointControllerList.add(TextEditingController());
    badPointControllerList.clear();
    badPointControllerList.add(TextEditingController());
  }

  @override
  void initState()  {
    super.initState();
    _state = widget.state;
    _currentFeeling = _state['feeling'];
    _currentCondition = _state['condition'];
    _currentBreakfast = _state['ateBreakFast'];
    _currentLunch = _state['ateLunch'];
    _currentDinner = _state['ateDinner'];
    _currentSnack = _state['ateSnack'];

    List<GoodPoints> goodPoints = _state['goodPoints'];
    List<BadPoints> badPoints = _state['badPoints'];

    if (goodPoints == null) {
      for (var i = 0; i < 3; ++i) {
        _goodPointFields.add(TextField(
          enabled: false,
          maxLengthEnforced: true,
          style: TextStyle(color: Colors.black),
          obscureText: false,
          maxLines: 1,
          decoration: const InputDecoration(
            icon: Icon(
              Icons.thumb_up,
              color: Colors.orange,
            ),
          ),
        ));
      }
    }

    goodPoints?.forEach((point) {
      goodPointControllerList.add(TextEditingController(text: point.point));
      _goodPointFields.add(
      TextField(
        enabled: false,
        maxLengthEnforced: true,
        style: TextStyle(color: Colors.black),
        obscureText: false,
        maxLines: 1,
        controller: goodPointControllerList[goodPointControllerList.length - 1],
        decoration: const InputDecoration(
          icon: Icon(
            Icons.thumb_up,
            color: Colors.orange,
          ),
        ),
      ));
    });

    if (badPoints == null) {
      for (var i = 0; i < 3; ++i) {
        _badPointFields.add(TextField(
          enabled: false,
          maxLengthEnforced: true,
          style: TextStyle(color: Colors.black),
          obscureText: false,
          maxLines: 1,
          decoration: const InputDecoration(
            icon: Icon(
              Icons.thumb_down,
              color: Colors.blue,
            ),
          ),
        ));
      }
    }

    badPoints?.forEach((point) {
      badPointControllerList.add(TextEditingController(text: point.point));
      _badPointFields.add(
      TextField(
        enabled: false,
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
        ),
      ));
    });

    otherController = new TextEditingController(text: _state["other"]);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: MyDrawer(),
      appBar: ReigsterAppBar(
        title: 'Reference',
        function: null
      ),
      body: _buildRegisterList(),
    );
  }

  ListView _buildRegisterList() {
    return ListView(
      children: <Widget>[
        _itemFeeling(),
        _itemCondition(),
        _itemBreakfast(),
        _itemLunch(),
        _itemDinner(),
        _itemSnack(),
        _itemGoodPoint(),
        _itemBadPoint(),
        _itemOther()
      ],
    );
  }

  Widget _itemFeeling() {
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
              '気分',
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                children: <Widget>[
                  StateIcon(
                    type: 'feeling',
                    groupValue: _currentFeeling,
                    value: 5,
                    color: Colors.orange[700],
                    icon: Icons.thumb_up,
                    onChanged: null,
                  ),
                  Text(
                    '最高',
                    style: TextStyle(color: Colors.black, fontSize: 18.0),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  StateIcon(
                    type: 'feeling',
                    groupValue: _currentFeeling,
                    value: 4,
                    color: Colors.orange,
                    icon: Icons.thumb_up,
                    onChanged: null,
                  ),
                  Text(
                    '良い',
                    style: TextStyle(color: Colors.black, fontSize: 18.0),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.values[1],
                children: <Widget>[
                  StateIcon(
                    type: 'feeling',
                    groupValue: _currentFeeling,
                    value: 3,
                    color: Colors.green,
                    icon: Icons.thumbs_up_down,
                    onChanged: null,
                  ),
                  Text(
                    '普通',
                    style: TextStyle(color: Colors.black, fontSize: 18.0),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  StateIcon(
                    type: 'feeling',
                    groupValue: _currentFeeling,
                    value: 2,
                    color: Colors.blue,
                    icon: Icons.thumb_down,
                    onChanged: null,
                  ),
                  Text(
                    '悪い',
                    style: TextStyle(color: Colors.black, fontSize: 18.0),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  StateIcon(
                    type: 'feeling',
                    groupValue: _currentFeeling,
                    value: 1,
                    color: Colors.blue[800],
                    icon: Icons.thumb_down,
                    onChanged: null,
                  ),
                  Text(
                    '最低',
                    style: TextStyle(color: Colors.black, fontSize: 18.0),
                  ),
                ],
              ),
            ],
          )
        ]),
      ),
      onTap: () {},
    );
  }

  Widget _itemCondition() {
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
              '体調',
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                children: <Widget>[
                  StateIcon(
                    type: 'condition',
                    groupValue: _currentCondition,
                    value: 5,
                    color: Colors.orange[700],
                    icon: Icons.thumb_up,
                    onChanged: null,
                  ),
                  Text(
                    '最高',
                    style: TextStyle(color: Colors.black, fontSize: 18.0),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  StateIcon(
                    type: 'condition',
                    groupValue: _currentCondition,
                    value: 4,
                    color: Colors.orange,
                    icon: Icons.thumb_up,
                    onChanged: null,
                  ),
                  Text(
                    '良い',
                    style: TextStyle(color: Colors.black, fontSize: 18.0),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  StateIcon(
                    type: 'condition',
                    groupValue: _currentCondition,
                    value: 3,
                    color: Colors.green,
                    icon: Icons.thumbs_up_down,
                    onChanged: null,
                  ),
                  Text(
                    '普通',
                    style: TextStyle(color: Colors.black, fontSize: 18.0),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  StateIcon(
                    type: 'condition',
                    groupValue: _currentCondition,
                    value: 2,
                    color: Colors.blue,
                    icon: Icons.thumb_down,
                    onChanged: null,
                  ),
                  Text(
                    '悪い',
                    style: TextStyle(color: Colors.black, fontSize: 18.0),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  StateIcon(
                    type: 'condition',
                    groupValue: _currentCondition,
                    value: 1,
                    color: Colors.blue[800],
                    icon: Icons.thumb_down,
                    onChanged: null,
                  ),
                  Text(
                    '最低',
                    style: TextStyle(color: Colors.black, fontSize: 18.0),
                  ),
                ],
              ),
            ],
          )
        ]),
      ),
      onTap: () {},
    );
  }

  Widget _itemBreakfast() {
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
              '朝食',
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                children: <Widget>[
                  StateIcon(
                    type: 'ateBreakfast',
                    groupValue: _currentBreakfast,
                    value: 1,
                    color: Colors.orange[700],
                    icon: Icons.thumb_up,
                    onChanged: null,
                  ),
                  Text(
                    'あり',
                    style: TextStyle(color: Colors.black, fontSize: 18.0),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  StateIcon(
                    type: 'ateBreakfast',
                    groupValue: _currentBreakfast,
                    value: null,
                    color: Colors.green,
                    icon: Icons.thumbs_up_down,
                    onChanged: null,
                  ),
                  Text(
                    'まだ',
                    style: TextStyle(color: Colors.black, fontSize: 18.0),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  StateIcon(
                    type: 'ateBreakfast',
                    groupValue: _currentBreakfast,
                    value: 0,
                    color: Colors.blue[800],
                    icon: Icons.thumb_down,
                    onChanged: null,
                  ),
                  Text(
                    'なし',
                    style: TextStyle(color: Colors.black, fontSize: 18.0),
                  ),
                ],
              ),
            ],
          )
        ]),
      ),
      onTap: () {},
    );
  }

  Widget _itemLunch() {
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
              '昼食',
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                children: <Widget>[
                  StateIcon(
                    type: 'ateLunch',
                    groupValue: _currentLunch,
                    value: 1,
                    color: Colors.orange[700],
                    icon: Icons.thumb_up,
                    onChanged: null,
                  ),
                  Text(
                    'あり',
                    style: TextStyle(color: Colors.black, fontSize: 18.0),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  StateIcon(
                    type: 'ateLunch',
                    groupValue: _currentLunch,
                    value: null,
                    color: Colors.green,
                    icon: Icons.thumbs_up_down,
                    onChanged: null,
                  ),
                  Text(
                    'まだ',
                    style: TextStyle(color: Colors.black, fontSize: 18.0),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  StateIcon(
                    type: 'ateLunch',
                    groupValue: _currentLunch,
                    value: 0,
                    color: Colors.blue[800],
                    icon: Icons.thumb_down,
                    onChanged: null,
                  ),
                  Text(
                    'なし',
                    style: TextStyle(color: Colors.black, fontSize: 18.0),
                  ),
                ],
              ),
            ],
          )
        ]),
      ),
      onTap: () {},
    );
  }

  Widget _itemDinner() {
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
              '夕食',
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                children: <Widget>[
                  StateIcon(
                    type: 'ateDinner',
                    groupValue: _currentDinner,
                    value: 1,
                    color: Colors.orange[700],
                    icon: Icons.thumb_up,
                    onChanged: null,
                  ),
                  Text(
                    'あり',
                    style: TextStyle(color: Colors.black, fontSize: 18.0),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  StateIcon(
                    type: 'ateDinner',
                    groupValue: _currentDinner,
                    value: null,
                    color: Colors.green,
                    icon: Icons.thumbs_up_down,
                    onChanged: null,
                  ),
                  Text(
                    'まだ',
                    style: TextStyle(color: Colors.black, fontSize: 18.0),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  StateIcon(
                    type: 'ateDinner',
                    groupValue: _currentDinner,
                    value: 0,
                    color: Colors.blue[800],
                    icon: Icons.thumb_down,
                    onChanged: null,
                  ),
                  Text(
                    'なし',
                    style: TextStyle(color: Colors.black, fontSize: 18.0),
                  ),
                ],
              ),
            ],
          )
        ]),
      ),
      onTap: () {},
    );
  }

  Widget _itemSnack() {
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
              '間食',
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                children: <Widget>[
                  StateIcon(
                    type: 'ateSnack',
                    groupValue: _currentSnack,
                    value: 1,
                    color: Colors.orange[700],
                    icon: Icons.thumb_up,
                    onChanged: null,
                  ),
                  Text(
                    'あり',
                    style: TextStyle(color: Colors.black, fontSize: 18.0),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  StateIcon(
                    type: 'ateSnack',
                    groupValue: _currentSnack,
                    value: 0,
                    color: Colors.blue[800],
                    icon: Icons.thumb_down,
                    onChanged: null,
                  ),
                  Text(
                    'なし',
                    style: TextStyle(color: Colors.black, fontSize: 18.0),
                  ),
                ],
              ),
            ],
          )
        ]),
      ),
      onTap: () {},
    );
  }

  Widget _itemGoodPoint() {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: new BoxDecoration(
            border:
                new Border(bottom: BorderSide(width: 1.0, color: Colors.grey))),
        child: Column(children: <Widget>[
          Column(children: _goodPointFields,),
        ],),
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
        child: Column(children: <Widget>[
          Column(children: _badPointFields,),
        ],),
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
            enabled: false,
            keyboardType: TextInputType.multiline,
            maxLines: 5,
            controller: otherController,
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.only(left: 8, top: 10), // Set new height here
              border: OutlineInputBorder(),
            ),
          )
        ]),
      ),
      onTap: () {},
    );
  }
}

class StateIcon<T> extends StatefulWidget {
  final String type;
  final dynamic value;
  final dynamic groupValue;
  final Color color;
  final IconData icon;
  final ValueChanged<T> onChanged;
  StateIcon({
    Key key, @required this.type, 
    @required this.value, @required this.groupValue, 
    @required this.color, @required this.icon, this.onChanged
  }) : super(key: key);

  @override
  _StateIcon<T> createState() => _StateIcon<T>();
}

class _StateIcon<T> extends State<StateIcon<T>> {

  _onPushed() {
    // setState(() {
    //   // _state[widget.type] = widget.value;
    //   if (widget.onChanged != null) 
    //     // widget.onChanged(widget.value);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(
        icon: Icon(widget.icon, 
          color: (widget.groupValue == widget.value || !_state.containsKey(widget.type)) ? widget.color : Colors.grey,
        ),
        onPressed: null, 
      ),
    );
  }
}
