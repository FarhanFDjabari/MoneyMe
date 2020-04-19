import 'package:flutter/material.dart';

import 'package:money_me_app/utils/color_util.dart';

import 'package:money_me_app/utils/screen_util.dart';

class GeneralProfile extends StatefulWidget {
  GeneralProfile({Key key}) : super(key: key);

  @override
  _GeneralProfileState createState() => _GeneralProfileState();
}

class Language {
  int id;

  String language;

  Language(this.id, this.language);

  static List<Language> getLanguages() {
    return <Language>[Language(1, 'English'), Language(2, 'Indonesia')];
  }
}

class Currency {
  int id;

  String currency;

  Currency(this.id, this.currency);

  static List<Currency> getCurrencies() {
    return <Currency>[Currency(1, 'USD'), Currency(2, 'IDR')];
  }
}

class Theme {
  int id;

  Color color;

  String theme;

  Theme(this.id, this.theme, this.color);

  static List<Theme> getThemes() {
    return <Theme>[
      Theme(1, 'Dark', ColorUtil.PurpleBackground),
      Theme(2, 'Light', ColorUtil.PurpleLight)
    ];
  }
}

class _GeneralProfileState extends State<GeneralProfile> {
  List<Language> _languages = Language.getLanguages();

  List<DropdownMenuItem<Language>> _dropdownMenuItems;

  Language _selectedLanguage;

  List<Currency> _currencies = Currency.getCurrencies();

  List<DropdownMenuItem<Currency>> _dropdownCurrency;

  Currency _selectedCurrency;

  List<Theme> _themes = Theme.getThemes();

  List<DropdownMenuItem<Theme>> _dropdownTheme;

  Theme _selectedTheme;

  @override
  void initState() {
    _dropdownMenuItems = buildDropdownMenuItems(_languages);

    _selectedLanguage = _dropdownMenuItems[0].value;

    _dropdownCurrency = buildDropdownCurrency(_currencies);

    _selectedCurrency = _dropdownCurrency[0].value;

    _dropdownTheme = buildDropdownTheme(_themes);

    _selectedTheme = _dropdownTheme[0].value;

    super.initState();
  }

  List<DropdownMenuItem<Language>> buildDropdownMenuItems(List languages) {
    List<DropdownMenuItem<Language>> items = List();

    for (Language language in languages) {
      items.add(
        DropdownMenuItem(
          value: language,
          child: Text(language.language),
        ),
      );
    }

    return items;
  }

  onChangeDropdown(Language selectedLanguage) {
    setState(() {
      _selectedLanguage = selectedLanguage;
    });
  }

  List<DropdownMenuItem<Currency>> buildDropdownCurrency(List Currencies) {
    List<DropdownMenuItem<Currency>> items = List();

    for (Currency currency in Currencies) {
      items.add(
        DropdownMenuItem(
          value: currency,
          child: Text(currency.currency),
        ),
      );
    }

    return items;
  }

  onChangeCurrency(Currency selectedCurrency) {
    setState(() {
      _selectedCurrency = selectedCurrency;
    });
  }

  List<DropdownMenuItem<Theme>> buildDropdownTheme(List Themes) {
    List<DropdownMenuItem<Theme>> items = List();

    for (Theme theme in Themes) {
      items.add(
        DropdownMenuItem(
          value: theme,
          child: Text(theme.theme),
        ),
      );
    }

    return items;
  }

  onChangeTheme(Theme selectedTheme) {
    setState(() {
      _selectedTheme = selectedTheme;
    });
  }

  bool cent = false;

  onSwitch(bool value) {
    setState(() {
      cent = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtil.backgroundColor,
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            width: ScreenUtil.screenWidthDp,
            height: ScreenUtil.screenHeightDp,
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
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Container(
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
                                  Text(
                                    "Language",
                                    style: TextStyle(
                                        color: Color(0XFFA1A1A1),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  DropdownButton(
                                    value: _selectedLanguage,
                                    items: _dropdownMenuItems,
                                    onChanged: onChangeDropdown,
                                  )
                                ],
                              ),
                            ),
                            Container(
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
                                    "Currency",
                                    style: TextStyle(
                                        color: Color(0XFFA1A1A1),
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  DropdownButton(
                                    value: _selectedCurrency,
                                    items: _dropdownCurrency,
                                    onChanged: onChangeCurrency,
                                  )
                                ],
                              ),
                            ),
                            Container(
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
                                    "Cent",
                                    style: TextStyle(
                                        color: Color(0XFFA1A1A1),
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  Switch(
                                    value: cent,
                                    onChanged: (val) {
                                      onSwitch(val);
                                    },
                                    activeColor: ColorUtil.PurpleBackground,
                                  )
                                ],
                              ),
                            ),
                            Container(
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
                                    "Theme",
                                    style: TextStyle(
                                        color: Color(0XFFA1A1A1),
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  DropdownButton(
                                    value: _selectedTheme,
                                    items: _dropdownTheme,
                                    onChanged: onChangeTheme,
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              alignment: Alignment.centerRight,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  InkWell(
                                      focusColor: Colors.grey.withOpacity(0.1),
                                      splashColor: Colors.grey.withOpacity(0.2),
                                      highlightColor: Colors.transparent,
                                      child: Container(
                                        margin: EdgeInsets.only(right: 5),
                                        padding: EdgeInsets.symmetric(
                                            vertical: 12, horizontal: 50),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Text(
                                          "Batal",
                                          style: TextStyle(
                                              color: ColorUtil.PurpleBackground,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      onTap: () => Navigator.pop(context)),
                                  InkWell(
                                    focusColor: Colors.transparent,
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    child: Container(
                                        margin: EdgeInsets.only(left: 5),
                                        padding: EdgeInsets.symmetric(
                                            vertical: 12, horizontal: 50),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: ColorUtil.PurpleBackground),
                                        child: Text(
                                          "Simpan",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500),
                                          textAlign: TextAlign.center,
                                        )),
                                    onTap: () {},
                                  ),
                                ],
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
          ),
        ),
      ),
    );
  }
}
