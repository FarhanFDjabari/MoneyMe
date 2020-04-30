import 'dart:convert';
import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:money_me_app/models/budget_model.dart';

class BudgetProvider with ChangeNotifier {
  BudgetProvider() {
    initBudget();
  }

  Future<Budget> _budget;

  Future<Budget> get budget => _budget;

  set budget(Future<Budget> val) {
    _budget = val;
    notifyListeners();
  }

  void initBudget() {
    _budget = fetchBudget();
  }

  Future<Budget> fetchBudget() async {
    final response =
        await http.get('http://moneyme.lokertim.com/api/budgets/weekly/1');

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      print('fetchBudget : ${response.statusCode}');

      return Budget.fromJson(jsonDecode(response.body));
    } else {
      print('fetchBudget : ${response.statusCode}');
      throw Exception('Failed to load album');
    }
  }

  Future<Budget> createBudget(
      dynamic dateFrom, dynamic dateTo, String budget, String acc) async {
    final http.Response response = await http.post(
      'http://moneyme.lokertim.com/api/add-budgets/1',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'date_from': dateFrom,
        'date_to': dateTo,
        'budget': budget,
        'account_id': acc,
      }),
    );

    print(dateFrom);
    print(dateTo);
    print(budget);
    print(acc);
    if (response.statusCode == 201) {
      print("createBudget ${response.statusCode}");
      return Budget.fromJson(jsonDecode(response.body)); // berhasil print 200
    } else {
      print("createBudget ${response.statusCode}"); //gagal print 500
    }
  }
}
