import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_me_app/models/budget_model.dart';
import 'package:money_me_app/services/budget_services.dart';
import 'package:money_me_app/services/settings_services.dart';
import 'package:money_me_app/utils/color_util.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class ActivePage extends StatefulWidget {
  @override
  _ActivePageState createState() => _ActivePageState();
}

class _ActivePageState extends State<ActivePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<Budget> futureBudget;

  DateTime _dateTime;

  DateTime _dateFrom, _dateTo;
  DateFormat _dateFormat = DateFormat('yyyy-MM-dd');

  final _budgetController = new TextEditingController();
  final _accountController = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // futureBudget = fetchBudget();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Consumer<BudgetProvider>(
          builder: (context, budget, _) => FutureBuilder(
              future: budget.budget,
              builder: (context, dataBudget) {
                if (dataBudget.hasData) {
                  print("berhasil");

                  return ListView.builder(
                    itemCount: dataBudget.data.listActiveBudget.length,
                    itemBuilder: (context, index) {
                      return budgetCard(
                          dataBudget.data.listActiveBudget, index);
                    },
                  );
                } else if (dataBudget.hasError) {
                  return Text(dataBudget.error);
                }

                return Center(child: CircularProgressIndicator());
              })),
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
    dynamic dataActive = data[index];
    var _budget = double.parse(dataActive.balance);
    var _expense = double.parse(dataActive.budget);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    dataActive.accountName,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  Text(dataActive.balance),
                ]),
            SizedBox(height: 20),
            new LinearPercentIndicator(
              width: 330.0,
              lineHeight: 14.0,
              percent: 0.5,
              backgroundColor: Colors.blue[200],
              progressColor: Colors.purple[100],
              center: new Text((_budget / _expense).toString()),
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
                        TextField(
                          onTap: () {
                            showDatePicker(
                                    context: context,
                                    initialDate: _dateFrom == null
                                        ? DateTime.now()
                                        : _dateFrom,
                                    firstDate:
                                        DateTime(DateTime.now().year - 10),
                                    lastDate:
                                        DateTime(DateTime.now().year + 10))
                                .then((onValue) => {
                                      setState(() {
                                        _dateFrom = onValue;
                                      })
                                    });
                          },
                          readOnly: false,
                          decoration: InputDecoration(
                              labelText: _dateFrom == null
                                  ? "Date From"
                                  : _dateFormat.format(_dateFrom).toString()),
                        ),
                        TextField(
                          onTap: () {
                            showDatePicker(
                                    context: context,
                                    initialDate: _dateFrom == null
                                        ? DateTime.now()
                                        : _dateTo,
                                    firstDate:
                                        DateTime(DateTime.now().year - 10),
                                    lastDate:
                                        DateTime(DateTime.now().year + 10))
                                .then((onValue) => {
                                      setState(() {
                                        _dateTo = onValue;
                                      })
                                    });
                          },
                          readOnly: false,
                          decoration: InputDecoration(
                              labelText: _dateTo == null
                                  ? "Date To"
                                  : _dateFormat.format(_dateTo).toString()),
                        ),
                        TextField(
                          controller: _budgetController,
                          decoration: InputDecoration(labelText: 'Budget'),
                        ),
                        TextField(
                          controller: _accountController,
                          decoration: InputDecoration(labelText: 'Account'),
                        ),
                        // Container(
                        //   padding: EdgeInsets.symmetric(horizontal: 20),
                        //   margin: EdgeInsets.only(bottom: 10, top: 5),
                        //   child: TextFormField(
                        //     decoration: InputDecoration(
                        //       icon: Icon(
                        //         Icons.credit_card,
                        //       ),
                        //       border: OutlineInputBorder(
                        //         borderRadius:
                        //             BorderRadius.all(Radius.circular(5)),
                        //       ),
                        //       labelText: 'Expense Account',
                        //     ),
                        //   ),
                        // ),
                        // Container(
                        //   padding: EdgeInsets.symmetric(horizontal: 20),
                        //   margin: EdgeInsets.only(bottom: 10, top: 5),
                        //   child: TextFormField(
                        //     onTap: () async {
                        //       final selectedDate = await selectDate(context);
                        //       if (selectedDate == 0) return;
                        //     },
                        //     readOnly: true,
                        //     decoration: InputDecoration(
                        //       icon: Icon(
                        //         Icons.description,
                        //       ),
                        //       border: OutlineInputBorder(
                        //         borderRadius:
                        //             BorderRadius.all(Radius.circular(5)),
                        //       ),
                        //       labelText: 'Account Date',
                        //     ),
                        //   ),
                        // ),
                        // Container(
                        //   padding: EdgeInsets.symmetric(horizontal: 20),
                        //   margin: EdgeInsets.only(bottom: 10, top: 5),
                        //   child: TextFormField(
                        //     onTap: () async {
                        //       final selectedDate = await selectDate(context);
                        //       if (selectedDate == 0) return;
                        //     },
                        //     readOnly: true,
                        //     decoration: InputDecoration(
                        //       icon: Icon(
                        //         Icons.description,
                        //       ),
                        //       border: OutlineInputBorder(
                        //         borderRadius:
                        //             BorderRadius.all(Radius.circular(5)),
                        //       ),
                        //       labelText: 'Account Date',
                        //     ),
                        //   ),
                        // ),
                        // Container(
                        //   padding: EdgeInsets.symmetric(horizontal: 20),
                        //   margin: EdgeInsets.only(bottom: 10, top: 5),
                        //   child: TextFormField(
                        //     decoration: InputDecoration(
                        //       icon: Icon(
                        //         Icons.attach_money,
                        //       ),
                        //       border: OutlineInputBorder(
                        //         borderRadius:
                        //             BorderRadius.all(Radius.circular(5)),
                        //       ),
                        //       labelText: 'Budget Amount',
                        //     ),
                        //   ),
                        // ),
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
                              Consumer<BudgetProvider>(
                                builder: (context, budget, _) => InkWell(
                                  focusColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  child: Container(
                                      alignment: Alignment.centerRight,
                                      margin: EdgeInsets.only(left: 5),
                                      padding: EdgeInsets.symmetric(
                                          vertical: 12, horizontal: 50),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
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
                                    budget.budget = budget.createBudget(
                                        _dateFormat
                                            .format(_dateFrom)
                                            .toString(),
                                        _dateFormat.format(_dateTo).toString(),
                                        _budgetController.text,
                                        _accountController.text);
                                    ;
                                    Navigator.pop(context);
                                    _scaffoldKey.currentState
                                        .showSnackBar(_snackBar());
                                  },
                                ),
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

  Future<DateTime> selectDate(BuildContext context) => showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2010),
        lastDate: DateTime(2045),
      ).then((date) {
        setState(() {
          _dateTime = date;
        });
      });

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
