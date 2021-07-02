import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:mathwar/color/colors.dart';
import 'package:mathwar/screens/add.dart';
import 'package:mathwar/screens/div.dart';
import 'package:mathwar/screens/homepage.dart';
import 'package:mathwar/screens/levels.dart';
import 'package:mathwar/screens/mul.dart';
import 'package:mathwar/screens/sub.dart';

class resultpage extends StatefulWidget {
  int marks;
  String route;
  resultpage({Key key, @required this.marks, @required this.route})
      : super(key: key);
  @override
  _resultpageState createState() => _resultpageState(marks, route);
}

class _resultpageState extends State<resultpage> {
  List<String> images = [
    "images1/btn_medium_trophy_brown@6x.png",
    "images1/btn_medium_happy_brown@6x.png",
    "images1/btn_medium_sad_brown@6x.png",
  ];

  String message;
  String image;

  @override
  void initState() {
    if (marks < 40) {
      image = images[2];
      message = "Score: $marks";
    } else if (marks < 80) {
      image = images[1];
      message = "Score: $marks";
    } else {
      image = images[0];
      message = "Score: $marks";
    }
    super.initState();
  }

  int marks;
  String route;
  _resultpageState(this.marks, this.route);
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    final audioplayer = AudioPlayer();
    AudioCache player = new AudioCache(fixedPlayer: audioplayer);
    return WillPopScope(
      onWillPop: () {
        player.play('frosting_cleared2.wav');
        return Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => HomePage(shown: true),
        ));
      },
      child: Scaffold(
        backgroundColor: brown1,
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images1/window_panel_setting@6x.webp'),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: h / 20,
              ),
              Container(
                height: h / 10,
                width: w / 2,
                decoration: BoxDecoration(
                  // color: Colors.green,
                  image: DecorationImage(
                    image: AssetImage('images1/boards_bar_top@6x.webp'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          children: [
                            SizedBox(
                              height: h / 28,
                            ),
                            Center(
                              child: Text(
                                "Results",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: h / 25,
                                  color: Colors.white,
                                  fontFamily: "Grinched",
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: h / 17,
              ),
              Container(
                height: h / 3.33,
                width: h / 3.33,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                height: h / 13,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 13.0),
                child: Container(
                  height: h / 11.42,
                  width: h / 2.66,
                  decoration: BoxDecoration(
                    // color: Colors.green,
                    image: DecorationImage(
                      image: AssetImage('images1/window_title_leaves@6x.webp'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            width: h / 40,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: h / 65,
                              ),
                              Center(
                                child: Text(
                                  message,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: h / 20,
                                    color: Colors.white,
                                    fontFamily: "Grinched",
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: h / 13,
              ),
              Row(
                children: [
                  SizedBox(
                    width: w / 12,
                  ),
                  InkWell(
                    onTap: () {
                      player.play('button_press.wav');
                      if (route == 'AddL1') {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => AdditionLevel1()));
                      } else if (route == 'AddL2') {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => AdditionLevel2()));
                      } else if (route == 'AddL3') {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => AdditionLevel3()));
                      } else if (route == 'SubL1') {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => SubtractionLevel1()));
                      } else if (route == 'SubL2') {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => SubtractionLevel2()));
                      } else if (route == 'SubL3') {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => SubtractionLevel3()));
                      } else if (route == 'DivL1') {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => DivisionLevel1()));
                      } else if (route == 'DivL2') {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => DivisionLevel2()));
                      } else if (route == 'DivL3') {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => DivisionLevel3()));
                      } else if (route == 'MulL1') {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => MultiplicationLevel1()));
                      } else if (route == 'MulL2') {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => MultiplicationLevel2()));
                      } else if (route == 'MulL3') {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => MultiplicationLevel3()));
                      }
                    },
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: h / 10,
                            width: w / 2.5,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    'images1/boards_small_green@6x.webp'),
                                fit: BoxFit.fill,
                              ),
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: w / 8,
                                ),
                                Column(
                                  children: [
                                    SizedBox(
                                      height: h / 70,
                                    ),
                                    Center(
                                      child: Text(
                                        "Play\nAgain",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: h / 40,
                                          color: Colors.white,
                                          fontFamily: "Chicken",
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: w / 30,
                  ),
                  InkWell(
                    onTap: () {
                      player.play('frosting_cleared2.wav');
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => HomePage(shown: true)));
                    },
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: h / 10,
                            width: w / 2.5,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    'images1/boards_small_grey@6x.webp'),
                                fit: BoxFit.fill,
                              ),
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: w / 8,
                                ),
                                Column(
                                  children: [
                                    SizedBox(
                                      height: h / 40,
                                    ),
                                    Center(
                                      child: Text(
                                        "Home",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: h / 40,
                                          color: Colors.white,
                                          fontFamily: "Chicken",
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
