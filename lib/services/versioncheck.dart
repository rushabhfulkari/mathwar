import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void _launchURL(url) async =>
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';

double appVersion = 1.0;
void versionCheck(BuildContext ctx, dbReference) {
  final audioplayer = AudioPlayer();
  AudioCache player = new AudioCache(fixedPlayer: audioplayer);
  dbReference.child("Version").once().then((value) {
    double version = double.tryParse(value.value['v'].toString());
    String cu = value.value['cu'].toString();
    String show = value.value['s'].toString();
    String link = value.value['l'].toString();
    if (show == "yes") {
      if (appVersion < version) {
        showDialog(
          barrierDismissible: (cu == "no"),
          context: ctx,
          builder: (ctx) {
            return WillPopScope(
                onWillPop: () async => (cu == "no"),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                      height: 200,
                      width: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image:
                              AssetImage('images1/boards_large_brown@6x.webp'),
                          fit: BoxFit.contain,
                        ),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 300,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 20.0, right: 90),
                                child: Stack(children: [
                                  Center(
                                    child: Text(
                                      "Update Available!",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        decoration: TextDecoration.none,
                                        color: Colors.white,
                                        fontFamily: "Chicken",
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ]),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                width: 120,
                              ),
                              SizedBox(
                                width: 60,
                              ),
                              Container(
                                height: 50,
                                width: 120,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'images1/boards_small_green@6x.webp'),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 7.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      player.play('button_press.wav');
                                      _launchURL(
                                          "https://play.google.com/store/apps/details?id=com.dts.mathwar");
                                    },
                                    child: Text(
                                      "Update",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        decoration: TextDecoration.none,
                                        color: Colors.white,
                                        fontFamily: "Chicken",
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )),
                ));
          },
        );
      }
    }
  });
}
