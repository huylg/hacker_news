import 'package:flutter/material.dart';

class Material3DesignFlagChangeNotifier extends ChangeNotifier {
  var _material3DesignFlag = true;

  bool get material3DesignFlag => _material3DesignFlag;

  set material3DesignFlag(bool value) {
    _material3DesignFlag = value;
    notifyListeners();
  }
}
