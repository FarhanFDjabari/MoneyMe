import 'package:flutter/material.dart';
import 'package:money_me_app/screen/transaction_screen.dart';
import 'package:money_me_app/utils/color_util.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int screen = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtil.PurpleLight,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorUtil.PurpleBackground,
        title: Container(
          child: Row(
            children: <Widget>[
              Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      screen = 1;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Icon(Icons.dashboard,
                        color: screen == 1
                            ? ColorUtil.PurpleLight
                            : Colors.white),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      screen = 2;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Icon(
                      Icons.history,
                      color: screen == 2
                          ? ColorUtil.PurpleLight
                          : Colors.white,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      screen = 3;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Icon(
                      Icons.search,
                      color: screen == 3
                          ? ColorUtil.PurpleLight
                          : Colors.white,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      screen = 4;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Icon(
                      Icons.account_circle,
                      color: screen == 4
                          ? ColorUtil.PurpleLight
                          : Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: SafeArea(
        top: true,
        child: screen == 1 ? TransactionScreen() : screen == 2 ? null : null,
      ),
    );
  }
}
