import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:save_state_on_flutter/models/model.dart';

class FireStoreProbider {

  Stream<QuerySnapshot> getStateStreamForDate(String date) {
    return Firestore.instance
      .collection("states")
      .where("insertDateTime", isEqualTo: date)
      .orderBy('insertDateTime', descending: true)
      .snapshots();
  } 

  // Future<List<States>> getStateForDate(String date) async {
  //   Firestore.instance
  //     .collection("states")
  //     .where("insertDateTime", isEqualTo: date)
  //     .orderBy('insertDateTime', descending: true);
      
  // } 

  void insertState(States state) {
    var stateMap = state.toMap();
    Firestore.instance.collection("states").document().setData(stateMap);
  }

  void updateData(String documentID, States state) {
    var stateMap = state.toMap();
    Firestore.instance.collection("states").document(documentID).updateData(stateMap);
  }




}