import 'package:flutter/material.dart';
import 'drawer.dart';
import 'appbar.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPage createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {
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
                  Container(
                    margin: EdgeInsets.all(10.0),
                    child: Icon(
                      Icons.thumb_up,
                      color: Colors.orange[700],
                    ),
                  ),
                  Text(
                    '最高',
                    style: TextStyle(color: Colors.black, fontSize: 18.0),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(10.0),
                    child: Icon(
                      Icons.thumb_up,
                      color: Colors.orange,
                    ),
                  ),
                  Text(
                    '良い',
                    style: TextStyle(color: Colors.black, fontSize: 18.0),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(10.0),
                    child: Icon(
                      Icons.thumbs_up_down,
                      color: Colors.green,
                    ),
                  ),
                  Text(
                    '普通',
                    style: TextStyle(color: Colors.black, fontSize: 18.0),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(10.0),
                    child: Icon(
                      Icons.thumb_down,
                      color: Colors.blue,
                    ),
                  ),
                  Text(
                    '悪い',
                    style: TextStyle(color: Colors.black, fontSize: 18.0),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(10.0),
                    child: Icon(
                      Icons.thumb_down,
                      color: Colors.blue[800],
                    ),
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
                  Container(
                    margin: EdgeInsets.all(10.0),
                    child: Icon(
                      Icons.thumb_up,
                      color: Colors.orange[700],
                    ),
                  ),
                  Text(
                    '最高',
                    style: TextStyle(color: Colors.black, fontSize: 18.0),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(10.0),
                    child: Icon(
                      Icons.thumb_up,
                      color: Colors.orange,
                    ),
                  ),
                  Text(
                    '良い',
                    style: TextStyle(color: Colors.black, fontSize: 18.0),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(10.0),
                    child: Icon(
                      Icons.thumbs_up_down,
                      color: Colors.green,
                    ),
                  ),
                  Text(
                    '普通',
                    style: TextStyle(color: Colors.black, fontSize: 18.0),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(10.0),
                    child: Icon(
                      Icons.thumb_down,
                      color: Colors.blue,
                    ),
                  ),
                  Text(
                    '悪い',
                    style: TextStyle(color: Colors.black, fontSize: 18.0),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(10.0),
                    child: Icon(
                      Icons.thumb_down,
                      color: Colors.blue[800],
                    ),
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
                  Container(
                    margin: EdgeInsets.all(10.0),
                    child: Icon(
                      Icons.thumb_up,
                      color: Colors.orange[700],
                    ),
                  ),
                  Text(
                    'あり',
                    style: TextStyle(color: Colors.black, fontSize: 18.0),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(10.0),
                    child: Icon(
                      Icons.thumb_down,
                      color: Colors.blue[800],
                    ),
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
                  Container(
                    margin: EdgeInsets.all(10.0),
                    child: Icon(
                      Icons.thumb_up,
                      color: Colors.orange[700],
                    ),
                  ),
                  Text(
                    'あり',
                    style: TextStyle(color: Colors.black, fontSize: 18.0),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(10.0),
                    child: Icon(
                      Icons.thumb_down,
                      color: Colors.blue[800],
                    ),
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
                  Container(
                    margin: EdgeInsets.all(10.0),
                    child: Icon(
                      Icons.thumb_up,
                      color: Colors.orange[700],
                    ),
                  ),
                  Text(
                    'あり',
                    style: TextStyle(color: Colors.black, fontSize: 18.0),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(10.0),
                    child: Icon(
                      Icons.thumb_down,
                      color: Colors.blue[800],
                    ),
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
                  Container(
                    margin: EdgeInsets.all(10.0),
                    child: Icon(
                      Icons.thumb_up,
                      color: Colors.orange[700],
                    ),
                  ),
                  Text(
                    'あり',
                    style: TextStyle(color: Colors.black, fontSize: 18.0),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(10.0),
                    child: Icon(
                      Icons.thumb_down,
                      color: Colors.blue[800],
                    ),
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
              )),
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
              )),
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
              ))
        ]),
      ),
      onTap: () {
        print("onTap called.");
      },
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
