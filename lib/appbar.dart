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

class ReigsterAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;

  ReigsterAppBar({Key key, this.title}) : super(key: key);

  @override
  _ReigsterAppBar createState() => _ReigsterAppBar();

  @override
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);
}

class _ReigsterAppBar extends State<ReigsterAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      // leading: new IconButton(
      //   icon: new Icon(Icons.arrow_back, color: Colors.white),
      //   onPressed: () => Navigator.of(context).pop(),
      // ),
      title: Text('Register'),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.save_alt,
            color: Colors.white,
          ),
          onPressed: () {},
        )
      ],
    );
  }
}
