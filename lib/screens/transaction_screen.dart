import 'package:auto_size_text/auto_size_text.dart';

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:money_me_app/services/changePeriod.dart';

import 'package:money_me_app/services/dateBarColor.dart';

import 'package:money_me_app/services/itemCourt.dart';

import 'package:money_me_app/utils/color_util.dart';

import 'package:intl/intl.dart';

import 'package:provider/provider.dart';

import 'package:money_me_app/utils/screen_util.dart';

class TransactionScreen extends StatelessWidget {
  TransactionScreen({Key key}) : super(key: key);

//  final TextEditingController _namaController = new TextEditingController();

//  final TextEditingController _tanggalController = new TextEditingController();

  final DateFormat dateFormat = DateFormat('dd-MMM-yyyy HH:mm');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: ScreenUtil.screenWidthDp,
        height: ScreenUtil.screenHeightDp,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Consumer<ChangePeriod>(
            builder: (context, selectedPeriod, _) => Consumer<ItemCount>(
              builder: (context, getItemCount, _) => Column(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(
                        top: 10, bottom: 15, left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
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
                                            bottom: MediaQuery.of(context)
                                                .viewInsets
                                                .bottom),
                                        color: Colors.transparent,
                                        child: Wrap(
                                          children: <Widget>[
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      top: 25, bottom: 15),
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 20),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: <Widget>[
                                                      AutoSizeText(
                                                        'Choose Period',
                                                        style: TextStyle(
                                                          fontSize: 25,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w800,
                                                        ),
                                                      ),
                                                      IconButton(
                                                        icon: Icon(
                                                          Icons.close,
                                                          color: Colors.black,
                                                          size: 28,
                                                        ),
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                context),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                AnimatedContainer(
                                                  duration: Duration(
                                                      milliseconds: 500),
                                                  padding: EdgeInsets.only(
                                                      left: 25, bottom: 10),
                                                  child: InkWell(
                                                    onTap: () {
                                                      selectedPeriod
                                                              .selectPeriod =
                                                          'Daily';

                                                      getItemCount.setItem = 30;

                                                      Navigator.pop(context);
                                                    },
                                                    child: Container(
                                                      width: 170,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 12,
                                                              horizontal: 55),
                                                      decoration: BoxDecoration(
                                                        color: selectedPeriod
                                                                    .selectedPeriod ==
                                                                'Daily'
                                                            ? ColorUtil
                                                                .PurpleBackground
                                                            : Colors
                                                                .transparent,
                                                        border: Border.all(
                                                            color: ColorUtil
                                                                .PurpleBackground,
                                                            width: 1),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                      ),
                                                      child: AutoSizeText(
                                                        "Daily",
                                                        style: TextStyle(
                                                            color: selectedPeriod
                                                                        .selectedPeriod ==
                                                                    'Daily'
                                                                ? Colors.white
                                                                : ColorUtil
                                                                    .PurpleBackground,
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                AnimatedContainer(
                                                  duration: Duration(
                                                      milliseconds: 500),
                                                  padding: EdgeInsets.only(
                                                      left: 25, bottom: 10),
                                                  child: InkWell(
                                                    onTap: () {
                                                      selectedPeriod
                                                              .selectPeriod =
                                                          'Weekly';

                                                      getItemCount.setItem = 4;

                                                      Navigator.pop(context);
                                                    },
                                                    child: Container(
                                                      width: 170,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 12,
                                                              horizontal: 48),
                                                      decoration: BoxDecoration(
                                                        color: selectedPeriod
                                                                    .selectedPeriod ==
                                                                'Weekly'
                                                            ? ColorUtil
                                                                .PurpleBackground
                                                            : Colors
                                                                .transparent,
                                                        border: Border.all(
                                                            color: ColorUtil
                                                                .PurpleBackground,
                                                            width: 1),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                      ),
                                                      child: AutoSizeText(
                                                        "Weekly",
                                                        style: TextStyle(
                                                            color: selectedPeriod
                                                                        .selectedPeriod ==
                                                                    'Weekly'
                                                                ? Colors.white
                                                                : ColorUtil
                                                                    .PurpleBackground,
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                AnimatedContainer(
                                                  duration: Duration(
                                                      milliseconds: 500),
                                                  padding: EdgeInsets.only(
                                                      left: 25, bottom: 10),
                                                  child: InkWell(
                                                    onTap: () {
                                                      selectedPeriod
                                                              .selectPeriod =
                                                          'Monthly';

                                                      getItemCount.setItem = 12;

                                                      Navigator.pop(context);
                                                    },
                                                    child: Container(
                                                      width: 170,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 12,
                                                              horizontal: 55),
                                                      decoration: BoxDecoration(
                                                        color: selectedPeriod
                                                                    .selectedPeriod ==
                                                                'Monthly'
                                                            ? ColorUtil
                                                                .PurpleBackground
                                                            : Colors
                                                                .transparent,
                                                        border: Border.all(
                                                            color: ColorUtil
                                                                .PurpleBackground,
                                                            width: 1),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                      ),
                                                      child: AutoSizeText(
                                                        "Monthly",
                                                        style: TextStyle(
                                                            color: selectedPeriod
                                                                        .selectedPeriod ==
                                                                    'Monthly'
                                                                ? Colors.white
                                                                : ColorUtil
                                                                    .PurpleBackground,
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                AnimatedContainer(
                                                  duration: Duration(
                                                      milliseconds: 500),
                                                  padding: EdgeInsets.only(
                                                      left: 25, bottom: 30),
                                                  child: InkWell(
                                                    onTap: () {
                                                      selectedPeriod
                                                              .selectPeriod =
                                                          'Yearly';

                                                      getItemCount.setItem = 5;

                                                      Navigator.pop(context);
                                                    },
                                                    child: Container(
                                                      width: 170,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 12,
                                                              horizontal: 55),
                                                      decoration: BoxDecoration(
                                                        color: selectedPeriod
                                                                    .selectedPeriod ==
                                                                'Yearly'
                                                            ? ColorUtil
                                                                .PurpleBackground
                                                            : Colors
                                                                .transparent,
                                                        border: Border.all(
                                                            color: ColorUtil
                                                                .PurpleBackground,
                                                            width: 1),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                      ),
                                                      child: AutoSizeText(
                                                        "Yearly",
                                                        style: TextStyle(
                                                            color: selectedPeriod
                                                                        .selectedPeriod ==
                                                                    'Yearly'
                                                                ? Colors.white
                                                                : ColorUtil
                                                                    .PurpleBackground,
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                AnimatedContainer(
                                                  duration: Duration(
                                                      milliseconds: 500),
                                                  padding: EdgeInsets.only(
                                                      left: 25, bottom: 30),
                                                  child: InkWell(
                                                    onTap: () {
                                                      showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              topLeft: const Radius
                                                                  .circular(10),
                                                              topRight: const Radius
                                                                  .circular(10),
                                                            ),
                                                          ),
                                                          context: context,
                                                          builder: (context) {
                                                            return SingleChildScrollView(
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              child:
                                                                  WillPopScope(
                                                                onWillPop:
                                                                    () async =>
                                                                        false,
                                                                child: Container(
                                                                    padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                                                                    color: Colors.transparent,
                                                                    child: Wrap(
                                                                      children: <
                                                                          Widget>[
                                                                        Column(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: <
                                                                              Widget>[
                                                                            Container(
                                                                              margin: EdgeInsets.only(top: 25),
                                                                              padding: EdgeInsets.symmetric(horizontal: 20),
                                                                              child: Row(
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: <Widget>[
                                                                                  AutoSizeText(
                                                                                    'Custom',
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
                                                                                    border: OutlineInputBorder(
                                                                                      borderRadius: BorderRadius.all(Radius.circular(5)),
                                                                                    ),
                                                                                    labelText: 'From Date',
                                                                                    prefixIcon: Icon(Icons.date_range)),
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
                                                                                  border: OutlineInputBorder(
                                                                                    borderRadius: BorderRadius.all(Radius.circular(5)),
                                                                                  ),
                                                                                  prefixIcon: Icon(Icons.date_range),
                                                                                  labelText: 'To Date',
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
                                                                                        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                                                                                        decoration: BoxDecoration(
                                                                                          borderRadius: BorderRadius.circular(5),
                                                                                        ),
                                                                                        child: Text(
                                                                                          "Cancel",
                                                                                          style: TextStyle(color: ColorUtil.PurpleBackground, fontSize: 15, fontWeight: FontWeight.w500),
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
                                                                                        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 50),
                                                                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: ColorUtil.PurpleBackground),
                                                                                        child: Row(
                                                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                          children: <Widget>[
                                                                                            Text(
                                                                                              "Save",
                                                                                              style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500),
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
                                                              ),
                                                            );
                                                          });
                                                    },
                                                    child: Container(
                                                      width: 170,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 12,
                                                              horizontal: 55),
                                                      decoration: BoxDecoration(
                                                        color: selectedPeriod
                                                                    .selectedPeriod ==
                                                                'Custom'
                                                            ? ColorUtil
                                                                .PurpleBackground
                                                            : Colors
                                                                .transparent,
                                                        border: Border.all(
                                                            color: ColorUtil
                                                                .PurpleBackground,
                                                            width: 1),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                      ),
                                                      child: AutoSizeText(
                                                        "Custom",
                                                        style: TextStyle(
                                                            color: selectedPeriod
                                                                        .selectedPeriod ==
                                                                    'Custom'
                                                                ? Colors.white
                                                                : ColorUtil
                                                                    .PurpleBackground,
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )),
                                  );
                                });
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width / 4,
                            height: 30,
                            decoration: BoxDecoration(
                                color: ColorUtil.PurpleBackground,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Icon(
                                    Icons.date_range,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    selectedPeriod.selectedPeriod,
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
                                Icons.search,
                                size: 20,
                              ),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                              ),
                              labelText: 'Search',
                              labelStyle: TextStyle(fontSize: 15),
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
                                width:
                                    MediaQuery.of(context).size.width / 3 - 20,
                                height: 70,
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 10),
                                      child: FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child: Text(
                                          'Balance',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child: Text(
                                          'Rp 25,000',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
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
                                width:
                                    MediaQuery.of(context).size.width / 3 - 20,
                                height: 70,
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 10),
                                      child: FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child: Text(
                                          'Net Income',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child: Text(
                                          'Rp 25,000',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
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
                                width:
                                    MediaQuery.of(context).size.width / 3 - 20,
                                height: 70,
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 10),
                                      child: FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child: Text(
                                          'Net Worth',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child: Text(
                                          'Rp 25,000',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        AnimatedContainer(
                            duration: Duration(milliseconds: 500),
                            margin: EdgeInsets.only(
                              top: 25,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: ColorUtil.greyColor,
                            ),
                            height: 25,
                            width: MediaQuery.of(context).size.width / 1.05,
                            child: Consumer<DateBarColor>(
                              builder: (context, dateBarColor, _) =>
                                  Consumer<ItemCount>(
                                builder: (context, getItemCount, _) =>
                                    ListView.builder(
                                        itemCount: getItemCount.itemCount,
                                        scrollDirection: Axis.horizontal,
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          return Row(
                                            children: <Widget>[
                                              InkWell(
                                                onTap: () {
                                                  dateBarColor.isSelected =
                                                      index;
                                                },
                                                child: AnimatedContainer(
                                                  duration: Duration(
                                                      milliseconds: 500),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      color: dateBarColor
                                                                  .isSelected ==
                                                              index
                                                          ? ColorUtil
                                                              .PurpleBackground
                                                          : ColorUtil
                                                              .greyColor),
                                                  height: 25,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      5.25,
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 5,
                                                            horizontal: 10),
                                                    child: AutoSizeText(
                                                      'MAR 2020',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 12),
                                                      minFontSize: 11,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        }),
                              ),
                            )),
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
                                height:
                                    MediaQuery.of(context).size.height / 1.6,
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
                                        width:
                                            MediaQuery.of(context).size.width,
                                        margin:
                                            EdgeInsets.symmetric(vertical: 5),
                                        padding: EdgeInsets.symmetric(
                                            vertical: 15, horizontal: 15),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color:
                                                    ColorUtil.PurpleBackground,
                                                width: 2),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5)),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Color(0XFFD3D6DA)
                                                      .withAlpha(50),
                                                  offset: Offset(1, 2),
                                                  blurRadius: 1,
                                                  spreadRadius: 1)
                                            ],
                                            color: Colors.white),
                                        child: InkWell(
                                          onTap: () => ReadBottomSheet(context),
                                          child: Container(
                                            child: Column(
                                              children: <Widget>[
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: <Widget>[
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          left: 10),
                                                      child: Text(
                                                        "25",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 20),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 2,
                                                      child: Container(
                                                        margin: EdgeInsets.only(
                                                            left: 15),
                                                        child: AutoSizeText(
                                                            "Transaction Description $index",
                                                            maxLines: 1,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500)),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        margin: EdgeInsets.only(
                                                            left: 10,
                                                            right: 10),
                                                        child: AutoSizeText(
                                                          "Rp 25,000",
                                                          stepGranularity: 2,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 16),
                                                          maxLines: 1,
                                                          maxFontSize: 18,
                                                          minFontSize: 6,
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                Container(
                                                  padding:
                                                      EdgeInsets.only(top: 5),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: <Widget>[
                                                      Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            5,
                                                        height: 20,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            5)),
                                                            color: ColorUtil
                                                                .PurpleBackground),
                                                        child: Container(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  vertical: 5,
                                                                  horizontal:
                                                                      5),
                                                          child: AutoSizeText(
                                                            'MAR 2020',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 11),
                                                            textAlign: TextAlign
                                                                .center,
                                                            maxLines: 1,
                                                            minFontSize: 10,
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            5,
                                                        height: 20,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            5)),
                                                            color: Colors
                                                                .deepPurple),
                                                        child: Container(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  vertical: 5,
                                                                  horizontal:
                                                                      5),
                                                          child: AutoSizeText(
                                                            'Transaction',
                                                            stepGranularity: 1,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 11),
                                                            textAlign: TextAlign
                                                                .center,
                                                            maxLines: 1,
                                                            minFontSize: 10,
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            5,
                                                        height: 20,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            5)),
                                                            color: ColorUtil
                                                                .PurpleAccent),
                                                        child: Container(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  vertical: 5,
                                                                  horizontal:
                                                                      5),
                                                          child: AutoSizeText(
                                                            'Account From',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 11),
                                                            textAlign: TextAlign
                                                                .center,
                                                            maxLines: 1,
                                                            minFontSize: 10,
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            5,
                                                        height: 20,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            5)),
                                                            color: ColorUtil
                                                                .PurpleLow),
                                                        child: Container(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  vertical: 5,
                                                                  horizontal:
                                                                      5),
                                                          child: AutoSizeText(
                                                            'Account To',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 11),
                                                            textAlign: TextAlign
                                                                .center,
                                                            maxLines: 1,
                                                            minFontSize: 10,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      secondaryActions: <Widget>[
                                        SlideAction(
                                          child: Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                color: ColorUtil.redColor),
                                            child: Icon(
                                              Icons.delete,
                                              color: Colors.white,
                                              size: 25,
                                            ),
                                          ),
                                          onTap: () {
                                            final deleteSnackBar = SnackBar(
                                              content: AutoSizeText(
                                                  'Transaction Deleted'),
                                              action: SnackBarAction(
                                                label: 'Undo',
                                                onPressed: () {
                                                  // Some code to undo the change.
                                                },
                                              ),
                                            );

                                            // Find the Scaffold in the widget tree and use

                                            // it to show a SnackBar.

                                            Scaffold.of(context)
                                                .showSnackBar(deleteSnackBar);
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
          ),
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

  void customPeriodBottomSheet(BuildContext context) async {
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
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: WillPopScope(
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
                                AutoSizeText(
                                  'Custom',
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
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                  ),
                                  labelText: 'From Date',
                                  prefixIcon: Icon(Icons.date_range)),
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
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                ),
                                prefixIcon: Icon(Icons.date_range),
                                labelText: 'To Date',
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
                                  onTap: () {},
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  )),
            ),
          );
        });
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
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: WillPopScope(
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
                              AutoSizeText(
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
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
                              icon: Icon(Icons.date_range),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
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
          ),
        );
      });
}

void readBottomSheet(){

}

void ReadBottomSheet(BuildContext context) async {
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
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
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
                              AutoSizeText(
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
                            readOnly: true,
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.card_membership,
                              ),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
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
                              icon: Icon(Icons.date_range),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                              ),
                              labelText: 'Date',
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          margin: EdgeInsets.only(bottom: 10, top: 5),
                          child: TextFormField(
                            readOnly: true,
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.supervisor_account,
                              ),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                              ),
                              labelText: 'Account From',
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          margin: EdgeInsets.only(bottom: 10, top: 5),
                          child: TextFormField(
                            readOnly: true,
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.group_add,
                              ),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                              ),
                              labelText: 'Account To',
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          margin: EdgeInsets.only(bottom: 10, top: 5),
                          child: TextFormField(
                            readOnly: true,
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.description,
                              ),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                              ),
                              labelText: 'Description',
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          margin: EdgeInsets.only(bottom: 10, top: 5),
                          child: TextFormField(
                            readOnly: true,
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.attach_money,
                              ),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
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
          ),
        );
      });
}

Future<DateTime> _selectDate(BuildContext context) => showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1990),
      lastDate: DateTime(2050),
    );

Future<TimeOfDay> _selectTime(BuildContext context) {
  final now = DateTime.now();

  return showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: now.hour, minute: now.minute));
}
