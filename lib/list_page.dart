import 'package:flutter/material.dart';
import 'package:save_state_on_flutter/db_provider.dart';

import 'state_list.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPage createState() => _ListPage();
}

class _ListPage extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DBProvider.db.getState(),
      builder: (context, future) {
        return StateList(states: future.data);
      },
    ); 
  }
}
