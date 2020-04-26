import 'dart:convert';
import 'package:http/http.dart' as http;

Future<bool> createAccount(String name, String subcategory) async {
  final http.Response response = await http.post(
    'http://moneyme.lokertim.com/api/account-add/1',
    
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'account_name': name,
      'subcategory_id' : "1"
    }),
  );

  if (response.statusCode == 201) {
    return true;
  } else {
    throw Exception('Failed to create album.');
  }
}
