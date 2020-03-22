import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:money_me_app/utils/color_util.dart';
import 'package:intl/intl.dart';

class TransactionScreen extends StatelessWidget {
  TransactionScreen({Key key}) : super(key: key);

  final TextEditingController _namaController = new TextEditingController();
  final TextEditingController _tanggalController = new TextEditingController();
  final DateFormat dateFormat = DateFormat('dd-MMM-yyyy HH:mm');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtil.PurpleLight,
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 10,bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: MediaQuery.of(context).size.width / 4,
                    height: 30,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.date_range,
                          color: Colors.white,
                        ),
                        Text(
                          'Monthly',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: 30,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        Text(
                          'Search',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
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
                          color: ColorUtil.PurpleDark,
                        ),
                        width: 120,
                        height: 70,
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
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 25,),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey,
                  ),
                  height: 20,
                  width: MediaQuery.of(context).size.width/1.1,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: ColorUtil.PurpleBackground
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: ColorUtil.greyColor
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: ColorUtil.greyColor
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: ColorUtil.greyColor
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: ColorUtil.greyColor
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: ColorUtil.greyColor
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(top: 0),
              child: Column(
                children: <Widget>[
                  Container(
                    color: Colors.transparent,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width / 1.1,
                    child: Container(
                        color: Colors.transparent,
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        margin: EdgeInsets.only(top: 15),
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 3,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Slidable(
                              actionPane: SlidableDrawerActionPane(),
                              actionExtentRatio: 0.25,
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: 5),
                                padding: EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 15),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    boxShadow: [
                                      BoxShadow(
                                          color:
                                              Color(0XFFD3D6DA).withAlpha(50),
                                          offset: Offset(0, 1),
                                          blurRadius: 1,
                                          spreadRadius: 1)
                                    ],
                                    color: Colors.white),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child: Text(
                                        "25",
                                        style: TextStyle(
                                            color: ColorUtil.primaryColor,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 20),
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text("Transaction Description $index",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500)),
                                        Text("",
                                            style: TextStyle(
                                                color: ColorUtil.greyColor,
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal)),
                                      ],
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 20),
                                      child: Text(
                                        "Rp 25,000",
                                        style: TextStyle(
                                            color: ColorUtil.primaryColor,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16),
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
                                        color: ColorUtil.TrashRedBackground),
                                    child: Icon(
                                      Icons.delete_forever,
                                      color: ColorUtil.TrashRed,
                                      size: 25,
                                    ),
                                  ),
                                  onTap: () => print('Delete'),
                                  color: ColorUtil.PurpleLight,
                                ),
                              ],
                            );
                          },
                        )),
                  ),
                  Container(
                      color: Colors.transparent,
                      margin: EdgeInsets.only(top: 10),
                      height: 50,
                      width: 50,
                      padding: EdgeInsets.all(10),
                      child: CircularProgressIndicator(
                        backgroundColor: ColorUtil.PurpleBackground,
                      ))
                ],
              ),
            ),
          ),
        ],
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
                              onPressed: () {},
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        margin: EdgeInsets.only(bottom: 10, top: 5),
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Nama Board',
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

                            DateTime _dateTime;

                            _dateTime = DateTime(
                                selectedDate.year,
                                selectedDate.month,
                                selectedDate.day,
                                selectedTime.hour,
                                selectedTime.minute);
                          },
                          readOnly: true,
                          decoration: InputDecoration(
                            labelText: 'Tanggal Berangkat',
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 25),
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: InkWell(
                                focusColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                child: Container(
                                  margin: EdgeInsets.only(right: 5),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 12, horizontal: 55),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: ColorUtil.PurpleBackground,
                                        width: 1),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Text(
                                    "Batal",
                                    style: TextStyle(
                                        color: ColorUtil.PurpleBackground,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                onTap: () => Navigator.pop(context)
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                focusColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                child: Container(
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
                                          "Simpan",
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
