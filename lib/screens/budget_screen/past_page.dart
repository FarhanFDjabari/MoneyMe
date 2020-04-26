import 'package:flutter/material.dart';
import 'package:money_me_app/models/budget_model.dart';
import 'package:money_me_app/services/budget_services.dart';
import 'package:percent_indicator/percent_indicator.dart';

class PastPage extends StatefulWidget {
  @override
  _PastPageState createState() => _PastPageState();
}

class _PastPageState extends State<PastPage> {
  Future<Budget> futureBudget;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureBudget = fetchBudget();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Budget>(
        future: futureBudget,
        builder: (context, snapshot) {
          if (snapshot.data.listActiveBudget.length != 0) {
            return ListView.builder(
                itemCount: snapshot.data.listActiveBudget.length, //statis
                itemBuilder: (context, index) {
                  return budgetCard(snapshot.data, index);
                });
          }

          return Center(
              child: CircularProgressIndicator(
            backgroundColor: Colors.purple,
          ));
        },
      ),
    );
  }
}

Card budgetCard(data, int index) {
  dynamic dataActive = data.listActiveBudget[index];
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Account name",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Text("Expense"),
              ]),
          SizedBox(height: 20),
          new LinearPercentIndicator(
            width: 330.0,
            lineHeight: 14.0,
            percent: 0.5,
            backgroundColor: Colors.blue[200],
            progressColor: Colors.purple[100],
          ),
          SizedBox(height: 20),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(dataActive.dateFrom),
                Text(dataActive.budget)
              ]),
        ],
      ),
    ),
  );
}
