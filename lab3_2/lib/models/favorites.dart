import 'dart:ui';

import 'package:flutter/material.dart';

class Favorites extends ChangeNotifier {
  Set<Color> _colors = {};

  Set<Color> get colors => _colors;

  void add(Color color) {
    _colors.add(color);
    notifyListeners();
  }

  void remove(Color color) {
    _colors.remove(color);
    notifyListeners();
  }

  bool contains(Color color) {
    return _colors.contains(color);
  }
}
