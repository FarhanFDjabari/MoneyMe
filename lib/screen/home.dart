import 'package:flutter/material.dart';
import 'package:money_me_app/screen/settings.dart';
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
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
                    child: Icon(Icons.home,
                        color:
                            screen == 1 ? Colors.white : ColorUtil.PurpleLight),
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
                      Icons.insert_chart,
                      color: screen == 2 ? Colors.white : ColorUtil.PurpleLight,
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
                      Icons.account_balance_wallet,
                      color: screen == 3 ? Colors.white : ColorUtil.PurpleLight,
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
                      color: screen == 4 ? Colors.white : ColorUtil.PurpleLight,
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
        child: screen == 1
            ? TransactionScreen()
            : screen == 2 ? null : screen == 3 ? null : SettingScreen(),
      ),
    );
  }
}
