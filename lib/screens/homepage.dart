import 'dart:io';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:mathwar/color/colors.dart';
import 'package:mathwar/main.dart';
import 'package:mathwar/screens/levels.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:mathwar/screens/menu.dart';
import 'package:mathwar/services/versioncheck.dart';

class HomePage extends StatefulWidget {
  bool shown;
  HomePage({Key key, @required this.shown}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState(shown);
}

class _HomePageState extends State<HomePage> {
  final player = AudioCache();
  bool shown;
  _HomePageState(this.shown);

  List<String> images = [
    "images1/add.png",
    "images1/sub.png",
    "images1/mul.png",
    "images1/div.png",
  ];

  List<String> chotebuttonimages = [
    "images1/btn_medium_back_brown@6x.png",
    "images1/btn_medium_settings_brown@6x.png",
  ];

  Widget customcard(String operator, String image) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        player.play('button_press.wav');
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => Levels(operator),
        ));
      },
      child: Container(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: h / 5,
              width: w / 2.55,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              height: h / 55,
            ),
            Container(
              height: h / 15,
              width: w / 2.35,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images1/window_title_leaves@6x.webp"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: h / 70,
                  ),
                  Text(
                    operator,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: h / 30,
                      color: Colors.white,
                      fontFamily: "Grinched",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
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
                                "Exit the Game?",
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
                                      fontSize: h / 30,
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
                                    exit(0);
                                  },
                                  child: Text(
                                    "YES",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: h / 30,
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
    return InkWell(
      onTap: () {
        if (image == "images1/btn_medium_back_brown@6x.png") {
          player.play('frosting_cleared2.wav');
          dialogue();
          // showNotification();
        } else {
          player.play('button_press.wav');
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => Menu(),
          ));
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

  void initState() {
    super.initState();
    DatabaseReference userDbReferece;
    userDbReferece = FirebaseDatabase.instance.reference();
    if (shown == false) {
      versionCheck(context, userDbReferece);
    }
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification notification = message.notification;
      AndroidNotification android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channel.description,
                color: Colors.white,
                playSound: true,
                icon: '@mipmap/launcher_icon1',
              ),
            ));
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      RemoteNotification notification = message.notification;
      AndroidNotification android = message.notification?.android;
      if (notification != null && android != null) {
        showDialog(
            context: context,
            builder: (_) {
              return HomePage(shown: true);
            });
      }
    });
  }

  // void showNotification() {
  //   flutterLocalNotificationsPlugin.show(
  //       0,
  //       "Testing",
  //       "How you doin ?",
  //       NotificationDetails(
  //           android: AndroidNotificationDetails(
  //               channel.id, channel.name, channel.description,
  //               importance: Importance.high,
  //               color: Colors.white,
  //               playSound: true,
  //               icon: '@mipmap/ic_launcher')));
  // }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    final player = AudioCache();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return WillPopScope(
      onWillPop: () {
        player.play('frosting_cleared2.wav');
        return dialogue();
      },
      child: Scaffold(
        backgroundColor: brown1,
        // resizeToAvoidBottomInset: true,
        body: Container(
          padding: EdgeInsets.zero,
          height: h,
          width: w,
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: w / 7,
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
                                    height: h / 35,
                                  ),
                                  Center(
                                    child: Text(
                                      "Mathwar",
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
                    SizedBox(
                      width: w / 28,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: h / 45,
                        ),
                        button(chotebuttonimages[1]),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: h / 20,
              ),
              Row(
                children: [
                  SizedBox(width: w / 17),
                  customcard("Add", images[0]),
                  SizedBox(width: w / 43),
                  customcard("Subtract", images[1]),
                ],
              ),
              SizedBox(
                height: h / 20,
              ),
              Row(
                children: [
                  SizedBox(width: w / 17),
                  customcard("Multiply", images[2]),
                  SizedBox(width: w / 43),
                  customcard("Divide", images[3]),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
