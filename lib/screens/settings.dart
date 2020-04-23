import 'package:flutter/material.dart';
import 'package:money_me_app/screens/account_setting.dart';
import 'package:money_me_app/screens/display_setting.dart';
import 'package:money_me_app/screens/settings_profile.dart';
import 'package:money_me_app/services/setting_service.dart';
import 'package:money_me_app/utils/color_util.dart';
import 'package:provider/provider.dart';

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
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<SettingService> (
            create: (context) => SettingService(),
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
              AccountSetting(),
              DisplaySettings(),
              ProfileScreen(),
            ],
          ),
        ),
      ),
    );
  }
}