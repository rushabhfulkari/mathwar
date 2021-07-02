import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:mathwar/color/colors.dart';
import 'package:mathwar/screens/menu.dart';

class GetFeedback extends StatefulWidget {
  @override
  _GetFeedbackState createState() => _GetFeedbackState();
}

class _GetFeedbackState extends State<GetFeedback> {
  DatabaseReference userDbReferece;
  String feedback;
  final TextEditingController feedbackController = TextEditingController();

  void submitDetails(feedback) {
    userDbReferece.child("Users").push().set({
      "feedback": feedback,
    }).then((value) {
      Fluttertoast.showToast(
          msg: "Feedback Submitted!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          fontSize: 16.0);
    });
  }

  @override
  void initState() {
    super.initState();
    userDbReferece = FirebaseDatabase.instance.reference();
  }

  Widget button(String image) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    final player = AudioCache();
    return InkWell(
      onTap: () {
        player.play('frosting_cleared2.wav');
        return Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) => Menu()));
      },
      child: Container(
        child: Column(
          children: [
            Container(
              height: h / 14,
              width: w / 7,
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
          builder: (context) => Menu(),
        ));
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
                                      "Feedback",
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
              Container(
                height: h / 8,
                width: w / 1.3,
                decoration: BoxDecoration(
                  // color: Colors.green,
                  image: DecorationImage(
                    image: AssetImage('images1/boards_small_grey@6x.webp'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: h / 40,
                      ),
                      TextField(
                        onChanged: (value) {
                          setState(() {
                            this.feedback = value;
                          });
                        },
                        controller: feedbackController,
                        cursorColor: Colors.grey,
                        cursorHeight: 30,
                        showCursor: false,
                        style: TextStyle(fontSize: 30, color: Colors.white),
                        decoration: InputDecoration(
                            hintText: "Type here",
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 30.0),
                            contentPadding: EdgeInsets.only(left: 40),
                            border: UnderlineInputBorder(
                                borderSide: BorderSide.none)),
                      ),
                    ]),
              ),
              SizedBox(
                height: h / 26,
              ),
              InkWell(
                onTap: () async {
                  player.play('button_press.wav');
                  submitDetails(this.feedback);
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => Menu(),
                  ));
                },
                child: Container(
                    height: h / 10,
                    width: w / 2.6,
                    decoration: BoxDecoration(
                      // color: Colors.green,
                      image: DecorationImage(
                        image: AssetImage('images1/boards_small_green@6x.webp'),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: h / 40,
                        ),
                        Center(
                          child: RichText(
                            text: TextSpan(
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                              children: <TextSpan>[
                                TextSpan(
                                    text: "SUBMIT",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Chicken")),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
