import 'package:flutter/material.dart';
import 'package:money_me_app/screens/setting_screen/account_setting.dart';
import 'package:money_me_app/screens/setting_screen/display_setting.dart';
import 'package:money_me_app/screens/setting_screen/settings_profile.dart';
import 'package:money_me_app/utils/color_util.dart';

class SettingScreen extends StatefulWidget {
  SettingScreen({Key key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {

  @override
  void initState() {
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
                'Account'
            ),
          ),
        ),
        Tab(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Text(
                'Display'
            ),
          ),
        ),
        Tab(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Text(
                'Profile'
            ),
          ),
        ),
      ],
    );

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(settings.preferredSize.height),
            child: Container(
                color: ColorUtil.PurpleBackground,
                child: settings)),
        body: TabBarView(
          children: <Widget>[
            AccountSetting(),
            DisplaySettings(),
            ProfileScreen(),
          ],
        ),
      ),
    );
  }
}