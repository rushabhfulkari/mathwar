import 'package:flutter/material.dart';
import 'package:mathwar/color/colors.dart';
import 'package:mathwar/screens/feedback.dart';
import 'package:mathwar/screens/homepage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';
import 'package:launch_review/launch_review.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

Widget plate6(String title) {
  return Padding(
    padding: const EdgeInsets.only(right: 16.0),
    child: Container(
      height: 70,
      width: 330,
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
              Padding(
                padding: const EdgeInsets.only(left: 14, top: 14.0),
                child: Stack(children: [
                  Center(
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 35.0,
                        color: Colors.white,
                        fontFamily: "Grinched",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

class _MenuState extends State<Menu> {
  final audioplayer = AudioPlayer();
  void initState() {
    AudioCache player = new AudioCache(fixedPlayer: audioplayer);

    super.initState();
  }

  Widget button(String image) {
    AudioCache player = new AudioCache(fixedPlayer: audioplayer);
    return InkWell(
      onTap: () {
        if (image == "images1/btn_medium_back_brown@6x.png") {
          player.play('frosting_cleared2.wav');
          return Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => HomePage(shown: true)));
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
          height: h,
          width: w,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images1/window_panel_setting@6x.webp'),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            children: [
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
                                      "Settings",
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
                height: h / 13,
              ),
              InkWell(
                  onTap: () {
                    player.play('button_press.wav');
                    LaunchReview.launch(androidAppId: "com.dts.mathwar");
                  },
                  child: plate6("Rate Us")),
              SizedBox(
                height: h / 29,
              ),
              InkWell(
                  onTap: () {
                    player.play('button_press.wav');
                    _launchURL(
                        'https://play.google.com/store/search?q=pub%3ADEVTAS&c=apps');
                  },
                  child: plate6("More Apps")),
              SizedBox(
                height: h / 29,
              ),
              InkWell(
                  onTap: () {
                    player.play('button_press.wav');
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => GetFeedback()));
                  },
                  child: plate6("Feedback")),
              SizedBox(
                height: h / 29,
              ),
              InkWell(
                  onTap: () {
                    player.play('button_press.wav');
                    _showMyDialog();
                  },
                  child: plate6("Privacy Policy")),
              SizedBox(
                height: h / 29,
              ),
              InkWell(
                  onTap: () {
                    player.play('button_press.wav');
                    _onShare(context);
                  },
                  child: plate6("Share this App")),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Privacy Policy',
            style: TextStyle(
              fontFamily: "Roboto",
            ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  "This Privacy Policy is only applicable if you have downloaded this Game from the developer DEVTAS.\n\nDEVTAS built the MathWar game as a Free application.\n\nThis SERVICE is provided by DEVTAS at no cost and is intended for use as is.\n\nCopyright: DEVTAS. ALL RIGHTS RESERVED.",
                  style: TextStyle(
                    fontFamily: "Roboto",
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  _onShare(BuildContext context) async {
    final RenderBox box = context.findRenderObject() as RenderBox;

    await Share.share(
        "MathWar\n\nCheck this amazing game out\n\nIndia's Best Math game\n\nAvailable on Play Store for Free\n\nlink:\nhttps://play.google.com/store/apps/details?id=com.dts.mathwar",
        subject: "Share",
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }

  void _launchURL(url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
}
