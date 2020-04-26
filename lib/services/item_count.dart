import 'package:flutter/foundation.dart';

class ItemCount with ChangeNotifier {
  int _item = 12;

  int get itemCount => _item;

  set setItem(int count) {
    _item = count;

    notifyListeners();
  }
}
