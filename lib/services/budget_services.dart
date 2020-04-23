import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:money_me_app/models/budget_model.dart';

class BudgetService with ChangeNotifier {
  Budget _budget;
  Budget get getBudgetModel => _budget;

  set getBudgetModel (Budget val) {
    _budget = val;
    notifyListeners();
  }

  Future<Budget> fetchBudget(String id) async {
    final response =
    await http.get('http://moneyme.lokertim.com/api/budgets/weekly/' + id);

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      getBudgetModel = Budget.fromJson(json.decode(response.body));
      return getBudgetModel;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load budget');
    }
  }
}