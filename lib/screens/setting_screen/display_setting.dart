import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DisplaySettings extends StatelessWidget{
  DisplaySettings({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            padding: EdgeInsets.all(25),
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Transaction Type',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Cash Expense',
                              style: TextStyle(
                                  fontSize: 15
                              ),
                            ),
                            Text(
                              'cashExpenseValue',
                              style: TextStyle(
                                  fontSize: 15
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Credit Card Expense',
                              style: TextStyle(
                                  fontSize: 15
                              ),
                            ),
                            Text(
                              'ccValue',
                              style: TextStyle(
                                  fontSize: 15
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Get Income',
                              style: TextStyle(
                                  fontSize: 15
                              ),
                            ),
                            Text(
                              'incomeValue',
                              style: TextStyle(
                                  fontSize: 15
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Receive Debt',
                              style: TextStyle(
                                  fontSize: 15
                              ),
                            ),
                            Text(
                              'debtValue',
                              style: TextStyle(
                                  fontSize: 15
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Pay Debt',
                              style: TextStyle(
                                  fontSize: 15
                              ),
                            ),
                            Text(
                              'payDebtValue',
                              style: TextStyle(
                                  fontSize: 15
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Give Credit',
                              style: TextStyle(
                                  fontSize: 15
                              ),
                            ),
                            Text(
                              'giveValue',
                              style: TextStyle(
                                  fontSize: 15
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Credit Repayment',
                              style: TextStyle(
                                  fontSize: 15
                              ),
                            ),
                            Text(
                              'repayValue',
                              style: TextStyle(
                                  fontSize: 15
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Buy Asset',
                              style: TextStyle(
                                  fontSize: 15
                              ),
                            ),
                            Text(
                              'buyAssetValue',
                              style: TextStyle(
                                  fontSize: 15
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Sell Asset',
                              style: TextStyle(
                                  fontSize: 15
                              ),
                            ),
                            Text(
                              'sellAssetValue',
                              style: TextStyle(
                                  fontSize: 15
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Gain',
                              style: TextStyle(
                                  fontSize: 15
                              ),
                            ),
                            Text(
                              'gainValue',
                              style: TextStyle(
                                  fontSize: 15
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Depreciation',
                              style: TextStyle(
                                  fontSize: 15
                              ),
                            ),
                            Text(
                              'depreciationValue',
                              style: TextStyle(
                                  fontSize: 15
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Opening Balance',
                              style: TextStyle(
                                  fontSize: 15
                              ),
                            ),
                            Text(
                              'openingValue',
                              style: TextStyle(
                                  fontSize: 15
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(top: 15),
                  child: Text(
                    'Categories',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Income',
                              style: TextStyle(
                                  fontSize: 15
                              ),
                            ),
                            Text(
                              'incomeCategory',
                              style: TextStyle(
                                  fontSize: 15
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Expense',
                              style: TextStyle(
                                  fontSize: 15
                              ),
                            ),
                            Text(
                              'expenseCategory',
                              style: TextStyle(
                                  fontSize: 15
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Cash & Cash Equivalent',
                              style: TextStyle(
                                  fontSize: 15
                              ),
                            ),
                            Text(
                              'ccEquivalentCategory',
                              style: TextStyle(
                                  fontSize: 15
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Credit',
                              style: TextStyle(
                                  fontSize: 15
                              ),
                            ),
                            Text(
                              'creditCategory',
                              style: TextStyle(
                                  fontSize: 15
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Assets',
                              style: TextStyle(
                                  fontSize: 15
                              ),
                            ),
                            Text(
                              'AssetsCategory',
                              style: TextStyle(
                                  fontSize: 15
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Credit Card',
                              style: TextStyle(
                                  fontSize: 15
                              ),
                            ),
                            Text(
                              'ccCategory',
                              style: TextStyle(
                                  fontSize: 15
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Debt',
                              style: TextStyle(
                                  fontSize: 15
                              ),
                            ),
                            Text(
                              'debtCategory',
                              style: TextStyle(
                                  fontSize: 15
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


}