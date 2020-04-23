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
    final BudgetService budgetService = Provider.of<BudgetService>(context);
    return Scaffold(
      body: Consumer<BudgetService>(
          builder: (context, getBudget, _) => FutureBuilder(
            future: budgetService.fetchBudget("1"),
            builder: (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.done) {
                return ListView.builder(
                    itemCount: getBudget.getBudgetModel.listPastBudget.length,
                    itemBuilder: (context, index) {
                      return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        getBudget.getBudgetModel
                                            .listPastBudget[index].accountId,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
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
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text("Periode"),
                                      Text("Budget")
                                    ]),
                              ],
                            ),
                          )
                      );
                    });
              } else {
                return Center(
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 50, horizontal: 50),
                      height: 50,
                      width: 50,
                      child: CircularProgressIndicator(),
                    )
                );
              }
            }
          ),
      ),
    );
  }
}
