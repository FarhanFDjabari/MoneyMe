import 'package:flutter/material.dart';
import 'package:money_me_app/services/budget_services.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

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
      body: Consumer<BudgetProvider>(
        builder: (context, budget, _) => FutureBuilder(
          future: budget.budget,
          builder: (context, dataBudget) {
            if (dataBudget.hasData) {
              print("PastPage ada data");
              return ListView.builder(
                  itemCount: dataBudget.data.listPastBudget.length,
                  itemBuilder: (context, index) {
                    return budgetCard(dataBudget.data.listPastBudget, index);
                  });
            }

            return Center(
                child: CircularProgressIndicator(
              backgroundColor: Colors.purple,
            ));
          },
        ),
      ),
    );
  }
}

Card budgetCard(data, int index) {
  dynamic dataPast = data[index];
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  dataPast.accountName,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Text(dataPast.balance),
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
                Text(dataPast.dateFrom),
                Text(dataPast.budget)
              ]),
        ],
      ),
    ),
  );
}
