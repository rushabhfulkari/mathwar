import 'dart:async';
import 'dart:math';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mathwar/color/colors.dart';
import 'package:mathwar/screens/homepage.dart';
import 'package:mathwar/screens/levels.dart';
import 'package:mathwar/screens/resultpage.dart';

class MultiplicationLevel1 extends StatefulWidget {
  @override
  _MultiplicationLevel1State createState() => _MultiplicationLevel1State();
}

class _MultiplicationLevel1State extends State<MultiplicationLevel1> {
  final audioplayer = AudioPlayer();
  // AudioCache player = new AudioCache(fixedPlayer: audioplayer);

  Random random = new Random();
  String earlier;
  int randomnumber;
  String colortoshow = "images1/boards_large_brown@6x.webp";
  String right = "images1/boards_small_green@6x.webp";
  String wrong = "images1/boards_small_grey@6x.webp";
  int marks = 0;
  bool run = true;
  bool isPlaying;
  bool timeplus;
  bool back;
  bool run1 = true;
  int timer = 20;
  String showtimer = "20";
  bool canceltimer = false;

  Map<String, String> boardimage = {
    "a": "images1/boards_large_brown@6x.webp",
    "b": "images1/boards_large_brown@6x.webp",
  };

  List<String> chotebuttonimages = [
    "images1/btn_medium_back_brown@6x.png",
    "images1/btn_medium_nosound_brown@6x.png",
  ];

  void initState() {
    AudioCache player = new AudioCache(fixedPlayer: audioplayer);
    isPlaying = true;
    player.loop('preview.mp3');
    starttimer();
    super.initState();
  }

  void starttimer() async {
    AudioCache player = new AudioCache(fixedPlayer: audioplayer);
    const onesec = Duration(seconds: 1);
    Timer.periodic(onesec, (Timer t) {
      setState(() {
        run1 = false;
        run = false;
        if (timer < 1) {
          player.play('level_update1.wav');
          t.cancel();
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => resultpage(
              marks: marks,
              route: "MulL1",
            ),
          ));
        } else if (timeplus == true) {
          timer = timer + 2;
          timeplus = null;
        } else if (timeplus == false) {
          timer = timer - 2;
          timeplus = null;
        } else if (back == true) {
          t.cancel();
          back = null;
        } else {
          timer = timer - 1; // sahi wala
          // timer = timer; // till I make the page
        }
        showtimer = timer.toString();
      });
    });
  }

  void nextpage() {
    setState(() {
      run = true;
      boardimage['a'] = "images1/boards_large_brown@6x.webp";
      boardimage['b'] = "images1/boards_large_brown@6x.webp";
    });
  }

  Future<bool> dialogue() {
    final player = AudioCache();
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    showDialog(
        context: context,
        builder: (context) => Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                  height: h / 4,
                  width: w / 4,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images1/boards_large_brown@6x.webp'),
                      fit: BoxFit.contain,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              width: w / 8,
                            ),
                            Center(
                              child: Text(
                                "Return to Home?",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: h / 35,
                                  decoration: TextDecoration.none,
                                  color: Colors.white,
                                  fontFamily: "Chicken",
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: h / 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            width: w / 3.7,
                          ),
                          Container(
                            height: h / 16,
                            width: w / 5,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    'images1/boards_small_green@6x.webp'),
                                fit: BoxFit.fill,
                              ),
                            ),
                            child: Column(
                              children: [
                                SizedBox(height: h / 110),
                                GestureDetector(
                                  onTap: () {
                                    player.play('button_press.wav');
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    "NO",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: h / 35,
                                      decoration: TextDecoration.none,
                                      color: Colors.white,
                                      fontFamily: "Chicken",
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: w / 40,
                          ),
                          Container(
                            height: h / 16,
                            width: w / 5,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    'images1/boards_small_grey@6x.webp'),
                                fit: BoxFit.fill,
                              ),
                            ),
                            child: Column(
                              children: [
                                SizedBox(height: h / 110),
                                GestureDetector(
                                  onTap: () {
                                    player.play('frosting_cleared2.wav');
                                    audioplayer.stop();
                                    back = true;
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                HomePage(shown: true)));
                                  },
                                  child: Text(
                                    "YES",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: h / 35,
                                      decoration: TextDecoration.none,
                                      color: Colors.white,
                                      fontFamily: "Chicken",
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
            ));
  }

  Widget button(String image) {
    AudioCache player = new AudioCache(fixedPlayer: audioplayer);
    return InkWell(
      onTap: () {
        if (image == "images1/btn_medium_back_brown@6x.png") {
          if (isPlaying == false) {
            player.play('frosting_cleared2.wav');
          }
          dialogue();
        } else if (image == "images1/btn_medium_nosound_brown@6x.png" ||
            image == "images1/btn_medium_sound_brown@6x.png") {
          if (isPlaying == true) {
            audioplayer.pause();
            isPlaying = false;
            run1 = false;
            run = false;
            setState(() {
              if (image == "images1/btn_medium_nosound_brown@6x.png") {
                chotebuttonimages[1] = "images1/btn_medium_sound_brown@6x.png";
              } else if (image == "images1/btn_medium_sound_brown@6x.png") {
                chotebuttonimages[1] =
                    "images1/btn_medium_nosound_brown@6x.png";
              }
            });
          } else if (isPlaying == false) {
            player.loop('preview.mp3');
            isPlaying = true;
            run1 = false;
            run = false;
            setState(() {
              if (image == "images1/btn_medium_nosound_brown@6x.png") {
                chotebuttonimages[1] = "images1/btn_medium_sound_brown@6x.png";
              } else if (image == "images1/btn_medium_sound_brown@6x.png") {
                chotebuttonimages[1] =
                    "images1/btn_medium_nosound_brown@6x.png";
              }
            });
          }
        }
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
    AudioCache player = new AudioCache(fixedPlayer: audioplayer);
    int randomNumber1 = random.nextInt(20);
    int randomNumber2 = random.nextInt(20);
    int mul = randomNumber1 * randomNumber2;
    int randomNumber3 = random.nextInt(2);
    int randomNumber4 = random.nextInt(10) + 1;

    run1 ? randomnumber = randomNumber3 : null;
    run1
        ? randomNumber3 == 1
            ? earlier = "$randomNumber1 * $randomNumber2 = $mul"
            : earlier =
                "$randomNumber1 * $randomNumber2 = ${(mul - randomNumber4).abs()}"
        : null;

    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);

    return WillPopScope(
      onWillPop: () {
        if (isPlaying == false) {
          player.play('frosting_cleared2.wav');
        }
        return dialogue();
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
                                "Multiplication",
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
                height: h / 32,
              ),
              Row(
                children: [
                  SizedBox(
                    width: w / 13,
                  ),
                  Container(
                    height: h / 10,
                    width: w / 2,
                    decoration: BoxDecoration(
                      // color: Colors.green,
                      image: DecorationImage(
                        image: AssetImage('images1/boards_small_green@6x.webp'),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              height: h / 10,
                            ),
                            Center(
                              child: Text(
                                "Score: $marks",
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
                  ),
                  SizedBox(
                    width: w / 15,
                  ),
                  Container(
                    height: h / 8,
                    width: w / 4,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            "images1/btn_medium_nothing_brown@6x.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: h / 40,
                        ),
                        Center(
                          child: Text(
                            showtimer,
                            style: TextStyle(
                              fontSize: h / 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Chicken',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: h / 13,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Container(
                  height: h / 11,
                  width: w / 1.2,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images1/window_title_leaves@6x.webp'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: run1
                      ? run
                          ? randomNumber3 == 1
                              ? Text(
                                  "$randomNumber1 * $randomNumber2 = $mul",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: h / 25,
                                      fontFamily: "Chicken",
                                      color: Colors.white),
                                )
                              : Text(
                                  "$randomNumber1 * $randomNumber2 = ${(mul - randomNumber4).abs()}",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: h / 25,
                                    color: Colors.white,
                                    fontFamily: "Chicken",
                                  ),
                                )
                          : null
                      : Text(
                          earlier,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: h / 25,
                            fontFamily: "Chicken",
                            color: Colors.white,
                          ),
                        ),
                ),
              ),
              SizedBox(
                height: h / 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: w / 12,
                  ),
                  InkWell(
                    onTap: () {
                      run = false;
                      run1 = true;
                      if (randomnumber == 1) {
                        if (isPlaying == false) {
                          player.play('button_press.wav');
                        }
                        marks = marks + 10;
                        timeplus = true;
                        colortoshow = right;
                      } else {
                        if (isPlaying == false) {
                          player.play('frosting_cleared2.wav');
                        }
                        colortoshow = wrong;
                        timeplus = false;
                        marks = marks - 10;
                      }
                      setState(() {
                        boardimage['a'] = colortoshow;
                      });
                      Timer(Duration(milliseconds: 150), nextpage);
                    },
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: h / 11,
                            width: w / 2.5,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(boardimage['a']),
                                fit: BoxFit.fill,
                              ),
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 15,
                                ),
                                Icon(
                                  Icons.check_circle,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                Center(
                                  child: Text(
                                    "Right",
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
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: w / 27,
                  ),
                  InkWell(
                    onTap: () {
                      run = false;
                      run1 = true;
                      if (randomnumber == 0) {
                        if (isPlaying == false) {
                          player.play('button_press.wav');
                        }
                        marks = marks + 10;
                        timeplus = true;
                        colortoshow = right;
                      } else {
                        if (isPlaying == false) {
                          player.play('frosting_cleared2.wav');
                        }
                        colortoshow = wrong;
                        timeplus = false;
                        marks = marks - 10;
                      }
                      setState(() {
                        boardimage['b'] = colortoshow;
                      });
                      Timer(Duration(milliseconds: 150), nextpage);
                    },
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: h / 11,
                            width: w / 2.5,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(boardimage['b']),
                                fit: BoxFit.fill,
                              ),
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 15,
                                ),
                                Icon(
                                  Icons.remove_circle,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                Center(
                                  child: Text(
                                    "Wrong",
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
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: h / 14,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  button(chotebuttonimages[0]),
                  SizedBox(
                    width: w / 3,
                  ),
                  button(chotebuttonimages[1]),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MultiplicationLevel2 extends StatefulWidget {
  @override
  _MultiplicationLevel2State createState() => _MultiplicationLevel2State();
}

class _MultiplicationLevel2State extends State<MultiplicationLevel2> {
  final audioplayer = AudioPlayer();
  // AudioCache player = new AudioCache(fixedPlayer: audioplayer);

  Random random = new Random();
  String earlier;
  int randomnumber;
  String colortoshow = "images1/boards_large_brown@6x.webp";
  String right = "images1/boards_small_green@6x.webp";
  String wrong = "images1/boards_small_grey@6x.webp";
  int marks = 0;
  bool run = true;
  bool isPlaying;
  bool timeplus;
  bool back;
  bool run1 = true;
  int timer = 20;
  String showtimer = "20";
  bool canceltimer = false;

  Map<String, String> boardimage = {
    "a": "images1/boards_large_brown@6x.webp",
    "b": "images1/boards_large_brown@6x.webp",
  };

  List<String> chotebuttonimages = [
    "images1/btn_medium_back_brown@6x.png",
    "images1/btn_medium_nosound_brown@6x.png",
  ];

  void initState() {
    AudioCache player = new AudioCache(fixedPlayer: audioplayer);
    isPlaying = true;
    player.loop('preview.mp3');
    starttimer();
    super.initState();
  }

  Future<bool> dialogue() {
    final player = AudioCache();
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    showDialog(
        context: context,
        builder: (context) => Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                  height: h / 4,
                  width: w / 4,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images1/boards_large_brown@6x.webp'),
                      fit: BoxFit.contain,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              width: w / 8,
                            ),
                            Center(
                              child: Text(
                                "Return to Home?",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: h / 35,
                                  decoration: TextDecoration.none,
                                  color: Colors.white,
                                  fontFamily: "Chicken",
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: h / 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            width: w / 3.7,
                          ),
                          Container(
                            height: h / 16,
                            width: w / 5,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    'images1/boards_small_green@6x.webp'),
                                fit: BoxFit.fill,
                              ),
                            ),
                            child: Column(
                              children: [
                                SizedBox(height: h / 110),
                                GestureDetector(
                                  onTap: () {
                                    player.play('button_press.wav');
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    "NO",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: h / 35,
                                      decoration: TextDecoration.none,
                                      color: Colors.white,
                                      fontFamily: "Chicken",
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: w / 40,
                          ),
                          Container(
                            height: h / 16,
                            width: w / 5,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    'images1/boards_small_grey@6x.webp'),
                                fit: BoxFit.fill,
                              ),
                            ),
                            child: Column(
                              children: [
                                SizedBox(height: h / 110),
                                GestureDetector(
                                  onTap: () {
                                    player.play('frosting_cleared2.wav');
                                    audioplayer.stop();
                                    back = true;
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                HomePage(shown: true)));
                                  },
                                  child: Text(
                                    "YES",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: h / 35,
                                      decoration: TextDecoration.none,
                                      color: Colors.white,
                                      fontFamily: "Chicken",
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
            ));
  }

  void starttimer() async {
    AudioCache player = new AudioCache(fixedPlayer: audioplayer);
    const onesec = Duration(seconds: 1);
    Timer.periodic(onesec, (Timer t) {
      setState(() {
        run1 = false;
        run = false;
        if (timer < 1) {
          player.play('level_update1.wav');
          t.cancel();
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => resultpage(
              marks: marks,
              route: "MulL2",
            ),
          ));
        } else if (timeplus == true) {
          timer = timer + 2;
          timeplus = null;
        } else if (timeplus == false) {
          timer = timer - 2;
          timeplus = null;
        } else if (back == true) {
          t.cancel();
          back = null;
        } else {
          timer = timer - 1; // sahi wala
          // timer = timer; // till I make the page
        }
        showtimer = timer.toString();
      });
    });
  }

  void nextpage() {
    setState(() {
      run = true;
      boardimage['a'] = "images1/boards_large_brown@6x.webp";
      boardimage['b'] = "images1/boards_large_brown@6x.webp";
    });
  }

  Widget button(String image) {
    AudioCache player = new AudioCache(fixedPlayer: audioplayer);
    return InkWell(
      onTap: () {
        if (image == "images1/btn_medium_back_brown@6x.png") {
          if (isPlaying == false) {
            player.play('frosting_cleared2.wav');
          }
          dialogue();
        } else if (image == "images1/btn_medium_nosound_brown@6x.png" ||
            image == "images1/btn_medium_sound_brown@6x.png") {
          if (isPlaying == true) {
            audioplayer.pause();
            isPlaying = false;
            run1 = false;
            run = false;
            setState(() {
              if (image == "images1/btn_medium_nosound_brown@6x.png") {
                chotebuttonimages[1] = "images1/btn_medium_sound_brown@6x.png";
              } else if (image == "images1/btn_medium_sound_brown@6x.png") {
                chotebuttonimages[1] =
                    "images1/btn_medium_nosound_brown@6x.png";
              }
            });
          } else if (isPlaying == false) {
            player.loop('preview.mp3');
            isPlaying = true;
            run1 = false;
            run = false;
            setState(() {
              if (image == "images1/btn_medium_nosound_brown@6x.png") {
                chotebuttonimages[1] = "images1/btn_medium_sound_brown@6x.png";
              } else if (image == "images1/btn_medium_sound_brown@6x.png") {
                chotebuttonimages[1] =
                    "images1/btn_medium_nosound_brown@6x.png";
              }
            });
          }
        }
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
    AudioCache player = new AudioCache(fixedPlayer: audioplayer);
    int randomNumber1 = random.nextInt(50);
    int randomNumber2 = random.nextInt(50);
    int mul = randomNumber1 * randomNumber2;
    int randomNumber3 = random.nextInt(2);
    int randomNumber4 = random.nextInt(20) + 1;

    run1 ? randomnumber = randomNumber3 : null;
    run1
        ? randomNumber3 == 1
            ? earlier = "$randomNumber1 * $randomNumber2 = $mul"
            : earlier =
                "$randomNumber1 * $randomNumber2 = ${(mul - randomNumber4).abs()}"
        : null;

    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);

    return WillPopScope(
      onWillPop: () {
        if (isPlaying == false) {
          player.play('frosting_cleared2.wav');
        }
        return dialogue();
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
                                "Multiplication",
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
                height: h / 32,
              ),
              Row(
                children: [
                  SizedBox(
                    width: w / 13,
                  ),
                  Container(
                    height: h / 10,
                    width: w / 2,
                    decoration: BoxDecoration(
                      // color: Colors.green,
                      image: DecorationImage(
                        image: AssetImage('images1/boards_small_green@6x.webp'),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              height: h / 10,
                            ),
                            Center(
                              child: Text(
                                "Score: $marks",
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
                  ),
                  SizedBox(
                    width: w / 15,
                  ),
                  Container(
                    height: h / 8,
                    width: w / 4,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            "images1/btn_medium_nothing_brown@6x.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: h / 40,
                        ),
                        Center(
                          child: Text(
                            showtimer,
                            style: TextStyle(
                              fontSize: h / 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Chicken',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: h / 13,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Container(
                  height: h / 11,
                  width: w / 1.2,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images1/window_title_leaves@6x.webp'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: run1
                      ? run
                          ? randomNumber3 == 1
                              ? Text(
                                  "$randomNumber1 * $randomNumber2 = $mul",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: h / 25,
                                      fontFamily: "Chicken",
                                      color: Colors.white),
                                )
                              : Text(
                                  "$randomNumber1 * $randomNumber2 = ${(mul - randomNumber4).abs()}",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: h / 25,
                                    color: Colors.white,
                                    fontFamily: "Chicken",
                                  ),
                                )
                          : null
                      : Text(
                          earlier,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: h / 25,
                            fontFamily: "Chicken",
                            color: Colors.white,
                          ),
                        ),
                ),
              ),
              SizedBox(
                height: h / 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: w / 12,
                  ),
                  InkWell(
                    onTap: () {
                      run = false;
                      run1 = true;
                      if (randomnumber == 1) {
                        if (isPlaying == false) {
                          player.play('button_press.wav');
                        }
                        marks = marks + 10;
                        timeplus = true;
                        colortoshow = right;
                      } else {
                        if (isPlaying == false) {
                          player.play('frosting_cleared2.wav');
                        }
                        colortoshow = wrong;
                        timeplus = false;
                        marks = marks - 10;
                      }
                      setState(() {
                        boardimage['a'] = colortoshow;
                      });
                      Timer(Duration(milliseconds: 150), nextpage);
                    },
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: h / 11,
                            width: w / 2.5,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(boardimage['a']),
                                fit: BoxFit.fill,
                              ),
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 15,
                                ),
                                Icon(
                                  Icons.check_circle,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                Center(
                                  child: Text(
                                    "Right",
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
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: w / 27,
                  ),
                  InkWell(
                    onTap: () {
                      run = false;
                      run1 = true;
                      if (randomnumber == 0) {
                        if (isPlaying == false) {
                          player.play('button_press.wav');
                        }
                        marks = marks + 10;
                        timeplus = true;
                        colortoshow = right;
                      } else {
                        if (isPlaying == false) {
                          player.play('frosting_cleared2.wav');
                        }
                        colortoshow = wrong;
                        timeplus = false;
                        marks = marks - 10;
                      }
                      setState(() {
                        boardimage['b'] = colortoshow;
                      });
                      Timer(Duration(milliseconds: 150), nextpage);
                    },
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: h / 11,
                            width: w / 2.5,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(boardimage['b']),
                                fit: BoxFit.fill,
                              ),
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 15,
                                ),
                                Icon(
                                  Icons.remove_circle,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                Center(
                                  child: Text(
                                    "Wrong",
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
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: h / 14,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  button(chotebuttonimages[0]),
                  SizedBox(
                    width: w / 3,
                  ),
                  button(chotebuttonimages[1]),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MultiplicationLevel3 extends StatefulWidget {
  @override
  _MultiplicationLevel3State createState() => _MultiplicationLevel3State();
}

class _MultiplicationLevel3State extends State<MultiplicationLevel3> {
  final audioplayer = AudioPlayer();
  // AudioCache player = new AudioCache(fixedPlayer: audioplayer);

  Random random = new Random();
  String earlier;
  int randomnumber;
  String colortoshow = "images1/boards_large_brown@6x.webp";
  String right = "images1/boards_small_green@6x.webp";
  String wrong = "images1/boards_small_grey@6x.webp";
  int marks = 0;
  bool run = true;
  bool isPlaying;
  bool timeplus;
  bool back;
  bool run1 = true;
  int timer = 20;
  String showtimer = "20";
  bool canceltimer = false;

  Map<String, String> boardimage = {
    "a": "images1/boards_large_brown@6x.webp",
    "b": "images1/boards_large_brown@6x.webp",
  };

  List<String> chotebuttonimages = [
    "images1/btn_medium_back_brown@6x.png",
    "images1/btn_medium_nosound_brown@6x.png",
  ];

  void initState() {
    AudioCache player = new AudioCache(fixedPlayer: audioplayer);
    isPlaying = true;
    player.loop('preview.mp3');
    starttimer();
    super.initState();
  }

  Future<bool> dialogue() {
    final player = AudioCache();
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    showDialog(
        context: context,
        builder: (context) => Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                  height: h / 4,
                  width: w / 4,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images1/boards_large_brown@6x.webp'),
                      fit: BoxFit.contain,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              width: w / 8,
                            ),
                            Center(
                              child: Text(
                                "Return to Home?",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: h / 35,
                                  decoration: TextDecoration.none,
                                  color: Colors.white,
                                  fontFamily: "Chicken",
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: h / 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            width: w / 3.7,
                          ),
                          Container(
                            height: h / 16,
                            width: w / 5,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    'images1/boards_small_green@6x.webp'),
                                fit: BoxFit.fill,
                              ),
                            ),
                            child: Column(
                              children: [
                                SizedBox(height: h / 110),
                                GestureDetector(
                                  onTap: () {
                                    player.play('button_press.wav');
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    "NO",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: h / 35,
                                      decoration: TextDecoration.none,
                                      color: Colors.white,
                                      fontFamily: "Chicken",
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: w / 40,
                          ),
                          Container(
                            height: h / 16,
                            width: w / 5,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    'images1/boards_small_grey@6x.webp'),
                                fit: BoxFit.fill,
                              ),
                            ),
                            child: Column(
                              children: [
                                SizedBox(height: h / 110),
                                GestureDetector(
                                  onTap: () {
                                    player.play('frosting_cleared2.wav');
                                    audioplayer.stop();
                                    back = true;
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                HomePage(shown: true)));
                                  },
                                  child: Text(
                                    "YES",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: h / 35,
                                      decoration: TextDecoration.none,
                                      color: Colors.white,
                                      fontFamily: "Chicken",
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
            ));
  }

  void starttimer() async {
    AudioCache player = new AudioCache(fixedPlayer: audioplayer);
    const onesec = Duration(seconds: 1);
    Timer.periodic(onesec, (Timer t) {
      setState(() {
        run1 = false;
        run = false;
        if (timer < 1) {
          player.play('level_update1.wav');
          t.cancel();
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => resultpage(
              marks: marks,
              route: "MulL3",
            ),
          ));
        } else if (timeplus == true) {
          timer = timer + 2;
          timeplus = null;
        } else if (timeplus == false) {
          timer = timer - 2;
          timeplus = null;
        } else if (back == true) {
          t.cancel();
          back = null;
        } else {
          timer = timer - 1; // sahi wala
          // timer = timer; // till I make the page
        }
        showtimer = timer.toString();
      });
    });
  }

  void nextpage() {
    setState(() {
      run = true;
      boardimage['a'] = "images1/boards_large_brown@6x.webp";
      boardimage['b'] = "images1/boards_large_brown@6x.webp";
    });
  }

  Widget button(String image) {
    AudioCache player = new AudioCache(fixedPlayer: audioplayer);
    return InkWell(
      onTap: () {
        if (image == "images1/btn_medium_back_brown@6x.png") {
          if (isPlaying == false) {
            player.play('frosting_cleared2.wav');
          }
          dialogue();
        } else if (image == "images1/btn_medium_nosound_brown@6x.png" ||
            image == "images1/btn_medium_sound_brown@6x.png") {
          if (isPlaying == true) {
            audioplayer.pause();
            isPlaying = false;
            run1 = false;
            run = false;
            setState(() {
              if (image == "images1/btn_medium_nosound_brown@6x.png") {
                chotebuttonimages[1] = "images1/btn_medium_sound_brown@6x.png";
              } else if (image == "images1/btn_medium_sound_brown@6x.png") {
                chotebuttonimages[1] =
                    "images1/btn_medium_nosound_brown@6x.png";
              }
            });
          } else if (isPlaying == false) {
            player.loop('preview.mp3');
            isPlaying = true;
            run1 = false;
            run = false;
            setState(() {
              if (image == "images1/btn_medium_nosound_brown@6x.png") {
                chotebuttonimages[1] = "images1/btn_medium_sound_brown@6x.png";
              } else if (image == "images1/btn_medium_sound_brown@6x.png") {
                chotebuttonimages[1] =
                    "images1/btn_medium_nosound_brown@6x.png";
              }
            });
          }
        }
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
    AudioCache player = new AudioCache(fixedPlayer: audioplayer);
    int randomNumber1 = random.nextInt(70);
    int randomNumber2 = random.nextInt(70);
    int mul = randomNumber1 * randomNumber2;
    int randomNumber3 = random.nextInt(2);
    int randomNumber4 = random.nextInt(30) + 1;

    run1 ? randomnumber = randomNumber3 : null;
    run1
        ? randomNumber3 == 1
            ? earlier = "$randomNumber1 * $randomNumber2 = $mul"
            : earlier =
                "$randomNumber1 * $randomNumber2 =${(mul - randomNumber4).abs()}"
        : null;

    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);

    return WillPopScope(
      onWillPop: () {
        if (isPlaying == false) {
          player.play('frosting_cleared2.wav');
        }
        return dialogue();
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
                                "Multiplication",
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
                height: h / 32,
              ),
              Row(
                children: [
                  SizedBox(
                    width: w / 13,
                  ),
                  Container(
                    height: h / 10,
                    width: w / 2,
                    decoration: BoxDecoration(
                      // color: Colors.green,
                      image: DecorationImage(
                        image: AssetImage('images1/boards_small_green@6x.webp'),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              height: h / 10,
                            ),
                            Center(
                              child: Text(
                                "Score: $marks",
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
                  ),
                  SizedBox(
                    width: w / 15,
                  ),
                  Container(
                    height: h / 8,
                    width: w / 4,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            "images1/btn_medium_nothing_brown@6x.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: h / 40,
                        ),
                        Center(
                          child: Text(
                            showtimer,
                            style: TextStyle(
                              fontSize: h / 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Chicken',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: h / 13,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Container(
                  height: h / 11,
                  width: w / 1.2,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images1/window_title_leaves@6x.webp'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: run1
                      ? run
                          ? randomNumber3 == 1
                              ? Text(
                                  "$randomNumber1 * $randomNumber2 = $mul",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: h / 25,
                                      fontFamily: "Chicken",
                                      color: Colors.white),
                                )
                              : Text(
                                  "$randomNumber1 * $randomNumber2 =${(mul - randomNumber4).abs()}",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: h / 25,
                                    color: Colors.white,
                                    fontFamily: "Chicken",
                                  ),
                                )
                          : null
                      : Text(
                          earlier,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: h / 25,
                            fontFamily: "Chicken",
                            color: Colors.white,
                          ),
                        ),
                ),
              ),
              SizedBox(
                height: h / 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: w / 12,
                  ),
                  InkWell(
                    onTap: () {
                      run = false;
                      run1 = true;
                      if (randomnumber == 1) {
                        if (isPlaying == false) {
                          player.play('button_press.wav');
                        }
                        marks = marks + 10;
                        timeplus = true;
                        colortoshow = right;
                      } else {
                        if (isPlaying == false) {
                          player.play('frosting_cleared2.wav');
                        }
                        colortoshow = wrong;
                        timeplus = false;
                        marks = marks - 10;
                      }
                      setState(() {
                        boardimage['a'] = colortoshow;
                      });
                      Timer(Duration(milliseconds: 150), nextpage);
                    },
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: h / 11,
                            width: w / 2.5,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(boardimage['a']),
                                fit: BoxFit.fill,
                              ),
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 15,
                                ),
                                Icon(
                                  Icons.check_circle,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                Center(
                                  child: Text(
                                    "Right",
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
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: w / 27,
                  ),
                  InkWell(
                    onTap: () {
                      run = false;
                      run1 = true;
                      if (randomnumber == 0) {
                        if (isPlaying == false) {
                          player.play('button_press.wav');
                        }
                        marks = marks + 10;
                        timeplus = true;
                        colortoshow = right;
                      } else {
                        if (isPlaying == false) {
                          player.play('frosting_cleared2.wav');
                        }
                        colortoshow = wrong;
                        timeplus = false;
                        marks = marks - 10;
                      }
                      setState(() {
                        boardimage['b'] = colortoshow;
                      });
                      Timer(Duration(milliseconds: 150), nextpage);
                    },
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: h / 11,
                            width: w / 2.5,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(boardimage['b']),
                                fit: BoxFit.fill,
                              ),
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 15,
                                ),
                                Icon(
                                  Icons.remove_circle,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                Center(
                                  child: Text(
                                    "Wrong",
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
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: h / 14,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  button(chotebuttonimages[0]),
                  SizedBox(
                    width: w / 3,
                  ),
                  button(chotebuttonimages[1]),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
