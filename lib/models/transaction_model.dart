// To parse this JSON data, do
//
//     final transactionModel = transactionModelFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/foundation.dart';

class TransactionModel {
  dynamic balance;
  dynamic netIncome;
  String netWorth;
  List<ListTransaction> listTransactions;

  TransactionModel({
    this.balance,
    this.netIncome,
    this.netWorth,
    this.listTransactions,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    var list = json['list_transactions'] as List;
    List<ListTransaction> transactionList =
    list.map((i) => ListTransaction.fromJson(i)).toList();
    return TransactionModel(
      balance: json["balance"],
      netIncome: json["net_income"],
      netWorth: json["net_worth"],
      listTransactions: transactionList,
    );
  }
    Map<String, dynamic> toJson() => {
      "balance": balance,
      "net_income": netIncome,
      "net_worth": netWorth,
      "list_transactions": List<dynamic>.from(listTransactions.map((x) => x.toJson())),
    };
  }

class ListTransaction {
  String accountFormView;
  String accountToView;
  String transactionName;
  String description;
  DateTime date;
  String amount;
  String idType;

  ListTransaction({
    this.accountFormView,
    this.accountToView,
    this.transactionName,
    this.description,
    this.date,
    this.amount,
    this.idType,
  });

  factory ListTransaction.fromJson(Map<String, dynamic> json) => ListTransaction(
    accountFormView: json["account_form_view"],
    accountToView: json["account_to_view"],
    transactionName: json["transaction_name"],
    description: json["description"],
    date: DateTime.parse(json["date"]),
    amount: json["amount"],
    idType: json["id_type"],
  );

  Map<String, dynamic> toJson() => {
    "account_form_view": accountFormView,
    "account_to_view": accountToView,
    "transaction_name": transactionName,
    "description": description,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "amount": amount,
    "id_type": idType,
  };
}
