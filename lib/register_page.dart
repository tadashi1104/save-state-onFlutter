import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'appbar.dart';

Map<String, dynamic> _state = new Map<String, dynamic>();

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPage createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {

  int _currentFeeling;
  void _handleFeeling(int e) => setState(() {_currentFeeling = e;});
  int _currentCondition;
  void _handleCondition(int e) => setState(() {_currentCondition = e;});
  bool _currentBreakfast;
  void _handleBreakfast(bool e) => setState(() {_currentBreakfast = e;});
  bool _currentLunch;
  void _handleLunch(bool e) => setState(() {_currentLunch = e;});
  bool _currentDinner;
  void _handleDinner(bool e) => setState(() {_currentDinner = e;});
  bool _currentSnack;
  void _handleSnack(bool e) => setState(() {_currentSnack = e;});

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
      decoration: const InputDecoration(
        icon: Icon(
          Icons.thumb_up,
          color: Colors.orange,
        ),
        hintText: 'クララが立った',
      )
    ),
    TextField(
      enabled: true,
      maxLengthEnforced: true,
      style: TextStyle(color: Colors.black),
      obscureText: false,
      maxLines: 1,
      decoration: const InputDecoration(
        icon: Icon(
          Icons.thumb_up,
          color: Colors.orange,
        ),
        hintText: 'ソロモンに帰ってきた',
      )
    ),
    TextField(
      enabled: true,
      maxLengthEnforced: true,
      style: TextStyle(color: Colors.black),
      obscureText: false,
      maxLines: 1,
      decoration: const InputDecoration(
        icon: Icon(
          Icons.thumb_up,
          color: Colors.orange,
        ),
        hintText: '俺がその幻想をぶち殺す',
      )
    )
  ];
  _addField() {
    setState(() {
      _goodPointFields.add(
        TextField(
        enabled: true,
        maxLengthEnforced: true,
        style: TextStyle(color: Colors.black),
        obscureText: false,
        maxLines: 1,
        decoration: const InputDecoration(
          icon: Icon(
            Icons.thumb_up,
            color: Colors.orange,
          ),
        )
        )
      );
    });
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
      appBar: ReigsterAppBar(
        title: 'Register',
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
                    onChanged: _handleFeeling,
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
                    onChanged: _handleFeeling,
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
                    onChanged: _handleFeeling,
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
                    onChanged: _handleFeeling,
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
                    onChanged: _handleFeeling,
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
      onTap: () {
        print("onTap called.");
      },
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
                    onChanged: _handleCondition,
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
                    onChanged: _handleCondition,
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
                    onChanged: _handleCondition,
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
                    onChanged: _handleCondition,
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
                    onChanged: _handleCondition,
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
      onTap: () {
        print("onTap called.");
      },
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
                    value: true,
                    color: Colors.orange[700],
                    icon: Icons.thumb_up,
                    onChanged: _handleBreakfast,
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
                    value: false,
                    color: Colors.blue[800],
                    icon: Icons.thumb_down,
                    onChanged: _handleBreakfast,
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
      onTap: () {
        print("onTap called.");
      },
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
                    value: true,
                    color: Colors.orange[700],
                    icon: Icons.thumb_up,
                    onChanged: _handleLunch,
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
                    value: false,
                    color: Colors.blue[800],
                    icon: Icons.thumb_up,
                    onChanged: _handleLunch,
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
      onTap: () {
        print("onTap called.");
      },
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
                    value: true,
                    color: Colors.orange[700],
                    icon: Icons.thumb_up,
                    onChanged: _handleDinner,
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
                    value: false,
                    color: Colors.blue[800],
                    icon: Icons.thumb_down,
                    onChanged: _handleDinner,
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
      onTap: () {
        print("onTap called.");
      },
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
                    value: true,
                    color: Colors.orange[700],
                    icon: Icons.thumb_up,
                    onChanged: _handleSnack,
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
                    value: false,
                    color: Colors.blue[800],
                    icon: Icons.thumb_down,
                    onChanged: _handleSnack,
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
      onTap: () {
        print("onTap called.");
      },
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
          IconButton(icon: Icon(Icons.add), onPressed: () {_addField();},)
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
              decoration: const InputDecoration(
                icon: Icon(
                  Icons.thumb_down,
                  color: Colors.blue,
                ),
                hintText: '何股もかけて殺された',
              )),
        ]),
      ),
      onTap: () {
        print("onTap called.");
      },
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
    setState(() {
      _state[widget.type] = widget.value;
      if (widget.onChanged != null) 
        widget.onChanged(widget.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: IconButton(
        icon: Icon(widget.icon, 
          color: (widget.groupValue == widget.value || !_state.containsKey(widget.type)) ? widget.color : Colors.grey,
        ),
        onPressed: _onPushed, 
      ),
    );
  }
}
