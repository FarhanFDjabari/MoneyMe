import 'package:flutter/foundation.dart';
import 'package:money_me_app/models/transaction_model.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class TransactionService with ChangeNotifier {
  TransactionModel _model;

  TransactionModel get getModel => _model;

  set getModel(TransactionModel val) {
    _model = val;

    notifyListeners();
  }

  Future<TransactionModel> fetchTransaction(String id) async {
    final response = await http.get(
        'http://moneyme.lokertim.com/api/transactions/2020-01-01/2020-04-23/' +
            id);

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,

      // then parse the JSON.

      getModel = TransactionModel.fromJson(json.decode(response.body));

      return getModel;
    } else {
      // If the server did not return a 200 OK response,

      // then throw an exception.

      throw Exception('Failed to load transaction');
    }
  }

  Future<bool> postTransaction(String id,dynamic data) async {
    final response = await http.post(
      'http://moneyme.lokertim.com/api/transactions/' + id,
      body: jsonEncode(<String, dynamic>{
        'account_form_view': data,
        'account_to_view': data,
        'transaction_name': data,
        'description': data,
        'date': data,
        'amount': data,
        'id_type': "1",
      }),
    );

    if (response.statusCode == 201) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return true;
    } else {
      throw Exception('Failed to load transaction');
    }
  }
}
