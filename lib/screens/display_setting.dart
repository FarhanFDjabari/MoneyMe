import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:money_me_app/services/setting_service.dart';
import 'package:money_me_app/utils/color_util.dart';
import 'package:provider/provider.dart';

class DisplaySettings extends StatelessWidget{
  DisplaySettings({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SettingService settingService = Provider.of<SettingService>(context);
    return SafeArea(
      top: true,
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Consumer<SettingService>(
            builder: (context, setModel, _) => SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: FutureBuilder(
                future: settingService.fetchSettings("1"),
                builder: (context, snapshot) {
                  if(snapshot.connectionState == ConnectionState.done) {
                    return Container(
                      padding: EdgeInsets.all(25),
                      child: Column(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.centerLeft,
                            child: AutoSizeText(
                              'Transaction Type',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18
                              ),
                            ),
                          ),
                          Container(
                              padding: EdgeInsets.only(top: 10),
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height/3,
                              child: ListView.builder(
                                  itemCount: setModel.getSetModel.display
                                      .transactionType.length,
                                  scrollDirection: Axis.vertical,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          AutoSizeText(
                                            setModel.getSetModel.display
                                                .transactionType[index].transactionName,
                                            style: TextStyle(
                                                fontSize: 15
                                            ),
                                          ),
                                          AutoSizeText(
                                            setModel.getSetModel.display
                                                .transactionType[index].transactionId,
                                            style: TextStyle(
                                                fontSize: 15
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }
                              )
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(top: 15),
                            child: AutoSizeText(
                              'Categories',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18
                              ),
                            ),
                          ),
                          Container(
                              padding: EdgeInsets.only(top: 10),
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height/3,
                              child: ListView.builder(
                                  itemCount: setModel.getSetModel.display
                                      .categories.length,
                                  scrollDirection: Axis.vertical,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          AutoSizeText(
                                            setModel.getSetModel.display
                                                .categories[index].categoryName,
                                            style: TextStyle(
                                                fontSize: 15
                                            ),
                                          ),
                                          AutoSizeText(
                                            setModel.getSetModel.display
                                                .categories[index].categoryId,
                                            style: TextStyle(
                                                fontSize: 15
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }
                              )
                          ),
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
              ),
            ),
          ),
        ),
    );
  }


}