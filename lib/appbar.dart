import 'package:flutter/material.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  
  final String title;

  MyAppBar({Key key, this.title}) : super(key: key);

  @override
  _MyAppBar createState() => _MyAppBar();

  @override
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);
}

class _MyAppBar extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(widget.title),
    );
  }

}