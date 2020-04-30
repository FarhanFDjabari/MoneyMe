import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:money_me_app/services/settings_services.dart';

import 'package:money_me_app/utils/color_util.dart';

import 'package:money_me_app/material/custom_expansion_tile.dart' as custom;

import 'package:money_me_app/utils/screen_util.dart';

class AccountSetting extends StatefulWidget {
  AccountSetting({Key key}) : super(key: key);

  @override
  _AccountSettingState createState() => _AccountSettingState();
}

class _AccountSettingState extends State<AccountSetting> {
    
  final _controllerName = TextEditingController();
  final _controllerSubCategory = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            color: Colors.transparent,
            width: ScreenUtil.screenWidthDp,
            height: ScreenUtil.screenHeightDp,
            padding: EdgeInsets.all(15),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(15),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Finance Account',
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return ExpansionTiles(financeTiles[index]);
                    },
                    itemCount: financeTiles.length,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.all(15),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'GL Account',
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return ExpansionTiles(glTiles[index]);
                    },
                    itemCount: glTiles.length,
                  ),
                ),
              ],
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
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
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
                                  'Add Account',
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
                                prefixIcon: Icon(
                                  Icons.search,
                                ),
                                hintText: 'Choose Category',
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                ),
                                labelText: 'Category',
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            margin: EdgeInsets.only(bottom: 20, top: 5),
                            child: TextField(
                              onTap: () {},
                              controller: _controllerSubCategory,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.search),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                ),
                                hintText: 'Choose Sub Category',
                                labelText: 'Sub Category',
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            margin: EdgeInsets.only(bottom: 10, top: 5),
                            child: TextField(
                              controller: _controllerName,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                ),
                                labelText: 'Account',
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
                                  onTap: () {
                                    Navigator.pop(context);
                                    createAccount(_controllerName.text, _controllerSubCategory.text);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )),
          );
        });
  }
}

class ExpansionTiles extends StatelessWidget {
  final MyTile myTile;

  ExpansionTiles(this.myTile);

  @override
  Widget build(BuildContext context) {
    return _buildTiles(myTile);
  }

  Widget _buildTiles(MyTile t) {
    if (t.children.isEmpty)
      return ListTile(
          dense: true,
          enabled: true,
          isThreeLine: false,
          onLongPress: () => print("long press"),
          onTap: () => print("tap"),
          selected: true,
          title: new Text(
            t.title,
            style: TextStyle(color: ColorUtil.PurpleBackground),
          ));

    return custom.ExpansionTile(
      backgroundColor: Colors.white,
      headerBackgroundColor: Colors.white,
      key: new PageStorageKey<int>(3),
      title: new Text(
        t.title,
        style: TextStyle(
            color: ColorUtil.PurpleBackground, fontWeight: FontWeight.w500),
      ),
      children: t.children.map(_buildTiles).toList(),
    );
  }
}

class MyTile {
  String title;

  List<MyTile> children;

  MyTile(this.title, [this.children = const <MyTile>[]]);
}

List<MyTile> financeTiles = <MyTile>[
  MyTile(
    'Income',
    <MyTile>[
      MyTile(
        'SubCategory',
        <MyTile>[
          new MyTile('Account'),
          new MyTile('Account'),
          new MyTile('Account'),
        ],
      ),
    ],
  ),
  MyTile(
    'Expense',
    <MyTile>[
      MyTile(
        'SubCategory',
        <MyTile>[
          new MyTile('Account'),
          new MyTile('Account'),
          new MyTile('Account'),
        ],
      ),
    ],
  ),
];

List<MyTile> glTiles = <MyTile>[
  MyTile(
    'Cash & Cash Equivalent',
    <MyTile>[
      MyTile(
        'SubCategory',
        <MyTile>[
          new MyTile('Account'),
          new MyTile('Account'),
          new MyTile('Account'),
        ],
      ),
    ],
  ),
  MyTile(
    'Credit',
    <MyTile>[
      MyTile(
        'SubCategory',
        <MyTile>[
          new MyTile('Account'),
          new MyTile('Account'),
          new MyTile('Account'),
        ],
      ),
    ],
  ),
  MyTile(
    'Assets',
    <MyTile>[
      MyTile(
        'SubCategory',
        <MyTile>[
          new MyTile('Account'),
          new MyTile('Account'),
          new MyTile('Account'),
        ],
      ),
    ],
  ),
  MyTile(
    'Credit Card',
    <MyTile>[
      MyTile(
        'SubCategory',
        <MyTile>[
          new MyTile('Account'),
          new MyTile('Account'),
          new MyTile('Account'),
        ],
      ),
    ],
  ),
  MyTile(
    'Debt',
    <MyTile>[
      MyTile(
        'SubCategory',
        <MyTile>[
          new MyTile('Account'),
          new MyTile('Account'),
          new MyTile('Account'),
        ],
      ),
    ],
  ),
];
