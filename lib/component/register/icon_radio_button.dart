import 'package:flutter/material.dart';
import 'customized_icon_button.dart';

class Feeling extends StatefulWidget {
  final title;
  final List<CustomizedIconButton> iconButtons;
  final callback;
  const Feeling(
      {@required this.title,
      @required this.iconButtons,
      @required this.callback});

  @override
  _FeelingState createState() => _FeelingState();
}

class _FeelingState extends State<Feeling> {
  int _value = -1; // TODO 初期値を要検討。

  void _handle(int newValue) =>
      setState(() => {_value = newValue, widget.callback(_value)});

  CustomizedIconButton createIconButton(icon, iconColor, text, value) {
    return CustomizedIconButton(
      currentValue: _value,
      icon: icon,
      color: iconColor,
      text: text,
      value: value,
      onValueChanged: _handle,
    );
  }

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
              widget.title,
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: widget.iconButtons)
        ]),
      ),
      onTap: () {},
    );
  }
}
