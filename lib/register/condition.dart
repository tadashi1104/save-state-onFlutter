import 'package:flutter/material.dart';
import 'customized_icon_button.dart';

class Condition extends StatefulWidget {
  final callback;
  const Condition(this.callback);

  @override
  _ConditionState createState() => _ConditionState();
}

class _ConditionState extends State<Condition> {
  int _value = -1; // TODO 初期値を要検討。

  void _handle(int newValue) =>
      setState(() => {_value = newValue, widget.callback(_value)});

  @override
  Widget build(BuildContext context) {
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
                  CustomizedIconButton(
                    currentValue: _value,
                    value: 5,
                    color: Colors.orange[700],
                    icon: Icons.thumb_up,
                    onValueChanged: _handle,
                  ),
                  Text(
                    '最高',
                    style: TextStyle(color: Colors.black, fontSize: 18.0),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  CustomizedIconButton(
                    currentValue: _value,
                    value: 4,
                    color: Colors.orange,
                    icon: Icons.thumb_up,
                    onValueChanged: _handle,
                  ),
                  Text(
                    '良い',
                    style: TextStyle(color: Colors.black, fontSize: 18.0),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  CustomizedIconButton(
                    currentValue: _value,
                    value: 3,
                    color: Colors.green,
                    icon: Icons.thumbs_up_down,
                    onValueChanged: _handle,
                  ),
                  Text(
                    '普通',
                    style: TextStyle(color: Colors.black, fontSize: 18.0),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  CustomizedIconButton(
                    currentValue: _value,
                    value: 2,
                    color: Colors.blue,
                    icon: Icons.thumb_down,
                    onValueChanged: _handle,
                  ),
                  Text(
                    '悪い',
                    style: TextStyle(color: Colors.black, fontSize: 18.0),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  CustomizedIconButton(
                    currentValue: _value,
                    value: 1,
                    color: Colors.blue[800],
                    icon: Icons.thumb_down,
                    onValueChanged: _handle,
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
}
