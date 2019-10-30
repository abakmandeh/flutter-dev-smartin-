import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_developer_test/slider.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    startSplashScreen();
  }

  startSplashScreen() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) {
          // return prefix0.Slider();
          return SliderR();
        }),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          "images/splash.png",
            // width: 200.0,
            // height: 100.0,
        ),
      ),
    );
  }
}
