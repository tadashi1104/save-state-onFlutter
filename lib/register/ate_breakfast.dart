import 'package:flutter/material.dart';
import 'customized_icon_button.dart';

class AteBreakfast extends StatefulWidget {
  final callback;
  const AteBreakfast(this.callback);

  @override
  _AteBreakfastState createState() => _AteBreakfastState();
}

class _AteBreakfastState extends State<AteBreakfast> {
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
                  CustomizedIconButton(
                    currentValue: _value,
                    value: 1,
                    color: Colors.orange[700],
                    icon: Icons.thumb_up,
                    onValueChanged: _handle,
                  ),
                  Text(
                    'あり',
                    style: TextStyle(color: Colors.black, fontSize: 18.0),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  CustomizedIconButton(
                    currentValue: _value,
                    value: null,
                    color: Colors.green,
                    icon: Icons.thumbs_up_down,
                    onValueChanged: _handle,
                  ),
                  Text(
                    'まだ',
                    style: TextStyle(color: Colors.black, fontSize: 18.0),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  CustomizedIconButton(
                    currentValue: _value,
                    value: 0,
                    color: Colors.blue[800],
                    icon: Icons.thumb_down,
                    onValueChanged: _handle,
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
}
