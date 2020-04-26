import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:money_me_app/screens/budget_screen/budget_page.dart';
import 'package:money_me_app/screens/report_screen/report_screen.dart';
import 'package:money_me_app/screens/setting_screen/settings.dart';
import 'package:money_me_app/screens/transaction_screen/transaction_screen.dart';
import 'package:money_me_app/services/changePeriod.dart';
import 'package:money_me_app/services/dateBarColor.dart';
import 'package:money_me_app/services/item_count.dart';
import 'package:money_me_app/utils/color_util.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int screen = 1;

  @override
  void initState() {

    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ChangePeriod>(
          create: (context) => ChangePeriod(),
        ),
        ChangeNotifierProvider<DateBarColor>(
          create: (context) => DateBarColor(),
        ),
        ChangeNotifierProvider<ItemCount>(
          create: (context) => ItemCount(),
        )
      ],
      child: Scaffold(
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
                          color: screen == 1
                              ? Colors.white
                              : ColorUtil.PurpleLight),
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
                        color:
                            screen == 2 ? Colors.white : ColorUtil.PurpleLight,
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
                        color:
                            screen == 3 ? Colors.white : ColorUtil.PurpleLight,
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
                        color:
                            screen == 4 ? Colors.white : ColorUtil.PurpleLight,
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
              : screen == 2
                  ? ReportScreen()
                  : screen == 3 ? BudgetPage() : SettingScreen(),
        ),
      ),
    );
  }
}
