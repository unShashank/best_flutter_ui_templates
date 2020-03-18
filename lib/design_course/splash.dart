import 'dart:async';

import 'package:best_flutter_ui_templates/design_course/globals.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_design_course.dart';
import 'listview.dart';
import 'login.dart';

class SplashScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
  //  setMobile();
    loadData();

  }
  var mobile='';
  Future<Timer> loadData() async {

  //  print("sssssssssssssssss"+prefs.getString("StudentMobile").toString());

    return new Timer(Duration(seconds: 5), onDoneLoading);
  }
  onDoneLoading() async {

    if(stuMobile.isNotEmpty)
      {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute<dynamic>(
            builder: (BuildContext context) => DesignCourseHomeScreen(),
          ),
        );
      }
    else{
      Navigator.pushReplacement(
        context,
        MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => LogInPage(),
        ),
      );
    }

  }
  @override
  Widget build(BuildContext context) {
    return Container(
color: Colors.white,
      child: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height*.3),
            Image.asset('assets/images/logo.jpg',width: MediaQuery.of(context).size.width*.5,),
            SizedBox(height: 140,),
            Text("Powered By",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12,color: Colors.black),textAlign: TextAlign.left,),

            Image.asset('assets/images/tezlaxmi.png',width: MediaQuery.of(context).size.width*.7,),
          ],
        ),
      ),
    );
  }


}