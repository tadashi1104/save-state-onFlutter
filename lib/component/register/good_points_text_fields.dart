import 'package:flutter/material.dart';

class GoodPointTextFields extends StatefulWidget {
  final List<TextEditingController> controllers;
  const GoodPointTextFields({@required this.controllers});

  @override
  _GoodPointTextFieldsState createState() => _GoodPointTextFieldsState();
}

class _GoodPointTextFieldsState extends State<GoodPointTextFields> {
  List<Widget> _textFields;

  @override
  void initState() {
    super.initState();

    this._textFields = [
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
          controller: widget.controllers[0],
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
          controller: widget.controllers[1],
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
          controller: widget.controllers[2],
          decoration: const InputDecoration(
            icon: Icon(
              Icons.thumb_up,
              color: Colors.orange,
            ),
            hintText: '俺がその幻想をぶち殺す',
          ))
    ];
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: new BoxDecoration(
            border:
                new Border(bottom: BorderSide(width: 1.0, color: Colors.grey))),
        child: Column(
          children: <Widget>[
            Column(
              children: _textFields,
            ),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                _addTextField();
              },
            )
          ],
        ),
      ),
      onTap: () {},
    );
  }

  _addTextField() {
    setState(() {
      widget.controllers.add(new TextEditingController());
      _textFields.add(TextField(
          enabled: true,
          maxLengthEnforced: true,
          style: TextStyle(color: Colors.black),
          obscureText: false,
          maxLines: 1,
          controller: widget.controllers[widget.controllers.length - 1],
          decoration: const InputDecoration(
            icon: Icon(
              Icons.thumb_up,
              color: Colors.orange,
            ),
          )));
    });
  }
}
