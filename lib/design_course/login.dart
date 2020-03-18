import 'package:best_flutter_ui_templates/design_course/globals.dart';
import 'package:http/http.dart' as http;



import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
//import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'CustomIcons.dart';
import 'Screens/Profile.dart';
import 'home_design_course.dart';
import 'Widgets/SocialIcons.dart';
import 'globals.dart' as global;
//import 'package:mvc_pattern/mvc_pattern.dart';

bool _signUpActive = false;
bool _signInActive = true;
//var facebookLogin = FacebookLogin();
TextEditingController _emailController = TextEditingController();
TextEditingController _passwordController = TextEditingController();
TextEditingController _newEmailController = TextEditingController();
TextEditingController _newPasswordController = TextEditingController();
//final FirebaseAuth _auth = FirebaseAuth.instance;



class _LogInPageState extends StateMVC<LogInPage> {
  var signUpEmailController= TextEditingController(),
      signUpFatherNameController= TextEditingController(),
      signUpNameController= TextEditingController(),
      signUpMobileController= TextEditingController(),
      signUpPasswordController= TextEditingController(),
      signUpConfirmPasswordController= TextEditingController(),
      signUpEducationController= TextEditingController();

  String base64Image='';

  //var signUpNameController;

  _LogInPageState() : super(Controller());


  Future<File> imageFile;

  @override
  initState(){
    checkLoggedInAlready();
  }
  
  
  pickImageFromGallery(ImageSource source) async{
    imageFile = ImagePicker.pickImage(source: source);
    setState(() {
      imageFile=imageFile;
    });

    image= await imageFile;
    Uint8List imageBytes = await image.readAsBytes();

    base64Image = base64.encode(imageBytes);
    debugPrint(base64Image);
    print(signUpMobileController.text.toString());

  }

  var image;
  Widget showImage() {
    return FutureBuilder<File>(
      future: imageFile,
      builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.data != null) {
          return image=Image.file(
            snapshot.data,
            width: 300,
            height: 300,
          );
        } else if (snapshot.error != null) {
          return const Text(
            'Error Picking Image',
            textAlign: TextAlign.center,
          );
        } else {
          return const Text(
            'No Image Selected',
            textAlign: TextAlign.center,
          );
        }
      },
    );
  }


  @override
  Widget build(BuildContext context) {
   /* SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);*/
    ScreenUtil.instance = ScreenUtil.getInstance()
      ..init(context);
    ScreenUtil.instance =
    ScreenUtil(width: 750, height: 1304, allowFontScaling: true)
      ..init(context);
    return Column(
      children: <Widget>[
        Container(
          child: Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                      Controller.displayLogoTitle,
                      style: CustomTextStyle.title(context)
                  ),
                  Text(
                    Controller.displayLogoSubTitle,
                    style: CustomTextStyle.subTitle(context),
                  ),
                ],
              )),
          width: ScreenUtil.getInstance().setWidth(750),
          height: ScreenUtil.getInstance().setHeight(190),
        ),
        SizedBox(
          height: ScreenUtil.getInstance().setHeight(60),
        ),
        Container(
          child: Padding(
            padding: EdgeInsets.only(left: 25.0, right: 25.0),
            child: IntrinsicWidth(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  OutlineButton(
                    onPressed: () =>
                        setState(() => Controller.changeToSignIn()),
                    borderSide: new BorderSide(
                      style: BorderStyle.none,
                    ),
                    child: new Text(Controller.displaySignInMenuButton,
                        style: _signInActive
                            ? TextStyle(
                            fontSize: 22,
                            color: Theme
                                .of(context)
                                .accentColor,
                            fontWeight: FontWeight.bold)
                            : TextStyle(
                            fontSize: 16,
                            color: Theme
                                .of(context)
                                .accentColor,
                            fontWeight: FontWeight.normal)),
                  ),
                  OutlineButton(
                    onPressed: () =>
                        setState(() => Controller.changeToSignUp()),
                    borderSide: BorderSide(
                      style: BorderStyle.none,
                    ),
                    child: Text(Controller.displaySignUpMenuButton,
                        style: _signUpActive
                            ? TextStyle(
                            fontSize: 22,
                            color: Theme
                                .of(context)
                                .accentColor,
                            fontWeight: FontWeight.bold)
                            : TextStyle(
                            fontSize: 16,
                            color: Theme
                                .of(context)
                                .accentColor,
                            fontWeight: FontWeight.normal)),
                  )
                ],
              ),
            ),
          ),
          width: ScreenUtil.getInstance().setWidth(750),
          height: ScreenUtil.getInstance().setHeight(170),
        ),
        SizedBox(
          height: ScreenUtil.getInstance().setHeight(10),
        ),
        Container(
          child: Padding(
              padding: EdgeInsets.only(left: 30.0, right: 30.0),
              child: _signInActive ? _showSignIn(context) : _showSignUp()),
          width: ScreenUtil.getInstance().setWidth(750),
          height: ScreenUtil.getInstance().setHeight(778),
        ),
      ],
    );
  }

  Widget _showSignIn(context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            height: ScreenUtil.getInstance().setHeight(30),
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.only(),
              child: TextField(
                keyboardType: TextInputType.number,
                style: TextStyle(color: Theme
                    .of(context)
                    .accentColor),
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: "Mobile",

                  hintStyle: CustomTextStyle.formField(context),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme
                              .of(context)
                              .accentColor, width: 1.0)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme
                              .of(context)
                              .accentColor, width: 1.0)),
                  prefixIcon: const Icon(
                    Icons.phone_android,
                    color: Colors.white,
                  ),
                ),
                obscureText: false,
              ),
            ),
          ),
          SizedBox(
            height: ScreenUtil.getInstance().setHeight(50),
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.only(),
              child: TextField(
                obscureText: true,
                style: TextStyle(color: Theme
                    .of(context)
                    .accentColor),
                controller: _passwordController,
                decoration: InputDecoration(
                  //Add th Hint text here.
                  hintText: Controller.displayHintTextPassword,
                  hintStyle: CustomTextStyle.formField(context),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme
                              .of(context)
                              .accentColor, width: 1.0)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme
                              .of(context)
                              .accentColor, width: 1.0)),
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: ScreenUtil.getInstance().setHeight(80),
          ),
          /*
          Container(
            child: Padding(
              padding: EdgeInsets.only(),
              child: RaisedButton(
                child: Row(
                  children: <Widget>[
                    SocialIcon(iconData: CustomIcons.email),
                    Expanded(
                      child: Text(
                        Controller.displaySignInEmailButton,
                        textAlign: TextAlign.center,
                        style: CustomTextStyle.button(context),
                      ),
                    )
                  ],
                ),
                color: Colors.blueGrey,
                onPressed: () =>
                    Controller.tryToLogInUserViaEmail(
                        context, _emailController, _passwordController),
              ),
            ),
          ),
          SizedBox(
            height: ScreenUtil.getInstance().setHeight(30),
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.only(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  horizontalLine(),
                  Text(Controller.displaySeparatorText,
                      style: CustomTextStyle.body(context)),
                  horizontalLine()
                ],
              ),
            ),
          ),
          SizedBox(
            height: ScreenUtil.getInstance().setHeight(30),
          ),*/
          Container(
            child: Padding(
                padding: EdgeInsets.only(),
                child: RaisedButton(
                  child: Row(
                    children: <Widget>[
                      //SocialIcon(iconData: CustomIcons.facebook),
                      Expanded(
                        child: Text(
                          "Sign In",
                          textAlign: TextAlign.center,
                          style: CustomTextStyle.button(context),
                        ),
                      )
                    ],
                  ),
                  color: Colors.lightBlue,
                  onPressed: () {
                  checkLogin(_emailController, _passwordController);
                    /*
                    Navigator.push(
                      context,
                      MaterialPageRoute<dynamic>(
                        builder: (BuildContext context) => DesignCourseHomeScreen(),
                      ),
                    );
*/
                  },
                )),
          ),
        ],
      ),
    );
  }

  Widget _showSignUp() {
    return Scaffold(
      backgroundColor:Colors.black,
      body: ListView(
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[

          SizedBox(
            height: ScreenUtil.getInstance().setHeight(30),
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.only(),
              child: TextField(
                obscureText: false,
                style: CustomTextStyle.formField(context),
                controller: signUpNameController,
                decoration: InputDecoration(
                  //Add th Hint text here.
                  hintText: "Name",
                  hintStyle: CustomTextStyle.formField(context),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme
                              .of(context)
                              .accentColor, width: 1.0)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme
                              .of(context)
                              .accentColor, width: 1.0)),
                  prefixIcon: const Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: ScreenUtil.getInstance().setHeight(50),
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.only(),
              child: TextField(
                obscureText: false,
                style: CustomTextStyle.formField(context),
                controller: signUpFatherNameController,
                decoration: InputDecoration(
                  //Add th Hint text here.
                  hintText: "Father\'s Name",
                  hintStyle: CustomTextStyle.formField(context),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme
                              .of(context)
                              .accentColor, width: 1.0)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme
                              .of(context)
                              .accentColor, width: 1.0)),
                  prefixIcon: const Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: ScreenUtil.getInstance().setHeight(50),
          ),

          Container(
            child: Padding(
              padding: EdgeInsets.only(),
              child: TextField(
                obscureText: false,
                keyboardType: TextInputType.number,
                style: CustomTextStyle.formField(context),
                controller: signUpMobileController,
                decoration: InputDecoration(
                  //Add th Hint text here.
                  hintText: "Mobile",

                  hintStyle: CustomTextStyle.formField(context),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme
                              .of(context)
                              .accentColor, width: 1.0)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme
                              .of(context)
                              .accentColor, width: 1.0)),
                  prefixIcon: const Icon(
                    Icons.phone_android,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: ScreenUtil.getInstance().setHeight(50),
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.only(),
              child: TextField(
                obscureText: false,
                style: CustomTextStyle.formField(context),
                controller: signUpEmailController,
                decoration: InputDecoration(
                  //Add th Hint text here.
                  hintText: "Email",
                  hintStyle: CustomTextStyle.formField(context),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme
                              .of(context)
                              .accentColor, width: 1.0)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme
                              .of(context)
                              .accentColor, width: 1.0)),
                  prefixIcon: const Icon(
                    Icons.email,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),

          SizedBox(
            height: ScreenUtil.getInstance().setHeight(50),
          ),

          Container(
            child: Padding(
              padding: EdgeInsets.only(),
              child: TextField(
                obscureText: true,
                style: CustomTextStyle.formField(context),
                controller: signUpPasswordController,
                decoration: InputDecoration(
                  //Add the Hint text here.

                  hintText: Controller.displayHintTextNewPassword,
                  hintStyle: CustomTextStyle.formField(context),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme
                              .of(context)
                              .accentColor, width: 1.0)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme
                              .of(context)
                              .accentColor, width: 1.0)),
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: ScreenUtil.getInstance().setHeight(80),
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.only(),
              child: TextField(
                obscureText: true,
                style: CustomTextStyle.formField(context),
                controller: signUpConfirmPasswordController,
                decoration: InputDecoration(
                  //Add th Hint text here.
                  hintText: "Confirm Password",
                  hintStyle: CustomTextStyle.formField(context),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme
                              .of(context)
                              .accentColor, width: 1.0)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme
                              .of(context)
                              .accentColor, width: 1.0)),
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: ScreenUtil.getInstance().setHeight(50),
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.only(),
              child: TextField(
                obscureText: false,
                style: CustomTextStyle.formField(context),
                controller: signUpEducationController,
                decoration: InputDecoration(
                  //Add th Hint text here.
                  hintText: "Education",
                  hintStyle: CustomTextStyle.formField(context),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme
                              .of(context)
                              .accentColor, width: 1.0)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme
                              .of(context)
                              .accentColor, width: 1.0)),
                  prefixIcon: const Icon(
                    Icons.book,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: ScreenUtil.getInstance().setHeight(50),
          ),

          Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
    showImage(),
    InkWell(child: Image.asset('assets/design_course/userImage.png',width: 60,),
    onTap: ()async{

    pickImageFromGallery(ImageSource.gallery);




    },
    ),
    ],
    )),

/*
          Container(
            child: Padding(
              padding: EdgeInsets.only(),
              child: FlatButton(
    onPressed: null,
    padding: EdgeInsets.all(0.0),
    child: InkWell(child: Image.asset('assets/design_course/userImage.png'),
      onTap: ()async{






      },
    ))
            ),
          ),*/
          SizedBox(
            height: ScreenUtil.getInstance().setHeight(50),
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.only(),
              child: RaisedButton(
                child: Text(
                  Controller.displaySignUpMenuButton,
                  style: CustomTextStyle.button(context),
                ),
                color: Colors.lightBlue,
                onPressed: () =>
                    signUpWithEmailAndPassword(),
              ),
            ),
          ),

        ],
      ),
    );
  }

  Widget horizontalLine() =>
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Container(
          width: ScreenUtil.getInstance().setWidth(120),
          height: 1.0,
          color: Colors.white.withOpacity(0.6),
        ),
      );

  Widget emailErrorText() => Text(Controller.displayErrorEmailLogIn);

  void checkLogin(TextEditingController emailController,TextEditingController passwordController) async{


    if(emailController.text.toString().isEmpty){
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: new Text("Alert"),
            content: new Text("Please Enter Mobile No."),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              new FlatButton(
                child: new Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );

    }
    else if(passwordController.text.toString().isEmpty){
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: new Text("Alert"),
            content: new Text("Please Enter Password."),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              new FlatButton(
                child: new Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );

    }
    else{
      print("eeeeeeeee"+emailController.text);
      try {
        Dio().get("http://jeevandangwalior.com/HanuSir/login.php?mobile="+emailController.text.toString()+"&password="+passwordController.text.toString()).then((response){
          print(response.toString());
          if(response.toString().trim()=='number not register create account'){
            showDialog(
              context: context,
              builder: (BuildContext context) {
                // return object of type Dialog
                return AlertDialog(
                  title: new Text("Alert"),
                  content: new Text("Wrong credential. Please register first"),
                  actions: <Widget>[
                    // usually buttons at the bottom of the dialog
                    new FlatButton(
                      child: new Text("OK"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );

          }
          else if(jsonDecode(response.toString()).length==0){
            showDialog(
              context: context,
              builder: (BuildContext context) {
                // return object of type Dialog
                return AlertDialog(
                  title: new Text("Alert"),
                  content: new Text("Wrong password."),
                  actions: <Widget>[
                    // usually buttons at the bottom of the dialog
                    new FlatButton(
                      child: new Text("OK"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          }
          else{
            var list=jsonDecode(response.toString());
            print(response.toString());
            String studentMobile=list[0]['Mobile'];
            String studentName=list[0]['Name'];
            String studentEmail=list[0]['Email'];
            String teacherMobile=list[0]['number'];
            String FeesNextDate=list[0]['FeesNextDate'];
            String RemainingFees=list[0]['RemainingFees'];



            SharedPreferences.getInstance().then((prefs){

              print("sssshhhh"+studentMobile);
              prefs.setString("StudentMobile",studentMobile);
              prefs.setString("StudentMobileCheck",studentMobile);
              prefs.setString("StudentName",studentName);
              prefs.setString("StudentEmail",studentEmail);

              if(studentMobile.isNotEmpty)
              {

                Navigator.push(
                  context,
                  MaterialPageRoute<dynamic>(
                    builder: (BuildContext context) => DesignCourseHomeScreen(),
                  ),
                );

              }
              else{


                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    // return object of type Dialog
                    return AlertDialog(
                      title: new Text("Alert"),
                      content: new Text("Wrong credential. Please register first"),
                      actions: <Widget>[
                        // usually buttons at the bottom of the dialog
                        new FlatButton(
                          child: new Text("OK"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );

              }

            });

          }





        });

      }on FormatException catch (e) {
        print(e);

        showDialog(
          context: context,
          builder: (BuildContext context) {
            // return object of type Dialog
            return AlertDialog(
              title: new Text("Alert"),
              content: new Text("Wrong credential. Please register first"),
              actions: <Widget>[
                // usually buttons at the bottom of the dialog
                new FlatButton(
                  child: new Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );

      }
      catch(e){
        print(e);
      }


      }







  //    print(map);



  }

  signUpWithEmailAndPassword() async{

    //print("eeefffff"+newEmailController.text);
    try {
      if(signUpNameController.text.toString().isEmpty)
        {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              // return object of type Dialog
              return AlertDialog(
                title: new Text("Alert"),
                content: new Text("Please Enter Your Name"),
                actions: <Widget>[
                  // usually buttons at the bottom of the dialog
                  new FlatButton(
                    child: new Text("OK"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );


        }

      else
      if(signUpFatherNameController.text.toString().isEmpty)
      {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            // return object of type Dialog
            return AlertDialog(
              title: new Text("Alert"),
              content: new Text("Please Enter Your Father's name"),
              actions: <Widget>[
                // usually buttons at the bottom of the dialog
                new FlatButton(
                  child: new Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );


      }
else
      if(signUpMobileController.text.toString().isEmpty)
      {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            // return object of type Dialog
            return AlertDialog(
              title: new Text("Alert"),
              content: new Text("Please Enter Your Mobile Number"),
              actions: <Widget>[
                // usually buttons at the bottom of the dialog
                new FlatButton(
                  child: new Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );


      }
      else
      if(signUpEmailController.text.toString().isEmpty)
      {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            // return object of type Dialog
            return AlertDialog(
              title: new Text("Alert"),
              content: new Text("Please Enter Your Email Id."),
              actions: <Widget>[
                // usually buttons at the bottom of the dialog
                new FlatButton(
                  child: new Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );


      }
      else

      if((signUpPasswordController.text.toString().isEmpty)){
        showDialog(
          context: context,
          builder: (BuildContext context) {
            // return object of type Dialog
            return AlertDialog(
              title: new Text("Alert"),
              content: new Text("Please Enter Password"),
              actions: <Widget>[
                // usually buttons at the bottom of the dialog
                new FlatButton(
                  child: new Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );

      }




      else

      if(signUpPasswordController.text.toString()!=signUpConfirmPasswordController.text.toString()){
        showDialog(
          context: context,
          builder: (BuildContext context) {
            // return object of type Dialog
            return AlertDialog(
              title: new Text("Alert"),
              content: new Text("Password Not Matched"),
              actions: <Widget>[
                // usually buttons at the bottom of the dialog
                new FlatButton(
                  child: new Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );

      }
else
      if(base64Image.isEmpty){
        showDialog(
          context: context,
          builder: (BuildContext context) {
            // return object of type Dialog
            return AlertDialog(
              title: new Text("Alert"),
              content: new Text("Select an Image"),
              actions: <Widget>[
                // usually buttons at the bottom of the dialog
                new FlatButton(
                  child: new Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );

      }

      else{
        Dio().get("https://www.jeevandangwalior.com/HanuSir/studentRegister.php?name="+signUpNameController.text.toString()+'&email='+signUpEmailController.text.toString()+'&password='+signUpPasswordController.text.toString()+'&fatherName='+signUpFatherNameController.text.toString()+'&mobile='+signUpMobileController.text.toString()+'&class='+signUpEducationController.text.toString()).then((response)async{

          if(base64Image.isNotEmpty){
            try{
              var res=await  http.post("https://www.jeevandangwalior.com/HanuSir/imageUpload.php",
                  body: {"image": base64Image,
                    "imgname": signUpMobileController.text.toString(),
                  });
              print(res.toString());

            }
            on Exception catch(e){
              print(e);
            }

          }
          var prefs=await SharedPreferences.getInstance();
          prefs.setString("StudentMobile",signUpMobileController.text.toString());
          Navigator.push(
            context,
            MaterialPageRoute<dynamic>(
              builder: (BuildContext context) => DesignCourseHomeScreen(),
            ),
          );







            });

      }




      //    print(map);


//      print(list.toString());
    }on FormatException catch (e) {
      print(e);

      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: new Text("Alert"),
            content: new Text("Wrong credential. Please register first"),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              new FlatButton(
                child: new Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );

    }
    catch(e){
      print(e);
    }
  }

  void checkLoggedInAlready()async {
    var prefs = await SharedPreferences.getInstance();

    if (stuMobile.isNotEmpty)
  {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => DesignCourseHomeScreen(),
      ),
    );
  }

    
    
  }
}





void getHttp() async {
  try {
    Response response = await Dio().get("http://jeevandangwalior.com/admin/index.php/Design?package_name=com.amigo.pvt.hanusir");

    //var map = await jsonDecode(response.toString());
    //print(map['sliderImages']);


    print(response.toString());
  } catch (e) {
    print(e);
  }
}


class LogInPage extends StatefulWidget {
  LogInPage({Key key}) : super(key: key);

  @protected
  @override
  State<StatefulWidget> createState() => _LogInPageState();
}

class Controller extends ControllerMVC {
  /// Singleton Factory
  factory Controller() {
    if (_this == null) _this = Controller._();
    return _this;
  }

  static Controller _this;

  Controller._();

  /// Allow for easy access to 'the Controller' throughout the application.
  static Controller get con => _this;

  /// The Controller doesn't know any values or methods. It simply handles the communication between the view and the model.

  static String get displayLogoTitle => Model._logoTitle;

  static String get displayLogoSubTitle => Model._logoSubTitle;

  static String get displaySignUpMenuButton => Model._signUpMenuButton;

  static String get displaySignInMenuButton => Model._signInMenuButton;

  static String get displayHintTextEmail => Model._hintTextEmail;

  static String get displayHintTextPassword => Model._hintTextPassword;

  static String get displayHintTextNewEmail => Model._hintTextNewEmail;

  static String get displayHintTextNewPassword => Model._hintTextNewPassword;

  static String get displaySignUpButtonTest => Model._signUpButtonText;

  static String get displaySignInEmailButton =>
      Model._signInWithEmailButtonText;

  static String get displaySignInFacebookButton =>
      Model._signInWithFacebookButtonText;

  static String get displaySeparatorText =>
      Model._alternativeLogInSeparatorText;

  static String get displayErrorEmailLogIn => Model._emailLogInFailed;

  static void changeToSignUp() => Model._changeToSignUp();

  static void changeToSignIn() => Model._changeToSignIn();

  static Future<bool> signInWithFacebook(context) =>
      Model._signInWithFacebook(context);

  static Future<bool> signInWithEmail(context, email, password) =>
      Model._signInWithEmail(context, email, password);

  static void signUpWithEmailAndPassword(email, password) =>
      Model._signUpWithEmailAndPassword(email, password);

  static Future navigateToProfile(context) => Model._navigateToProfile(context);

  static Future tryToLogInUserViaFacebook(context) async {
    if (await signInWithFacebook(context) == true) {
      navigateToProfile(context);
    }
  }

  static Future tryToLogInUserViaEmail(context, email, password) async {
    if (await signInWithEmail(context, email, password) == true) {
      navigateToProfile(context);
    }
  }

  static Future tryToSignUpWithEmail(email, password) async {
    if (await tryToSignUpWithEmail(email, password) == true) {
      //TODO Display success message or go to Login screen
    } else {
      //TODO Display error message and stay put.
    }
  }
}

class Model {
  static String _logoTitle = global.appName.toUpperCase();
  static String _logoSubTitle = "Education App".toUpperCase();
  static String _signInMenuButton = "SIGN IN";
  static String _signUpMenuButton = "SIGN UP";
  static String _hintTextEmail = "Email";
  static String _hintTextPassword = "Password";
  static String _hintTextNewEmail = "Enter your Email";
  static String _hintTextNewPassword = "Enter a Password";
  static String _signUpButtonText = "SIGN UP";
  static String _signInWithEmailButtonText = "Sign in with Email";
  static String _signInWithFacebookButtonText = "Sign in with Facebook";
  static String _alternativeLogInSeparatorText = "or";
  static String _emailLogInFailed =
      "Email or Password was incorrect. Please try again";

  static void _changeToSignUp() {
    _signUpActive = true;
    _signInActive = false;
  }

  static void _changeToSignIn() {
    _signUpActive = false;
    _signInActive = true;
  }

  static Future<bool> _signInWithFacebook(context) async {
   // final FacebookLoginResult result =
   // await facebookLogin.logInWithReadPermissions(['email']);
/*
    final AuthCredential credential = FacebookAuthProvider.getCredential(
      accessToken: result.accessToken.token,
    );
    final FirebaseUser user =
        (await _auth.signInWithCredential(credential)).user;
    assert(user.email != null);
    assert(user.displayName != null);
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);
    if (user != null) {
      print('Successfully signed in with Facebook. ' + user.uid);
      return true;
    } else {
      print('Failed to sign in with Facebook. ');
      return false;
    }*/
  }

  static Future<bool> _signInWithEmail(context, TextEditingController email,
      TextEditingController password) async {

    /*
    try {
      AuthResult result = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
          email: email.text.trim().toLowerCase(), password: password.text);
      print('Signed in: ${result.user.uid}');
      return true;
    } catch (e) {
      print('Error: $e');
      return false;
    }*/
  }

  static Future<bool> _signUpWithEmailAndPassword(TextEditingController email,
      TextEditingController password) async {
    /*
    try {
      AuthResult result = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
          email: email.text.trim().toLowerCase(), password: password.text);
      print('Signed up: ${result.user.uid}');
      return true;
    } catch (e) {
      print('Error: $e');
      return false;
    }*/
  }

  static Future _navigateToProfile(context) async {
    await Navigator.push(
        context, MaterialPageRoute(builder: (context) => Profile()));
  }
}

ThemeData _buildDarkTheme() {
  final baseTheme = ThemeData(
    fontFamily: "Open Sans",
  );
  return baseTheme.copyWith(
    brightness: Brightness.dark,
    primaryColor: Color(0xFF143642),
    primaryColorLight: Color(0xFF26667d),
    primaryColorDark: Color(0xFF08161b),
    primaryColorBrightness: Brightness.dark,
    accentColor: Colors.white,
  );
}

class CustomTextStyle {
  static TextStyle formField(BuildContext context) {
    return Theme
        .of(context)
        .textTheme
        .title
        .copyWith(
        fontSize: 18.0, fontWeight: FontWeight.normal, color: Colors.white);
  }

  static TextStyle title(BuildContext context) {
    return Theme
        .of(context)
        .textTheme
        .title
        .copyWith(
        fontSize: 34, fontWeight: FontWeight.bold, color: Colors.white);
  }

  static TextStyle subTitle(BuildContext context) {
    return Theme
        .of(context)
        .textTheme
        .title
        .copyWith(
        fontSize: 14, fontWeight: FontWeight.normal, color: Colors.white);
  }

  static TextStyle button(BuildContext context) {
    return Theme
        .of(context)
        .textTheme
        .title
        .copyWith(
        fontSize: 20, fontWeight: FontWeight.normal, color: Colors.white);
  }

  static TextStyle body(BuildContext context) {
    return Theme
        .of(context)
        .textTheme
        .title
        .copyWith(
        fontSize: 14, fontWeight: FontWeight.normal, color: Colors.white);
  }
}
