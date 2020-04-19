import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class PastPage extends StatefulWidget {
  @override
  _PastPageState createState() => _PastPageState();
}

class _PastPageState extends State<PastPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 25,
          itemBuilder: (context, index) {
            return budgetCard();
          }),
    );
  }
}

Card budgetCard() {
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
              children: <Widget>[Text("Periode"), Text("Budget")]),
        ],
      ),
    ),
  );
}
