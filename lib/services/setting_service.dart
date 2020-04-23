import 'package:flutter/foundation.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:money_me_app/models/setting_model.dart';

class SettingService with ChangeNotifier {
  SettingModel _settingsModel;
  SettingModel get getSetModel => _settingsModel;

  set getSetModel (SettingModel val) {
    _settingsModel = val;
    notifyListeners();
  }

  Future<SettingModel> fetchSettings(String id) async {
    final response = await http.get(
        'http://moneyme.lokertim.com/api/settings/' + id);

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      getSetModel = SettingModel.fromJson(json.decode(response.body));
      return getSetModel;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load transaction');
    }
  }
}