import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter_developer_test/ui/formRegistrasi.dart';

class SliderR extends StatefulWidget {
  _SliderRState createState() => new _SliderRState();
}

class _SliderRState extends State<SliderR>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    animation = new Tween(begin: 0.0, end: 18.0).animate(controller)
      ..addListener(() {
        setState(() {
          // the state that has changed here is the animation object’s value
        });
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    Widget carousel = new Carousel(
      boxFit: BoxFit.fitWidth,
      images: [
        new AssetImage('images/easy.PNG'),
        new AssetImage('images/looking.PNG'),
        // new AssetImage('assets/images/3.jpg'),
        // new AssetImage('assets/images/4.jpg'),
      ],
      animationCurve: Curves.fastOutSlowIn,
      animationDuration: Duration(seconds: 1),
    );

    Widget button = new Container(
        alignment: Alignment.bottomCenter,
        child: ButtonTheme(
          minWidth: 350.0,
          height: 55.0,
          child: RaisedButton(
            child: Text(
              'Register',
              style: TextStyle(fontSize: 20),
            ),
            textColor: Colors.white,
            onPressed: () {
              //Use`Navigator` widget to push the second screen to out stack of screens
              Navigator.of(context).push(
                  MaterialPageRoute<Null>(builder: (BuildContext context) {
                return new FormRegistrasi();
              }));
            },
            color: Colors.teal[600],
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          ),
        ));

    return new Scaffold(
      // backgroundColor: Colors.black,
      backgroundColor: Colors.white,
      body: new Container(
        padding: const EdgeInsets.all(25.0),
        // height: screenHeight / 2,
        height: screenHeight / 1.2,
        child: new ClipRRect(
          borderRadius: BorderRadius.circular(0.0),
          child: new Stack(
            children: [
              carousel,
              // banner,
              button,
            ],
          ),
        ),
      ),
    );
  }

  dispose() {
    controller.dispose();
    super.dispose();
  }
}
