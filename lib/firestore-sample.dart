import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('firestore-sample'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('states').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError)
            return new Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState) {
            case ConnectionState.waiting: return new Text('Loading...');
            default:
              return new ListView(
                children: snapshot.data.documents.map((DocumentSnapshot document) {
                  return new ListTile(
                    title: new Text(document['id'].toString()),
                    subtitle: new Text(document['other']),
                  );
                }).toList(),
              );
          }
        },
      ),
    );
  }
}