import 'package:flutter/material.dart';
import 'customized_icon_button.dart';

class AteSnack extends StatefulWidget {
  final callback;
  const AteSnack(this.callback);

  @override
  _AteSnackState createState() => _AteSnackState();
}

class _AteSnackState extends State<AteSnack> {
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
              CustomizedIconButton(
                currentValue: _value,
                value: 1,
                text: 'あり',
                color: Colors.orange[700],
                icon: Icons.thumb_up,
                onValueChanged: _handle,
              ),
              CustomizedIconButton(
                currentValue: _value,
                value: 0,
                text: 'なし',
                color: Colors.blue[800],
                icon: Icons.thumb_down,
                onValueChanged: _handle,
              ),
            ],
          )
        ]),
      ),
      onTap: () {},
    );
  }
}
