import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:save_state_on_flutter/db_provider.dart';
import 'appbar.dart';
import 'models/model.dart';

import 'component/register/feeling.dart';
import 'component/register/condition.dart';
import 'component/register/ate_breakfast.dart';
import 'component/register/ate_lunch.dart';
import 'component/register/ate_dinner.dart';
import 'component/register/ate_snack.dart';
import 'component/register/good_points_text_fields.dart';
import 'component/register/bad_points_text_fields.dart';
import 'component/register/other_text_field.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPage createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {
  Map<String, dynamic> _state = new Map<String, dynamic>();

  Feeling _feeling;
  Condition _condition;
  AteBreakfast _ateBreakfast;
  AteLunch _ateLunch;
  AteDinner _ateDinner;
  AteSnack _ateSnack;
  GoodPointTextFields _goodPointsTextFields;
  BadPointTextFields _badPointsTextFields;
  OtherTextField _otherTextField;

  @override
  void initState() {
    super.initState();
    _state = new Map<String, dynamic>();

    this._feeling = Feeling(
        (value) => {debugPrint(value.toString()), _state["feeling"] = value});
    this._condition = Condition(
        (value) => {debugPrint(value.toString()), _state["condition"] = value});
    this._ateBreakfast = AteBreakfast((value) =>
        {debugPrint(value.toString()), _state["ateBreakfast"] = value});
    this._ateLunch = AteLunch(
        (value) => {debugPrint(value.toString()), _state["ateLunch"] = value});
    this._ateDinner = AteDinner(
        (value) => {debugPrint(value.toString()), _state["ateDinner"] = value});
    this._ateSnack = AteSnack(
        (value) => {debugPrint(value.toString()), _state["ateSnack"] = value});
    this._goodPointsTextFields = GoodPointTextFields(controllers: [
      TextEditingController(),
      TextEditingController(),
      TextEditingController()
    ]);
    this._badPointsTextFields = BadPointTextFields(controllers: [
      TextEditingController(),
      TextEditingController(),
      TextEditingController()
    ]);
    this._otherTextField = OtherTextField(controller: TextEditingController());
  }

  @override
  void dispose() {
    for (var controller in _goodPointsTextFields.controllers) {
      controller.dispose();
    }
    _goodPointsTextFields.controllers.clear();

    for (var controller in _badPointsTextFields.controllers) {
      controller.dispose();
    }
    _badPointsTextFields.controllers.clear();

    _otherTextField.controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: MyDrawer(),
      appBar: ReigsterAppBar(title: 'Register', function: _pushedRegistration),
      body: ListView(
        children: <Widget>[
          _feeling,
          _condition,
          _ateBreakfast,
          _ateLunch,
          _ateDinner,
          _ateSnack,
          _goodPointsTextFields,
          _badPointsTextFields,
          _otherTextField
        ],
      ),
    );
  }

  Future<void> _pushedRegistration() async {
    final goodPoints = List<GoodPoints>();
    _goodPointsTextFields.controllers
        .where((controller) => controller.text != "")
        .forEach((goodPoint) =>
            goodPoints.add(new GoodPoints.fromMap({'point': goodPoint.text})));
    _state['GoodPoints'] = goodPoints;

    final badPoints = List<BadPoints>();
    _badPointsTextFields.controllers
        .where((controller) => controller.text != "")
        .forEach((badPoint) =>
            badPoints.add(new BadPoints.fromMap({'point': badPoint.text})));
    _state['BadPoints'] = badPoints;

    _state['other'] = _otherTextField.controller.text;
    _state['insertDateTime'] =
        (DateFormat('yyyyMMddTHHmmss').format(DateTime.now()));

    var state = new States.fromMap(_state);

    DBProvider.db.insertState(state);

    Navigator.of(context).pop();
  }
}
