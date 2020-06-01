import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:async';

class MainContent extends StatefulWidget {
  @override
  _MainContentState createState() => _MainContentState();
}

RepeatInterval time;

bool isSelected1 = false;
bool isSelected2 = false;
bool isSelected3 = false;
bool isSelected5 = false;
bool isSelected10 = false;

bool ispage1 = false;
bool ispage2 = false;
bool ispage3 = false;
bool ispage4 = false;
bool ispage5 = false;

class _MainContentState extends State<MainContent> {
  PageController _pageC = PageController();
  int _currentPage = 0;

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  @override
  void initState() {
    super.initState();
    var initializationSettingsAndroid =
        new AndroidInitializationSettings("app_icon");
    var initializationSettingsIOS = new IOSInitializationSettings();
    var initializationSettings = new InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);
    flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );
  }

  Future _showNotificationMin() async {
    var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
        'channelId', 'channelName', 'channelDescription',
        importance: Importance.Max, priority: Priority.High);
    var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
    NotificationDetails platformChannelSpecifics = new NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.periodicallyShow(
        0,
        "WATER REMINDER",
        "It's time to drink water now!",
        RepeatInterval.EveryMinute,
        platformChannelSpecifics,);
  }

  Future _showNotificationHourly() async {
    var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
        'channelId', 'channelName', 'channelDescription',
        importance: Importance.Max, priority: Priority.High);
    var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
    NotificationDetails platformChannelSpecifics = new NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.periodicallyShow(
        1,
        "WATER REMINDER",
        "It's time to drink water now!",
        RepeatInterval.Hourly,
        platformChannelSpecifics,);
  }

Future _cancel0() async {
    await flutterLocalNotificationsPlugin.cancel(0);
  }

Future _cancel1() async {
    await flutterLocalNotificationsPlugin.cancel(1);
  }  

  @override
  void dispose() {
    super.dispose();
    _pageC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    setState(() {
      if (_currentPage == 0) {
        ispage1 = true;
        ispage2 = false;
        ispage3 = false;
        ispage4 = false;
        ispage5 = false;
      }
      if (_currentPage == 1) {
        ispage2 = true;
        ispage1 = false;
        ispage3 = false;
        ispage4 = false;
        ispage5 = false;
      }
      if (_currentPage == 2) {
        ispage3 = true;
        ispage2 = false;
        ispage1 = false;
        ispage4 = false;
        ispage5 = false;
      }
      if (_currentPage == 3) {
        ispage4 = true;
        ispage2 = false;
        ispage3 = false;
        ispage1 = false;
        ispage5 = false;
      }
      if (_currentPage == 4) {
        ispage5 = true;
        ispage2 = false;
        ispage3 = false;
        ispage4 = false;
        ispage1 = false;
      }
    });

    return Scaffold(
      body: Container(
        color: Color(0xff2b313f),
        child: Column(
          children: <Widget>[
            Expanded(
              child: PageView(
                onPageChanged: (int index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                controller: _pageC,
                children: <Widget>[
                  page1(
                    context,
                    () {
                      _pageC.animateToPage(1,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeOut);
                    },
                  ),
                  commonPage(
                      context,
                      "2",
                      "Why Is Drinking Water So Important?",
                      "Drinking water helps control your calories, energize muscles, keeps skin hydrated, and much more!",
                      "Next", () {
                    _pageC.animateToPage(2,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeOut);
                  }, () {
                    _pageC.animateToPage(0,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeOut);
                  }),
                  commonPage(
                      context,
                      "3",
                      "How We Can Help",
                      "WaterHint was designed to help you remember to drink water throughout the day.",
                      "Next", () {
                    _pageC.animateToPage(3,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeOut);
                  }, () {
                    _pageC.animateToPage(1,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeOut);
                  }),
                  SafeArea(
                    child: Container(
                      color: Color(0xff2b313f),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(left: w * 0.04),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.white54,
                                    size: h * 0.047,
                                  ),
                                  onPressed: () {
                                    _pageC.animateToPage(2,
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.easeOut);
                                  },
                                ),
                                SizedBox(
                                  width: h * 0.02,
                                ),
                                Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(height: h * 0.015),
                                      Text(
                                        "WaterHint",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: h * 0.035),
                                      ),
                                      SizedBox(
                                        height: h * 0.013,
                                      ),
                                      Text(
                                        "4/5",
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: h * 0.025),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: h * 0.04,
                          ),
                          Expanded(
                            child: Container(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 55),
                                    child: Text(
                                      "How Often Do You Want To Be Reminded?",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: h * 0.035),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  switchTile(context, "minute", isSelected1,
                                      (value) {
                                    setState(() {
                                      isSelected1 = value;
                                      isSelected2 = false;
                                      isSelected3 = false;
                                      isSelected5 = false;
                                      isSelected10 = false;
                                    });
                                  }),
                                  switchTile(context, "1 hour", isSelected2,
                                      (value) {
                                    setState(() {
                                      isSelected2 = value;
                                      isSelected1 = false;
                                      isSelected3 = false;
                                      isSelected5 = false;
                                      isSelected10 = false;
                                    });
                                  }),
                                  switchTile(context, "2 hours", isSelected3,
                                      (value) {
                                    setState(() {
                                      isSelected3 = value;
                                      isSelected2 = false;
                                      isSelected1 = false;
                                      isSelected5 = false;
                                      isSelected10 = false;
                                    });
                                  }),
                                  switchTile(context, "3 hours", isSelected5,
                                      (value) {
                                    setState(() {
                                      isSelected5 = value;
                                      isSelected2 = false;
                                      isSelected3 = false;
                                      isSelected1 = false;
                                      isSelected10 = false;
                                    });
                                  }),
                                  switchTile(context, "5 hours", isSelected10,
                                      (value) {
                                    setState(() {
                                      isSelected10 = value;
                                      isSelected2 = false;
                                      isSelected3 = false;
                                      isSelected5 = false;
                                      isSelected1 = false;
                                    });
                                  }),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              _pageC.animateToPage(4,
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.easeOut);
                                if(isSelected1){
                                  _showNotificationMin();
                                }else{
                                  _cancel0();
                                }
                               if(isSelected2){
                                  _showNotificationHourly();
                                }else{
                                  _cancel1();
                                }
                               
                            },
                            child: Container(
                              margin: EdgeInsets.only(top: h * 0.055),
                              width: w * 0.8,
                              height: 45,
                              decoration: BoxDecoration(
                                color: Color(0xff343b4b),
                                borderRadius: BorderRadius.circular(30),
                                border:
                                    Border.all(width: 0.5, color: Colors.white),
                              ),
                              child: Center(
                                child: Text(
                                  "Next",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                  commonPage(
                      context,
                      "5",
                      "You're All Good To Go!",
                      "Congratulations! You may now close the app, we'll send you reminders every (1) hour",
                      "Close", () {
                    SystemNavigator.pop();
                  }, () {
                    _pageC.animateToPage(3,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeOut);
                  }),
                ],
              ),
            ),
            Container(
              height: 50,
              width: 110,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    navDot(ispage1),
                    navDot(ispage2),
                    navDot(ispage3),
                    navDot(ispage4),
                    navDot(ispage5),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget page1(BuildContext context, Function onPressed) {
  double h = MediaQuery.of(context).size.height;
  double w = MediaQuery.of(context).size.width;
  return Container(
    color: Color(0xff2b313f),
    child: Column(
      children: <Widget>[
        Expanded(
          child: Container(
            child: Column(
              children: <Widget>[
                SizedBox(height: h * 0.2),
                Text(
                  "WaterHint",
                  style: TextStyle(color: Colors.white, fontSize: h * 0.09),
                ),
                SizedBox(height: h * 0.05),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    "Reminding you to drink water on a consistent basis",
                    style: TextStyle(color: Colors.white, fontSize: h * 0.035),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: onPressed,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 60,
            decoration: BoxDecoration(
              color: Color(0xff343b4b),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(width: 0.5, color: Colors.white),
            ),
            child: Center(
                child: Text(
              "Continue",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            )),
          ),
        ),
        SizedBox(height: h * 0.1),
      ],
    ),
  );
}

Widget commonPage(BuildContext context, String pageno, String text, String desc,
    String btext, Function onPressed, Function iconPressed) {
  double h = MediaQuery.of(context).size.height;
  double w = MediaQuery.of(context).size.width;
  return SafeArea(
    child: Container(
      color: Color(0xff2b313f),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: w * 0.04),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white54,
                    size: h * 0.047,
                  ),
                  onPressed: iconPressed,
                ),
                SizedBox(
                  width: h * 0.02,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: h * 0.015),
                      Text(
                        "WaterHint",
                        style:
                            TextStyle(color: Colors.white, fontSize: h * 0.035),
                      ),
                      SizedBox(
                        height: h * 0.013,
                      ),
                      Text(
                        "$pageno/5",
                        style:
                            TextStyle(color: Colors.grey, fontSize: h * 0.025),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    height: h * 0.29,
                    child: Image.asset("assets/images/water2.png",
                        fit: BoxFit.contain),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 55),
                    child: Text(
                      text,
                      style: TextStyle(color: Colors.white, fontSize: h * 0.04),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Text(
                      desc,
                      style:
                          TextStyle(color: Colors.white, fontSize: h * 0.028),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: onPressed,
            child: Container(
              margin: EdgeInsets.only(top: h * 0.055),
              width: w * 0.8,
              height: 45,
              decoration: BoxDecoration(
                color: Color(0xff343b4b),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(width: 0.5, color: Colors.white),
              ),
              child: Center(
                child: Text(
                  btext,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 50,
          ),
        ],
      ),
    ),
  );
}

Widget switchTile(BuildContext context, text, value, onChanged) {
  double h = MediaQuery.of(context).size.height;
  double w = MediaQuery.of(context).size.width;
  return Container(
    width: w * 0.8,
    height: 55,
    padding: EdgeInsets.only(left: 20),
    decoration: BoxDecoration(
      color: Color(0xff343b4b),
      borderRadius: BorderRadius.circular(5),
      border: Border.all(width: 0.5, color: Colors.white),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "Every $text",
          style: TextStyle(color: Colors.white, fontSize: h * 0.03),
        ),
        Switch(
          activeColor: Color(0xff08222b),
          inactiveTrackColor: Colors.white,
          activeTrackColor: Colors.white,
          inactiveThumbColor: Colors.grey,
          value: value,
          onChanged: onChanged,
        ),
      ],
    ),
  );
}

Widget navDot(bool isActive) {
  return Container(
      height: 13,
      width: 13,
      decoration: BoxDecoration(
          color: isActive ? Color(0xffc1cde8) : Color(0xff4e5f84),
          shape: BoxShape.circle));
}
