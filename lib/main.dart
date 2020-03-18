import 'dart:convert';
import 'dart:io';
import 'package:best_flutter_ui_templates/app_theme.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'design_course/globals.dart' as global;
import 'design_course/home_design_course.dart';
import 'design_course/models/category1.dart';
import 'design_course/models/category2.dart';
import 'design_course/splash.dart';
//import 'navigation_home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  getHttp();
 runApp(MyApp());
//  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
  //  .then((_) => runApp(MyApp()));

}
void getHttp() async {
  try {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    global.stuMobile=preferences.getString("StudentMobileCheck")??"";
    global.studentEmail=preferences.getString("StudentEmail")??"";
    global.studentName=preferences.getString("StudentName")??"";
    //preferences.clear();

    Response response = await Dio().get("http://jeevandangwalior.com/admin/index.php/Design?package_name=com.amigo.pvt.hanusir");

    Map<String, dynamic> map = await jsonDecode(response.toString());
    //print(map['sliderImages']);

    global.appName=map['app_name'];
    global.number=map['number'];
    global.logo=map['logo'];
    global.sliderImages=map['sliderImages'].cast<String>();
    global.videos=map['videos'];
    global.subjects=map['subjects'];
    global.testCategories=map['testCategories'];
    var prefs=await SharedPreferences.getInstance();
    prefs.setString("Mobile",map['number']);
    prefs.setString("TeacherId",map['teacherId']);

    for(var i=0;i<global.testCategories.length;i++){
      Category1 c1=new Category1();
      var p=0;
      if(i%2==0)
        p=1;
      else
        p=2;
      c1.title=global.testCategories[i]["name"];
      c1.imagePath="assets/design_course/interFace$p.png";
      c1.money=int.parse(global.testCategories[i]["id"]);
      Category1.categoryList.add(c1);


    }


    for(var i=0;i<global.subjects.length;i++){
      Category2 c2=new Category2();
      var p=0;
      if(i%2==0)
        p=2;
      else
        p=1;
      c2.title=global.subjects[i]["subjectName"];
      c2.imagePath="assets/design_course/interFace$p.png";
      c2.money=int.parse(global.subjects[i]["subjectId"]);
      Category2.categoryList.add(c2);


    }

    print(Category2.categoryList.toString()+"................");

    print(response);
  } catch (e) {
    print(e);
  }
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Platform.isAndroid ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.grey,
      systemNavigationBarIconBrightness: Brightness.dark,

    ));
    return MaterialApp(
      title: 'Flutter UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: AppTheme.textTheme,
        platform: TargetPlatform.iOS,



      ),
      home:SplashScreen(),
    );
  }
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
