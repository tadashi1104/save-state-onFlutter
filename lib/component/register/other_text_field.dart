import 'package:flutter/material.dart';

class OtherTextField extends StatefulWidget {
  final TextEditingController controller;
  const OtherTextField({@required this.controller});

  @override
  _OtherTextFieldState createState() => _OtherTextFieldState();
}

class _OtherTextFieldState extends State<OtherTextField> {
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
            controller: widget.controller,
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
