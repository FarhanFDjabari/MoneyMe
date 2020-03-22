import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:money_me_app/screen/home.dart';
import 'package:money_me_app/utils/color_util.dart';
import 'package:flutter_svg/flutter_svg.dart';



class SliderScreen extends StatefulWidget {
  SliderScreen({Key key}) : super(key: key);

  _SliderScreenState createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  List<Slide> slides = new List();

  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        title: "Catat",
        styleTitle: TextStyle(
          color: ColorUtil.PurpleBackground,
          fontSize: 48.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'roboto',
        ),
        description:
        "Pengeluaranmu",
        styleDescription: TextStyle(
            color: Colors.black,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'roboto'),
        pathImage: "assets/undraw_typewriter_i8xd_1.png",
        backgroundColor: ColorUtil.PurpleLight,
      ),
    );
    slides.add(
      new Slide(
        title: "Rekap",
        styleTitle: TextStyle(
            color: ColorUtil.PurpleBackground,
            fontSize: 48.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'roboto'),
        description: "Hasilnya",
        styleDescription: TextStyle(
            color: Colors.black,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'roboto'),
        pathImage: "assets/undraw_process_e90d_1.png",
        backgroundColor: ColorUtil.PurpleLight,
      ),
    );
    slides.add(
      new Slide(
        title: 'Tentukan',
        styleTitle: TextStyle(
          color: ColorUtil.PurpleBackground,
          fontSize: 48.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'roboto'
        ),
        description: 'Tujuanmu',
        styleDescription: TextStyle(
            color: Colors.black,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'roboto'
        ),
        pathImage: "assets/undraw_destinations_fpv7_1.png",
        backgroundColor: ColorUtil.PurpleLight,
      ),
    );
  }

  void onDonePress() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }

  void onSkipPress() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => null),
    );
  }

  Widget renderNextBtn() {
    return Text("Continue", style: TextStyle(fontSize: 14, color: ColorUtil.PurpleBackground));
  }

  Widget renderDoneBtn() {
    return Text("Done", style: TextStyle(fontSize: 14, color: ColorUtil.PurpleBackground));
  }

  Widget renderSkipBtn() {
    return Text("Skip", style: TextStyle(fontSize: 14, color: ColorUtil.PurpleBackground));
  }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      slides: this.slides,

      // Skip button
      renderSkipBtn: this.renderSkipBtn(),
      onSkipPress: this.onSkipPress,
      colorSkipBtn: Colors.transparent,
      highlightColorSkipBtn: ColorUtil.PurpleLow,

      // Next, Done button
      onDonePress: this.onDonePress,
      renderNextBtn: this.renderNextBtn(),
      renderDoneBtn: this.renderDoneBtn(),
      colorDoneBtn: Colors.transparent,
      highlightColorDoneBtn: ColorUtil.PurpleLow,
      styleNameDoneBtn: TextStyle(fontSize: 12),
      styleNamePrevBtn: TextStyle(fontSize: 12),
      styleNameSkipBtn: TextStyle(fontSize: 12),

      // Dot indicator
      colorDot: Colors.grey,
      colorActiveDot: ColorUtil.PurpleBackground,
      sizeDot: 12.0,
    );
  }
}
