import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mathwar/color/colors.dart';
import 'package:mathwar/screens/add.dart';
import 'package:mathwar/screens/div.dart';
import 'package:mathwar/screens/homepage.dart';
import 'package:mathwar/screens/mul.dart';
import 'package:mathwar/screens/sub.dart';

class Levels extends StatelessWidget {
  String operator;
  Levels(this.operator);
  String methodtocall;

  setasset() {
    methodtocall = operator;
  }

  @override
  Widget build(BuildContext context) {
    setasset();
    if (methodtocall == "Add") {
      return AdditionLevel();
    } else if (methodtocall == "Subtract") {
      return SubtractionLevel();
    } else if (methodtocall == "Multiply") {
      return MultiplicationLevel();
    } else if (methodtocall == "Divide") {
      return DivisionLevel();
    }
  }
}

class AdditionLevel extends StatefulWidget {
  @override
  _AdditionLevelState createState() => _AdditionLevelState();
}

Widget plate(BuildContext context, String level) {
  final player = AudioCache();
  return InkWell(
    onTap: () {
      if (level == "Easy") {
        player.play('button_press.wav');
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => AdditionLevel1(),
        ));
      } else if (level == "Medium") {
        player.play('button_press.wav');
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => AdditionLevel2(),
        ));
      } else {
        player.play('button_press.wav');
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => AdditionLevel3(),
        ));
      }
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Container(
        height: 50,
        width: 100,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images1/boards_bar_bottom@4x.webp"),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Text(
            level,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28.0,
              color: Colors.white,
              fontFamily: "Grinched",
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    ),
  );
}

class _AdditionLevelState extends State<AdditionLevel> {
  Widget button(String image) {
    final player = AudioCache();
    return InkWell(
      onTap: () {
        player.play('frosting_cleared2.wav');
        return Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomePage(shown: true)));
      },
      child: Container(
        child: Column(
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    final audioplayer = AudioPlayer();
    AudioCache player = new AudioCache(fixedPlayer: audioplayer);
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: h / 20,
              ),
              Center(
                child: Row(
                  children: [
                    SizedBox(
                      width: w / 14,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: h / 45,
                        ),
                        button("images1/btn_medium_back_brown@6x.png"),
                      ],
                    ),
                    SizedBox(
                      width: w / 28,
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
                                    height: h / 38,
                                  ),
                                  Center(
                                    child: Text(
                                      "Levels",
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
                  ],
                ),
              ),
              SizedBox(
                height: h / 5,
              ),
              plate(context, "Easy"),
              SizedBox(
                height: h / 40,
              ),
              plate(context, "Medium"),
              SizedBox(
                height: h / 40,
              ),
              plate(context, "Hard"),
            ],
          ),
        ),
      ),
    );
  }
}

class SubtractionLevel extends StatefulWidget {
  @override
  _SubtractionLevelState createState() => _SubtractionLevelState();
}

Widget plate1(BuildContext context, String level) {
  final player = AudioCache();
  return InkWell(
    onTap: () {
      if (level == "Easy") {
        player.play('button_press.wav');
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => SubtractionLevel1(),
        ));
      } else if (level == "Medium") {
        player.play('button_press.wav');
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => SubtractionLevel2(),
        ));
      } else {
        player.play('button_press.wav');
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => SubtractionLevel3(),
        ));
      }
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Container(
        height: 50,
        width: 100,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images1/boards_bar_bottom@4x.webp"),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Text(
            level,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28.0,
              color: Colors.white,
              fontFamily: "Grinched",
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    ),
  );
}

class _SubtractionLevelState extends State<SubtractionLevel> {
  Widget button(String image) {
    final player = AudioCache();
    return InkWell(
      onTap: () {
        player.play('frosting_cleared2.wav');
        return Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomePage(shown: true)));
      },
      child: Container(
        child: Column(
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    final audioplayer = AudioPlayer();
    AudioCache player = new AudioCache(fixedPlayer: audioplayer);
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
              Center(
                child: Row(
                  children: [
                    SizedBox(
                      width: w / 14,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: h / 45,
                        ),
                        button("images1/btn_medium_back_brown@6x.png"),
                      ],
                    ),
                    SizedBox(
                      width: w / 28,
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
                                    height: h / 38,
                                  ),
                                  Center(
                                    child: Text(
                                      "Levels",
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
                  ],
                ),
              ),
              SizedBox(
                height: h / 5,
              ),
              plate1(context, "Easy"),
              SizedBox(
                height: h / 40,
              ),
              plate1(context, "Medium"),
              SizedBox(
                height: h / 40,
              ),
              plate1(context, "Hard"),
            ],
          ),
        ),
      ),
    );
  }
}

class DivisionLevel extends StatefulWidget {
  @override
  _DivisionLevelState createState() => _DivisionLevelState();
}

Widget plate2(BuildContext context, String level) {
  final player = AudioCache();
  return InkWell(
    onTap: () {
      if (level == "Easy") {
        player.play('button_press.wav');
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => DivisionLevel1(),
        ));
      } else if (level == "Medium") {
        player.play('button_press.wav');
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => DivisionLevel2(),
        ));
      } else {
        player.play('button_press.wav');
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => DivisionLevel3(),
        ));
      }
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Container(
        height: 50,
        width: 100,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images1/boards_bar_bottom@4x.webp"),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Text(
            level,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28.0,
              color: Colors.white,
              fontFamily: "Grinched",
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    ),
  );
}

class _DivisionLevelState extends State<DivisionLevel> {
  Widget button(String image) {
    final player = AudioCache();
    return InkWell(
      onTap: () {
        player.play('frosting_cleared2.wav');
        return Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomePage(shown: true)));
      },
      child: Container(
        child: Column(
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    final audioplayer = AudioPlayer();
    AudioCache player = new AudioCache(fixedPlayer: audioplayer);
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
              Center(
                child: Row(
                  children: [
                    SizedBox(
                      width: w / 14,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: h / 45,
                        ),
                        button("images1/btn_medium_back_brown@6x.png"),
                      ],
                    ),
                    SizedBox(
                      width: w / 28,
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
                                    height: h / 38,
                                  ),
                                  Center(
                                    child: Text(
                                      "Levels",
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
                  ],
                ),
              ),
              SizedBox(
                height: h / 5,
              ),
              plate2(context, "Easy"),
              SizedBox(
                height: h / 40,
              ),
              plate2(context, "Medium"),
              SizedBox(
                height: h / 40,
              ),
              plate2(context, "Hard"),
            ],
          ),
        ),
      ),
    );
  }
}

class MultiplicationLevel extends StatefulWidget {
  @override
  _MultiplicationLevelState createState() => _MultiplicationLevelState();
}

Widget plate3(BuildContext context, String level) {
  final player = AudioCache();
  return InkWell(
    onTap: () {
      if (level == "Easy") {
        player.play('button_press.wav');
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => MultiplicationLevel1(),
        ));
      } else if (level == "Medium") {
        player.play('button_press.wav');
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => MultiplicationLevel2(),
        ));
      } else {
        player.play('button_press.wav');
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => MultiplicationLevel3(),
        ));
      }
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Container(
        height: 50,
        width: 100,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images1/boards_bar_bottom@4x.webp"),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Text(
            level,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28.0,
              color: Colors.white,
              fontFamily: "Grinched",
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    ),
  );
}

class _MultiplicationLevelState extends State<MultiplicationLevel> {
  Widget button(String image) {
    final player = AudioCache();
    return InkWell(
      onTap: () {
        player.play('frosting_cleared2.wav');
        return Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomePage(shown: true)));
      },
      child: Container(
        child: Column(
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    final audioplayer = AudioPlayer();
    AudioCache player = new AudioCache(fixedPlayer: audioplayer);
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
              Center(
                child: Row(
                  children: [
                    SizedBox(
                      width: w / 14,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: h / 45,
                        ),
                        button("images1/btn_medium_back_brown@6x.png"),
                      ],
                    ),
                    SizedBox(
                      width: w / 28,
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
                                    height: h / 38,
                                  ),
                                  Center(
                                    child: Text(
                                      "Levels",
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
                  ],
                ),
              ),
              SizedBox(
                height: h / 5,
              ),
              plate3(context, "Easy"),
              SizedBox(
                height: h / 40,
              ),
              plate3(context, "Medium"),
              SizedBox(
                height: h / 40,
              ),
              plate3(context, "Hard"),
            ],
          ),
        ),
      ),
    );
  }
}
