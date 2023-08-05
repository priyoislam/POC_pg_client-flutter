import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class MyData extends ChangeNotifier {
  String _name;
  String _timeVal; //= "01.00";
  int _ampmindex = 0;
  String _localVal;

  String get name => _name;
  String get timeVal => _timeVal;
  int get ampm => _ampmindex;
  String get localVal => _localVal;

  set name(String value) {
    _name = value;
    notifyListeners();
  }

  set timeVal(String value) {
    _timeVal = value;
    notifyListeners();
  }

  set ampm(int value) {
    _ampmindex = value;
    notifyListeners();
  }

  set localVal(String value) {
    _localVal = value;
    notifyListeners();
  }
}
