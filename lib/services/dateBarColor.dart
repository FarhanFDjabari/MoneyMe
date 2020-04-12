import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DateBarColor with ChangeNotifier {
  int _isSelected = 0;

  int get isSelected => _isSelected;
  set isSelected(int value){
    _isSelected = value;
    notifyListeners();
  }

}