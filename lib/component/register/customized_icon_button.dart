import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomizedIconButton<T> extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;
  final T value;
  final T currentValue;
  final ValueChanged<T> onValueChanged;
  const CustomizedIconButton(
      {Key key,
      @required this.icon,
      @required this.color,
      @required this.text,
      @required this.value,
      @required this.currentValue,
      @required this.onValueChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: <Widget>[
        IconButton(
          icon: Icon(
            this.icon,
            color: (this.currentValue == -1 || this.currentValue == this.value)
                ? this.color
                : Colors.grey, // TODO 初期値を要検討。
          ),
          onPressed: () => {
            if (this.onValueChanged != null) this.onValueChanged(this.value)
          },
        ),
        Text(
          this.text,
          style: TextStyle(color: Colors.black, fontSize: 18.0),
        ),
      ]),
    );
  }
}
