import 'package:flutter/material.dart';
import 'customized_icon_button.dart';

class Condition extends StatefulWidget {
  final void Function(int) callback;
  final int value;
  final bool enabled;
  const Condition({this.callback, this.value = -1, this.enabled = true});

  @override
  _ConditionState createState() => _ConditionState();
}

class _ConditionState extends State<Condition> {
  int _value;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    var _handle;
    if (widget.enabled) {
      _handle = (int newValue) => setState(() {
            _value = newValue;
            if (widget.callback != null) widget.callback(_value);
          });
    }

    return GestureDetector(
        child: Container(
            padding: EdgeInsets.all(8.0),
            decoration: new BoxDecoration(
                border: new Border(
                    bottom: BorderSide(width: 1.0, color: Colors.grey))),
            child: Column(children: <Widget>[
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text('体調',
                      textAlign: TextAlign.right,
                      style: TextStyle(color: Colors.black, fontSize: 18))),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    CustomizedIconButton(
                        currentValue: _value,
                        value: 5,
                        text: '最高',
                        color: Colors.orange[700],
                        icon: Icons.thumb_up,
                        onValueChanged: _handle),
                    CustomizedIconButton(
                        currentValue: _value,
                        value: 4,
                        text: '良い',
                        color: Colors.orange,
                        icon: Icons.thumb_up,
                        onValueChanged: _handle),
                    CustomizedIconButton(
                        currentValue: _value,
                        value: 3,
                        text: '普通',
                        color: Colors.green,
                        icon: Icons.thumbs_up_down,
                        onValueChanged: _handle),
                    CustomizedIconButton(
                        currentValue: _value,
                        value: 2,
                        text: '悪い',
                        color: Colors.blue,
                        icon: Icons.thumb_down,
                        onValueChanged: _handle),
                    CustomizedIconButton(
                        currentValue: _value,
                        value: 1,
                        text: '最低',
                        color: Colors.blue[800],
                        icon: Icons.thumb_down,
                        onValueChanged: _handle)
                  ])
            ])),
        onTap: () {});
  }
}
