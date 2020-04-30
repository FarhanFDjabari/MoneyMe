import 'package:flutter/material.dart';
import 'package:money_me_app/models/budget_model.dart';
import 'package:money_me_app/services/budget_services.dart';
import 'package:money_me_app/utils/color_util.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class FuturePage extends StatefulWidget {
  @override
  _FuturePageState createState() => _FuturePageState();
}

class _FuturePageState extends State<FuturePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Consumer<BudgetProvider>(
        builder: (context, data, _) => FutureBuilder(
          future: data.budget,
          builder: (context, dataBudget) {
            if (dataBudget.hasData) {
              print("Future page has data");
              return ListView.builder(
                  itemCount: dataBudget.data.listFutureBudget.length,
                  itemBuilder: (context, index) =>
                      budgetCard(dataBudget.data.listFutureBudget, index));
            }

            return Center(
                child: CircularProgressIndicator(
              backgroundColor: Colors.purple,
            ));
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorUtil.PurpleBackground,
        onPressed: () {
          showAsBottomSheet(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Card budgetCard(data, int index) {
    dynamic dataFuture = data[index];
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    dataFuture.accountName,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  Text(dataFuture.balance),
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
                  Text(dataFuture.dateFrom),
                  Text(dataFuture.budget)
                ]),
          ],
        ),
      ),
    );
  }

  void showAsBottomSheet(BuildContext context) async {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(10),
            topRight: const Radius.circular(10),
          ),
        ),
        context: context,
        builder: (context) {
          return WillPopScope(
            onWillPop: () async => false,
            child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                color: Colors.transparent,
                child: Wrap(
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 25),
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Budget Detail',
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.close,
                                  color: Colors.black,
                                  size: 28,
                                ),
                                onPressed: () => Navigator.pop(context),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          margin: EdgeInsets.only(bottom: 10, top: 5),
                          child: TextFormField(
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.credit_card,
                              ),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                              ),
                              labelText: 'Expense Account',
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          margin: EdgeInsets.only(bottom: 10, top: 5),
                          child: TextFormField(
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.description,
                              ),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                              ),
                              labelText: 'Account Date',
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          margin: EdgeInsets.only(bottom: 10, top: 5),
                          child: TextFormField(
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.attach_money,
                              ),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                              ),
                              labelText: 'Budget Amount',
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 25, top: 15),
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              InkWell(
                                  focusColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  child: Container(
                                    alignment: Alignment.centerRight,
                                    margin: EdgeInsets.only(right: 5),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 12, horizontal: 20),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Text(
                                      "Cancel",
                                      style: TextStyle(
                                          color: ColorUtil.PurpleBackground,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  onTap: () => Navigator.pop(context)),
                              InkWell(
                                focusColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                child: Container(
                                    alignment: Alignment.centerRight,
                                    margin: EdgeInsets.only(left: 5),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 12, horizontal: 50),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: ColorUtil.PurpleBackground),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          "Save",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    )),
                                onTap: () {
                                  Navigator.pop(context);
                                  _scaffoldKey.currentState
                                      .showSnackBar(_snackBar());
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                )),
          );
        });
  }

  SnackBar _snackBar() {
    Duration _snackBarDisplayDuration = new Duration(seconds: 1);
    return SnackBar(
        content: Text('Your budget has been saved'),
        behavior: SnackBarBehavior.floating,
        action: SnackBarAction(
            textColor: ColorUtil.PurpleBackground,
            label: 'DETAIL',
            onPressed: () {}),
        duration: _snackBarDisplayDuration);
  }
}
