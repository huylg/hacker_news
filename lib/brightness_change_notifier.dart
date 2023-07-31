import 'package:flutter/material.dart';

class BrightnessChangeNotifier extends ChangeNotifier {
  var _brightness = Brightness.dark;

  Brightness get brightness => _brightness;

  set brightness(Brightness value) {
    _brightness = value;
    notifyListeners();
  }
}
