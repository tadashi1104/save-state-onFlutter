import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'appbar.dart';

import 'component/register/feeling.dart';
import 'component/register/condition.dart';
import 'component/register/ate_breakfast.dart';
import 'component/register/ate_lunch.dart';
import 'component/register/ate_dinner.dart';
import 'component/register/ate_snack.dart';
import 'component/register/good_points_text_fields.dart';
import 'component/register/bad_points_text_fields.dart';
import 'component/register/other_text_field.dart';

class ReferencePage extends StatefulWidget {
  final Map<String, dynamic> state;
  const ReferencePage({this.state});

  @override
  _ReferencePageState createState() => _ReferencePageState();
}

class _ReferencePageState extends State<ReferencePage> {
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

    var _state = widget.state;

    this._feeling = Feeling(
        callback: (value) => _state["feeling"] = value,
        value: _state['feeling'],
        enabled: false);
    this._condition = Condition(
        callback: (value) => _state["condition"] = value,
        value: _state['condition'],
        enabled: false);
    this._ateBreakfast = AteBreakfast(
        callback: (value) => _state["ateBreakfast"] = value,
        value: _state['ateBreakfast'],
        enabled: false);
    this._ateLunch = AteLunch(
        callback: (value) => _state["ateLunch"] = value,
        value: _state['ateLunch'],
        enabled: false);
    this._ateDinner = AteDinner(
        callback: (value) => _state["ateDinner"] = value,
        value: _state['ateDinner'],
        enabled: false);
    this._ateSnack = AteSnack(
        callback: (value) => _state["ateSnack"] = value,
        value: _state['ateSnack'],
        enabled: false);

    this._goodPointsTextFields = GoodPointTextFields(
        controllers: _state['goodPoints']
            ?.map<TextEditingController>(
                (goodPoint) => TextEditingController(text: goodPoint.point))
            ?.toList(),
        enabled: false);

    this._badPointsTextFields = BadPointTextFields(
        controllers: _state['badPoints']
            ?.map<TextEditingController>(
                (badPoint) => TextEditingController(text: badPoint.point))
            ?.toList(),
        enabled: false);

    this._otherTextField = OtherTextField(
        controller: TextEditingController(text: _state["other"]),
        enabled: false);
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
        appBar: ReigsterAppBar(title: 'Reference', function: null),
        body: _buildRegisterList());
  }

  ListView _buildRegisterList() {
    return ListView(children: <Widget>[
      _feeling,
      _condition,
      _ateBreakfast,
      _ateLunch,
      _ateDinner,
      _ateSnack,
      _goodPointsTextFields,
      _badPointsTextFields,
      _otherTextField
    ]);
  }
}
