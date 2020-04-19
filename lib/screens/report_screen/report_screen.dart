import 'package:flutter/material.dart';
import 'package:money_me_app/utils/color_util.dart';

class ReportScreen extends StatefulWidget {
  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  var periode = "";
  var type = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    periode = "Monthly";
    type = "Cash Flow";
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Container(
                color: ColorUtil.PurpleBackground,
                child: Row(
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        _periodeBottomSheet(context);
                      },
                      child: Container(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Icon(Icons.calendar_today, size: 14),
                              Text(periode, style: TextStyle(fontSize: 14))
                            ]),
                      ),
                    ),
                    InkWell(
                        onTap: () {
                          print('Type pressed');
                          _typeBottomSheet(context);
                        },
                        child: Container(
                            child: Text(
                          type,
                          style: TextStyle(fontSize: 14),
                        ))),
                    InkWell(
                        onTap: () {
                          print('Export');
                          _exportBottomSheet(context);
                        },
                        child: Container(
                            child: Text(
                          'Export',
                          style: TextStyle(fontSize: 14),
                        ))),
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
              ),
            ),
            body: Column(
              children: <Widget>[

              ],
            )));
  }

  

  // void _showExportBottomSheet(BuildContext context) {
  //   showModalBottomSheet(
  //       context: (context),
  //       builder: (context) {
  //         return Container(
  //           padding: EdgeInsets.only(
  //               bottom: MediaQuery.of(context).viewInsets.bottom),
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.start,
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: <Widget>[
  //               Container(
  //                 margin: EdgeInsets.only(top: 25),
  //                 padding: EdgeInsets.symmetric(horizontal: 20),
  //                 child: Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   children: <Widget>[
  //                     Text(
  //                       'Export',
  //                       style: TextStyle(
  //                         fontSize: 25,
  //                         color: Colors.black,
  //                         fontWeight: FontWeight.w800,
  //                       ),
  //                     ),
  //                     IconButton(
  //                       icon: Icon(
  //                         Icons.close,
  //                         color: Colors.black,
  //                         size: 28,
  //                       ),
  //                       onPressed: () => Navigator.pop(context),
  //                     )
  //                   ],
  //                 ),
  //               ),
  //               Container(
  //                   width: 170,
  //                   padding: EdgeInsets.symmetric(vertical: 12, horizontal: 55),
  //                   margin: EdgeInsets.only(bottom: 10, top: 5),
  //                   decoration: BoxDecoration(
  //                       border: Border.all(
  //                           color: ColorUtil.PurpleBackground, width: 2),
  //                       borderRadius: BorderRadius.circular(5.0)),
  //                   child: Text(
  //                     "Monthly",
  //                     style: TextStyle(
  //                         color: ColorUtil.PurpleBackground,
  //                         fontSize: 15,
  //                         fontWeight: FontWeight.w500),
  //                     textAlign: TextAlign.center,
  //                   )),
  //               Text('1'),
  //               Text('2'),
  //               Text('3'),
  //             ],
  //           ),
  //         );
  //       },
  //       shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.only(
  //         topLeft: const Radius.circular(10),
  //         topRight: const Radius.circular(10),
  //       )));
  // }

  Widget _buttonPeriodeButtomSheet(String periodeText) {
    return Container(
      padding: EdgeInsets.only(left: 25, bottom: 10),
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            periode = periodeText;
          });
        },
        child: Container(
          width: 300,
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 55),
          decoration: BoxDecoration(
            border: Border.all(color: ColorUtil.PurpleBackground, width: 1),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            periodeText,
            style: TextStyle(
                color: ColorUtil.PurpleBackground,
                fontSize: 15,
                fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  void _periodeBottomSheet(BuildContext context) async {
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
                          margin: EdgeInsets.only(top: 25, bottom: 15),
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Choose Period',
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
                        _buttonPeriodeButtomSheet("Daily"),
                        _buttonPeriodeButtomSheet("Weekly"),
                        _buttonPeriodeButtomSheet("Monthly"),
                        _buttonPeriodeButtomSheet("Yearly"),
                      ],
                    )
                  ],
                )),
          );
        });
  }

  Widget _buttonTypeButtomSheet(String typeText) {
    return Container(
      padding: EdgeInsets.only(left: 25, bottom: 10),
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            type = typeText;
          });
        },
        child: Container(
          width: 300,
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 55),
          decoration: BoxDecoration(
            border: Border.all(color: ColorUtil.PurpleBackground, width: 1),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            typeText,
            style: TextStyle(
                color: ColorUtil.PurpleBackground,
                fontSize: 15,
                fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  void _typeBottomSheet(BuildContext context) async {
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
                          margin: EdgeInsets.only(top: 25, bottom: 15),
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Report Type',
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
                        _buttonTypeButtomSheet("Cash Flow"),
                        _buttonTypeButtomSheet("Net Income"),
                        _buttonTypeButtomSheet("Net Worth"),
                      ],
                    )
                  ],
                )),
          );
        });
  }

  Widget _buttonExportButtomSheet(String typeText) {
    return Container(
      padding: EdgeInsets.only(left: 25, bottom: 10),
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          _scaffoldKey.currentState.showSnackBar(_snackBar());
        },
        child: Container(
          width: 300,
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 55),
          decoration: BoxDecoration(
            border: Border.all(color: ColorUtil.PurpleBackground, width: 1),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            typeText,
            style: TextStyle(
                color: ColorUtil.PurpleBackground,
                fontSize: 15,
                fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  void _exportBottomSheet(BuildContext context) async {
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
                          margin: EdgeInsets.only(top: 25, bottom: 15),
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Choose Period',
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
                        _buttonExportButtomSheet("ALL"),
                        _buttonExportButtomSheet("Bar Chart"),
                        _buttonExportButtomSheet("Pie Chart"),
                        _buttonExportButtomSheet("Statement"),
                        _buttonExportButtomSheet("Ledger"),
                      ],
                    )
                  ],
                )),
          );
        });
  }

  SnackBar _snackBar() {
    Duration _snackBarDisplayDuration = new Duration(seconds: 2);
    return SnackBar(
        content: Text('Your transaction has been export'),
        behavior: SnackBarBehavior.floating,
        action: SnackBarAction(
            textColor: ColorUtil.PurpleBackground,
            label: 'DETAIL',
            onPressed: () {}),
        duration: _snackBarDisplayDuration);
  }
}