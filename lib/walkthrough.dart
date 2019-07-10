import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:ReturnDex/ui/welcome.dart';

class MyWalkthroughScreen extends StatefulWidget {
  @override
  MySplashScreenState createState() {
    return new MySplashScreenState();
  }
}

class MySplashScreenState extends State<MyWalkthroughScreen> {
  List<Slide> slides = new List();

  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        title: "ACTIVATE TAG",
        description:
            "If Your tag is not pre-activated then Activate your Tag First ",
        pathImage: "images/4.png",
        // backgroundColor: Color(0xff9932CC),
        backgroundColor: Color(0xff203152),
        // backgroundImage: "images/22.jpg",
      ),
    );
    slides.add(
      new Slide(
        title: "IF LOST",
        description:
            "Ah! You lost something , dont panic simply Report your Lost items .",
        pathImage: "images/6.png",
        // backgroundColor: Color(0xfff5a623),
        backgroundColor: Color(0xff203152),
        //  backgroundImage: "images/22.jpg",
      ),
    );
    slides.add(
      new Slide(
        title: "SIT BACK & RELAX",
        description:
            "No Claims required , simply pay the shipment cost and we deliver the item back to you . You can also reward the finder isn't that great.` ",
        pathImage: "images/3.png",
        backgroundColor: Color(0xff203152),
      ),
    );
  }

  void onDonePress() {
    // TODO: go to next screen
     Navigator.of(context).pushReplacementNamed('/welcome');
  }

  void onSkipPress() {
    // TODO: go to next screen
     Navigator.of(context).pushReplacementNamed('/welcome');
  }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      slides: this.slides,
      onDonePress: this.onDonePress,
      onSkipPress: this.onSkipPress,
    );
  }
}
