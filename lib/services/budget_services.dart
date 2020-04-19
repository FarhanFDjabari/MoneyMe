import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:money_me_app/models/budget_model.dart';

Future<Budget> fetchBudget() async {
  final response =
      await http.get('http://moneyme.lokertim.com/api/budgets/weekly/1');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print('masuk future');
    return Budget.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
