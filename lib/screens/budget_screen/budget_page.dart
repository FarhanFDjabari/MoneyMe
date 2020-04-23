import 'package:flutter/material.dart';
import 'package:money_me_app/screens/budget_screen/active_page.dart';
import 'package:money_me_app/screens/budget_screen/future_page.dart';
import 'package:money_me_app/screens/budget_screen/past_page.dart';
import 'package:money_me_app/services/budget_services.dart';
import 'package:money_me_app/utils/color_util.dart';
import 'package:provider/provider.dart';

class BudgetPage extends StatefulWidget {
  @override
  _BudgetPageState createState() => _BudgetPageState();
}

class _BudgetPageState extends State<BudgetPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TabBar settings = TabBar(
      indicatorColor: Colors.white,
      tabs: <Widget>[
        Tab(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Text(
                'Past'
            ),
          ),
        ),
        Tab(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Text(
                'Active'
            ),
          ),
        ),
        Tab(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Text(
                'Future'
            ),
          ),
        ),
      ],
    );

    return DefaultTabController(
      length: 3,
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<BudgetService> (
            create: (context) => BudgetService(),
          )
        ],
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(settings.preferredSize.height),
              child: Container(
                  color: ColorUtil.PurpleBackground,
                  child: settings)),
          body: TabBarView(
            children: <Widget>[
              PastPage(),
              ActivePage(),
              FuturePage(),
            ],
          ),
        ),
      ),
    );
  }
}
