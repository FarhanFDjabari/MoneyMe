import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:money_me_app/screens/backup_option.dart';
import 'package:money_me_app/screens/general_option.dart';
import 'package:money_me_app/services/setting_service.dart';
import 'package:money_me_app/utils/color_util.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key key}) : super(key: key);


  _removeAds(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Remove Ads', style: TextStyle(fontSize: 20.0)),
        content: Text('Are you sure?'),
        actions: <Widget>[
          FlatButton(
            onPressed: () =>
              Navigator.pop(context),
            child: Text('Cancel', style: TextStyle(
            color: Colors.black,
                fontSize: 18.0)),
          ),
          FlatButton(
            onPressed: () => {},
            child: Container(
                margin: EdgeInsets.only(left: 5),
                padding: EdgeInsets.symmetric(
                    vertical: 10, horizontal: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.transparent),
                child: Text('Remove Ads', style: TextStyle(
                    color: ColorUtil.PurpleBackground,
                    fontSize: 18.0))),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final SettingService settingService = Provider.of<SettingService>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Consumer<SettingService>(
          builder: (context, setModel, _) => FutureBuilder(
            future: settingService.fetchSettings("1"),
            builder: (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.done) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.all(15),
                  padding:
                  EdgeInsets.all(15),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            height: 75,
                            width: 75,
                            margin: EdgeInsets.only(right: 15),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: Color(0XFF64CEFF), width: 3),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              AutoSizeText(
                                setModel.getSetModel.profile[0].name,
                                style: TextStyle(
                                    color: ColorUtil.PurpleBackground,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                              AutoSizeText(
                                setModel.getSetModel.profile[0].email,
                                style: TextStyle(
                                    color: ColorUtil.greyColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal),
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GeneralProfile())),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                    color: Color(0XFFD8D8D8), width: .5),
                                bottom: BorderSide(
                                    color: Color(0XFFD8D8D8), width: .5),
                              )),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Options",
                                style: TextStyle(
                                    color: Color(0XFFA1A1A1),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                              Icon(
                                Icons.chevron_right,
                                color: ColorUtil.greyColor,
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BackupProfile())),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                    color: Color(0XFFD8D8D8), width: .5),
                                bottom: BorderSide(
                                    color: Color(0XFFD8D8D8), width: .5),
                              )),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Backup to Google Drive",
                                style: TextStyle(
                                    color: Color(0XFFA1A1A1),
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal),
                              ),
                              Icon(
                                Icons.chevron_right,
                                color: ColorUtil.greyColor,
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => _removeAds(context),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                    color: Color(0XFFD8D8D8), width: .5),
                                bottom: BorderSide(
                                    color: Color(0XFFD8D8D8), width: .5),
                              )),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Remove Ads",
                                style: TextStyle(
                                    color: ColorUtil.PurpleBackground,
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal),
                              ),
                              Icon(
                                Icons.chevron_right,
                                color: ColorUtil.greyColor,
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {

                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 15),
                          padding: EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal:
                              MediaQuery.of(context).size.width / 4),
                          decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.all(Radius.circular(5)),
                              color: ColorUtil.PurpleBackground),
                          child: Text(
                            "Log Out",
                            style: TextStyle(
                                color: Colors.white, fontSize: 16),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              } else {
                return Center(
                  child: Container(
                      margin: EdgeInsets.symmetric(vertical: 50, horizontal: 50),
                      height: 50,
                      width: 50,
                      child: CircularProgressIndicator()),
                );
              }
            }
          )
        ),
      ),
    );
  }

}