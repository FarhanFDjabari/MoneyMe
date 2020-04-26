import 'package:flutter/material.dart';
import 'package:money_me_app/utils/color_util.dart';


class BackupProfile extends StatefulWidget {
  BackupProfile({Key key}) : super(key: key);

  @override
  _BackupProfileState createState() => _BackupProfileState();
}

class _BackupProfileState  extends State<BackupProfile> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtil.backgroundColor,
      body: SafeArea(
        top: true,
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(vertical: 25, horizontal: 25),
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                  size: 25,
                ),
              ),
            ),
            Center(
              child: Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width / 1.2,
                height: MediaQuery
                    .of(context)
                    .size
                    .height / 2,
                child: Column(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        InkWell(
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                      color: Color(0XFFD8D8D8), width: .5),
                                )),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.backup,
                                      color: Color(0XFFA1A1A1),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text(
                                        "Backup",
                                        style: TextStyle(
                                            color: Color(0XFFA1A1A1),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  'Last Backup on ...',
                                  style: TextStyle(
                                      color: Color(0XFFA1A1A1),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          ),
                        ),
                        InkWell(
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
                              MainAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.cloud_download,
                                      color: Color(0XFFA1A1A1),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text(
                                        "Restore",
                                        style: TextStyle(
                                            color: Color(0XFFA1A1A1),
                                            fontSize: 16,
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


}