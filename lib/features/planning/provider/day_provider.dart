import 'dart:math';

import 'package:flutter/material.dart';

class DayProvider extends ChangeNotifier {
  double _val = Random().nextDouble() * 220;

  double get val => _val;

  void setval() {
    _val = Random().nextDouble() * 200;
    notifyListeners();
  }
}
