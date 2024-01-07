import 'package:flutter/material.dart';

class NewNoteController extends ChangeNotifier {
  bool _readOnly = false;
  set readOnly(bool value) {
    _readOnly = value;
    notifyListeners();
  }

  bool get readOnly => _readOnly;
}
