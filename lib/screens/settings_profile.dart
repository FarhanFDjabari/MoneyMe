import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:money_me_app/screens/backup_option.dart';
import 'package:money_me_app/screens/general_option.dart';
import 'package:money_me_app/utils/color_util.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.all(15),
          padding: EdgeInsets.all(15),
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
                          color: ColorUtil.PurpleBackground, width: 1),
                    ),
                    child: _image == null
                        ? IconButton(
                            icon: Icon(Icons.camera_alt), onPressed: getImage)
                        : CircleAvatar(
                            backgroundImage: FileImage(_image), radius: 50),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'User',
                        style: TextStyle(
                            color: ColorUtil.PurpleBackground,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Email',
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
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => GeneralProfile())),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                      border: Border(
                    top: BorderSide(color: Color(0XFFD8D8D8), width: .5),
                    bottom: BorderSide(color: Color(0XFFD8D8D8), width: .5),
                  )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BackupProfile())),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                      border: Border(
                    top: BorderSide(color: Color(0XFFD8D8D8), width: .5),
                    bottom: BorderSide(color: Color(0XFFD8D8D8), width: .5),
                  )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    top: BorderSide(color: Color(0XFFD8D8D8), width: .5),
                    bottom: BorderSide(color: Color(0XFFD8D8D8), width: .5),
                  )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.only(top: 15),
                  padding: EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: MediaQuery.of(context).size.width / 4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: ColorUtil.PurpleBackground),
                  child: Text(
                    "Log Out",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _removeAds(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Remove Ads', style: TextStyle(fontSize: 20.0)),
        content: Text('Are you sure?'),
        actions: <Widget>[
          FlatButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel',
                style: TextStyle(color: Colors.black, fontSize: 18.0)),
          ),
          FlatButton(
            onPressed: () => {
              Navigator.pop(context)
            },
            child: Container(
                margin: EdgeInsets.only(left: 5),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.transparent),
                child: Text('Remove Ads',
                    style: TextStyle(
                        color: ColorUtil.PurpleBackground, fontSize: 18.0))),
          )
        ],
      ),
    );
  }
}
