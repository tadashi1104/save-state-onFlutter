import 'package:flutter/material.dart';

class BadPointTextFields extends StatefulWidget {
  final List<TextEditingController> controllers;
  final enabled;
  const BadPointTextFields({this.controllers, this.enabled = true});

  @override
  _BadPointTextFieldsState createState() => _BadPointTextFieldsState();
}

class _BadPointTextFieldsState extends State<BadPointTextFields> {
  List<Widget> _textFields;

  @override
  void initState() {
    super.initState();

    this._textFields = [
      Align(
          alignment: Alignment.centerLeft,
          child: Text('悪かったこと（+ボタンで増やせる）',
              textAlign: TextAlign.right,
              style: TextStyle(color: Colors.black, fontSize: 18)))
    ];

    widget.controllers?.forEach((controller) => _addTextField(controller));
    var length = widget.controllers.length;
    for (var i = 0; i < 3 - length; i++) {
      _onPressed();
    }
  }

  @override
  Widget build(BuildContext context) {
    var widgets = <Widget>[Column(children: _textFields)];

    if (widget.enabled) {
      widgets.add(IconButton(icon: Icon(Icons.add), onPressed: _onPressed));
    }

    return GestureDetector(
        child: Container(
            padding: EdgeInsets.all(8.0),
            decoration: new BoxDecoration(
                border: new Border(
                    bottom: BorderSide(width: 1.0, color: Colors.grey))),
            child: Column(children: widgets)),
        onTap: () {});
  }

  _onPressed() {
    var controller = new TextEditingController();
    widget.controllers.add(controller);
    _addTextField(controller);
  }

  _addTextField(controller) {
    setState(() {
      _textFields.add(TextField(
          enabled: widget.enabled,
          maxLengthEnforced: true,
          style: TextStyle(color: Colors.black),
          obscureText: false,
          maxLines: 1,
          controller: controller,
          decoration: const InputDecoration(
              icon: Icon(Icons.thumb_down, color: Colors.blue))));
    });
  }
}
