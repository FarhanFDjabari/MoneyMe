import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:money_me_app/utils/color_util.dart';
import 'package:intl/intl.dart';
import 'package:money_me_app/utils/screen_util.dart';

class TransactionScreen extends StatelessWidget {
  TransactionScreen({Key key}) : super(key: key);

//  final TextEditingController _namaController = new TextEditingController();
//  final TextEditingController _tanggalController = new TextEditingController();
  final DateFormat dateFormat = DateFormat('dd-MMM-yyyy HH:mm');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 10, bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  InkWell(
                    onTap: () => periodeBottomSheet(context),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 4,
                      height: 30,
                      decoration: BoxDecoration(
                          color: ColorUtil.PurpleBackground,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.date_range,
                            color: Colors.white,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: Text(
                              'Monthly',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: 30,
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        labelText: 'Search'
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: ColorUtil.PurpleAccent,
                          ),
                          width: 120,
                          height: 70,
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                child: Text(
                                  'Balance',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                child: Text(
                                  'Rp 25,000',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: ColorUtil.PurpleShadow,
                          ),
                          width: 120,
                          height: 70,
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                child: Text(
                                  'Net Income',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                child: Text(
                                  'Rp 25,000',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: ColorUtil.PurpleLow,
                          ),
                          width: 120,
                          height: 70,
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                child: Text(
                                  'Net Worth',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                child: Text(
                                  'Rp 25,000',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                      margin: EdgeInsets.only(
                        top: 25,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: ColorUtil.greyColor,
                      ),
                      height: 25,
                      width: MediaQuery.of(context).size.width / 1.05,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 12,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Row(
                              children: <Widget>[
                                InkWell(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: ColorUtil.greyColor),
                                    height: 25,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 10),
                                      child: Text(
                                        'MAR 2020',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          })),
                ],
              ),
            ),
            Container(
              child: SingleChildScrollView(
                child: Container(
                  color: Colors.transparent,
                  width: ScreenUtil.screenWidthDp,
                  height: ScreenUtil.screenHeightDp,
                  child: Column(
                    children: <Widget>[
                      Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 1.6,
                          color: Colors.transparent,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          margin: EdgeInsets.only(top: 15),
                          child: ListView.builder(
                            itemCount: 9,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Slidable(
                                actionPane: SlidableDrawerActionPane(),
                                actionExtentRatio: 0.20,
                                child: Container(
                                  margin: EdgeInsets.symmetric(vertical: 5),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 15),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: ColorUtil.PurpleBackground,
                                          width: 2),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      boxShadow: [
                                        BoxShadow(
                                            color:
                                                Color(0XFFD3D6DA).withAlpha(50),
                                            offset: Offset(1, 2),
                                            blurRadius: 1,
                                            spreadRadius: 1)
                                      ],
                                      color: Colors.white),
                                  child: Column(
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Container(
                                            margin: EdgeInsets.only(left: 10),
                                            child: Text(
                                              "25",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 24),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                  "Transaction Description $index",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500)),
                                            ],
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(left: 20),
                                            child: Text(
                                              "Rp 25,000",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16),
                                            ),
                                          )
                                        ],
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(top: 5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: <Widget>[
                                            Container(
                                              width: 80,
                                              height: 20,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(5)),
                                                  color:
                                                      ColorUtil.PurpleBackground),
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 5, horizontal: 5),
                                                child: Text(
                                                  'MAR 2020',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 11),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 80,
                                              height: 20,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(5)),
                                                  color: Colors.deepPurple),
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 5, horizontal: 5),
                                                child: Text(
                                                  'Transaction',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 11),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 80,
                                              height: 20,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(5)),
                                                  color: ColorUtil.PurpleAccent),
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 5, horizontal: 5),
                                                child: Text(
                                                  'Account From',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 11),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 80,
                                              height: 20,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(5)),
                                                  color: ColorUtil.PurpleLow),
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 5, horizontal: 5),
                                                child: Text(
                                                  'Account To',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 11),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                secondaryActions: <Widget>[
                                  SlideAction(
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50),
                                          color: ColorUtil.redColor),
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.white,
                                        size: 25,
                                      ),
                                    ),
                                    onTap: () {
                                      final deleteSnackBar = SnackBar(
                                        content: Text('Transaction Deleted'),
                                        action: SnackBarAction(
                                          label: 'Undo',
                                          onPressed: () {
                                            // Some code to undo the change.
                                          },
                                        ),
                                      );

                                      // Find the Scaffold in the widget tree and use
                                      // it to show a SnackBar.
                                      Scaffold.of(context).showSnackBar(deleteSnackBar);
                                    },
                                    color: Colors.transparent,
                                  ),
                                ],
                              );
                            },
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorUtil.PurpleBackground,
        onPressed: () => showAsBottomSheet(context),
        elevation: 1,
        hoverElevation: 3,
        focusElevation: 3,
        highlightElevation: 3,
        splashColor: Colors.grey.withOpacity(0.4),
        foregroundColor: Colors.grey.withOpacity(0.2),
        hoverColor: Colors.transparent,
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
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
                              'Transaction Detail',
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
                              Icons.card_membership,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                            ),
                            labelText: 'Transaction Type',
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        margin: EdgeInsets.only(bottom: 20, top: 5),
                        child: TextFormField(
                          onTap: () async {
                            final selectedDate = await _selectDate(context);
                            if (selectedDate == null) return;

                            final selectedTime = await _selectTime(context);
                            if (selectedTime == null) return;

//                            DateTime _dateTime;

//                            _dateTime = DateTime(
//                                selectedDate.year,
//                                selectedDate.month,
//                                selectedDate.day,
//                                selectedTime.hour,
//                                selectedTime.minute);
                          },
                          readOnly: true,
                          decoration: InputDecoration(
                            icon: Icon(
                                Icons.date_range
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                            ),
                            labelText: 'Date',
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        margin: EdgeInsets.only(bottom: 10, top: 5),
                        child: TextFormField(
                          decoration: InputDecoration(
                            icon: Icon(
                              Icons.supervisor_account,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                            ),
                            labelText: 'Account From',
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        margin: EdgeInsets.only(bottom: 10, top: 5),
                        child: TextFormField(
                          decoration: InputDecoration(
                            icon: Icon(
                              Icons.group_add,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                            ),
                            labelText: 'Account To',
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
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                            ),
                            labelText: 'Description',
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
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                            ),
                            labelText: 'Price',
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
                              onTap: () {},
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

Future<DateTime> _selectDate(BuildContext context) => showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2010),
      lastDate: DateTime(2045),
    );

Future<TimeOfDay> _selectTime(BuildContext context) {
  final now = DateTime.now();

  return showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: now.hour, minute: now.minute));
}

void periodeBottomSheet(BuildContext context) async {
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
                      Container(
                        padding: EdgeInsets.only(left: 25, bottom: 10),
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            width: 170,
                            padding: EdgeInsets.symmetric(
                                vertical: 12, horizontal: 55),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: ColorUtil.PurpleBackground, width: 1),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              "Daily",
                              style: TextStyle(
                                  color: ColorUtil.PurpleBackground,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 25, bottom: 10),
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            width: 170,
                            padding: EdgeInsets.symmetric(
                                vertical: 12, horizontal: 48),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: ColorUtil.PurpleBackground, width: 1),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              "Weekly",
                              style: TextStyle(
                                  color: ColorUtil.PurpleBackground,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 25, bottom: 10),
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            width: 170,
                            padding: EdgeInsets.symmetric(
                                vertical: 12, horizontal: 55),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: ColorUtil.PurpleBackground, width: 1),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              "Monthly",
                              style: TextStyle(
                                  color: ColorUtil.PurpleBackground,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 25, bottom: 30),
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            width: 170,
                            padding: EdgeInsets.symmetric(
                                vertical: 12, horizontal: 55),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: ColorUtil.PurpleBackground, width: 1),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              "Yearly",
                              style: TextStyle(
                                  color: ColorUtil.PurpleBackground,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )),
        );
      });
}
