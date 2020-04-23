import 'package:flutter/foundation.dart';

class ChangePeriod with ChangeNotifier {
  String _selectedPeriod = "Daily";

  String get selectedPeriod => _selectedPeriod;

  set selectPeriod(String period) {
    _selectedPeriod = period;

    notifyListeners();
  }
}
