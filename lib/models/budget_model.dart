class Budget {
  final List<Past> listPastBudget;
  final List<Active> listActiveBudget;
  final List<FutureBudget> listFutureBudget;

  Budget({this.listPastBudget, this.listActiveBudget, this.listFutureBudget});

  factory Budget.fromJson(Map<String, dynamic> json) {
    var listPast = json['past'] as List;
    List<Past> pastList = listPast.map((i) => Past.fromJson(i)).toList();

    var listActive = json['active'] as List;
    List<Active> activeList =
        listActive.map((i) => Active.fromJson(i)).toList();

    var listFuture = json['future'] as List;
    List<FutureBudget> futureList =
        listFuture.map((i) => FutureBudget.fromJson(i)).toList();

    return Budget(
        listPastBudget: pastList,
        listActiveBudget: activeList,
        listFutureBudget: futureList);
  }
}

class Past {
  final String accountId;
  final String dateFrom;
  final String dateTo;
  final String budget;
  final String idType;

  Past({this.accountId, this.dateFrom, this.dateTo, this.budget, this.idType});

  factory Past.fromJson(Map<String, dynamic> json) {
    return Past(
        accountId: json['account_id'],
        dateFrom: json['date_from'],
        dateTo: json['date_to'],
        budget: json['budget'],
        idType: json['id_type']);
  }
}

class Active {
  final String accountId;
  final String dateFrom;
  final String dateTo;
  final String budget;
  final String idType;

  Active(
      {this.accountId, this.dateFrom, this.dateTo, this.budget, this.idType});

  factory Active.fromJson(Map<String, dynamic> json) {
    return Active(
        accountId: json['account_id'],
        dateFrom: json['date_from'],
        dateTo: json['date_to'],
        budget: json['budget'],
        idType: json['id_type']);
  }
}

class FutureBudget {
  final String accountId;
  final String dateFrom;
  final String dateTo;
  final String budget;
  final String idType;

  FutureBudget(
      {this.accountId, this.dateFrom, this.dateTo, this.budget, this.idType});

  factory FutureBudget.fromJson(Map<String, dynamic> json) {
    return FutureBudget(
        accountId: json['account_id'],
        dateFrom: json['date_from'],
        dateTo: json['date_to'],
        budget: json['budget'],
        idType: json['id_type']);
  }
}
