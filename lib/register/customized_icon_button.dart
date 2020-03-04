import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomizedIconButton<T> extends StatelessWidget {
  final T value;
  final T currentValue;
  final Color color;
  final IconData icon;
  final ValueChanged<T> onValueChanged;
  const CustomizedIconButton(
      {Key key,
      @required this.value,
      @required this.currentValue,
      @required this.color,
      @required this.icon,
      @required this.onValueChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(
        icon: Icon(
          this.icon,
          color: (this.currentValue == -1 || this.currentValue == this.value)
              ? this.color
              : Colors.grey, // TODO 初期値を要検討。
        ),
        onPressed: () =>
            {if (this.onValueChanged != null) this.onValueChanged(this.value)},
      ),
    );
  }
}
