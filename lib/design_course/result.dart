import 'dart:async';
import 'dart:convert';

import 'package:best_flutter_ui_templates/design_course/category_list_view.dart';
import 'package:best_flutter_ui_templates/design_course/course_info_screen.dart';
import 'package:best_flutter_ui_templates/design_course/home_design_course.dart';
import 'package:best_flutter_ui_templates/design_course/popular_course_list_view.dart';
import 'package:best_flutter_ui_templates/main.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'category_list_view1.dart';
import 'design_course_app_theme.dart';
import 'globals.dart' as global;
import 'package:flutter_html/flutter_html.dart';
//import 'package:flutter_youtube/flutter_youtube.dart';
//import 'package:html/dom.dart' as dom;
class Result extends StatefulWidget {
  List responseMap;
  Result(this.responseMap);

  @override
  _ResultState createState() => _ResultState(responseMap);
}

class _ResultState extends State<Result> {
  CategoryType categoryType = CategoryType.ui;
  int _current = 0;
  /* List imgList = [
    'https://images.unsplash.com/photo-1502117859338-fd9daa518a9a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1554321586-92083ba0a115?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1536679545597-c2e5e1946495?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1543922596-b3bbaba80649?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1502943693086-33b5b1cfdf2f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=668&q=80'
  ];*/


  String questionText="";
  String option1="";
  String option2="";
  String option3="";
  String option4="";
  String answer="";
  int questionCount=0;
  int abc=1;
  int selectedRadio;

  _ResultState(this.responseMap);
  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  Timer _timer;
  int _start = 30;

  int minutesToShow=0;
  int secondsToShow=0;

  void startTimer(var minutes) {
    _start=minutes*60;
    minutesToShow=minutes-1;
    secondsToShow=60;
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,


          (Timer timer) => setState(
            () {




          if (_start < 1) {
            timer.cancel();
          } else {

            if(secondsToShow==0){
              minutesToShow--;
              secondsToShow=59;
            }
            else{
              secondsToShow--;
            }

            _start = _start - 1;
          }
        },
      ),
    );
  }


  @override
  void initState() {

    super.initState();
    //startTimer(2);
    selectedRadio = responseMap[0]['selected'];
    getHttp();

  }
  List<Widget> list = new List<Widget>();
  List<dynamic> responseMap;
  bool added=false;
  void getHttp() async {
    try {
      //Response response = await Dio().get("https://www.jeevandangwalior.com/HanuSir/getTestQues.php?text=jgjgg&question_ides=885,898,1068,1069,1070,1071,1072,1073,1074,1075,1076,1077,1078,1079,1080,1081,1082,1083,1084,1085,1086,1088,1090,1087,1089");

      responseMap = this.responseMap;


      for(var i = 0; i < responseMap.length; i++){
        // setState(() {
       // responseMap[i]["selected"]=0;

        list.add(
          RaisedButton(color:abc==0?Colors.grey:Colors.green,child:

          Padding(padding:const EdgeInsets.all(20),

              child:Text((i+1).toString(),style: TextStyle(),
              )
          ),onPressed: (){

            setState(() {



              questionCount=i;
              if(responseMap[questionCount].containsKey("selected")){
                selectedRadio=responseMap[questionCount]["selected"];
              }
              else
                selectedRadio=0;

              questionText= responseMap[questionCount]['Question'];
              option1= responseMap[questionCount]['Option1'];
              option1=option1.replaceAll("<p>", "");
              option1=option1.replaceAll("</p>", "");
              option1=option1.replaceAll("\\n", "");
              option2= responseMap[questionCount]['Option2'];
              option2=option2.replaceAll("<p>", "");
              option2=option2.replaceAll("</p>", "");
              option2=option2.replaceAll("\\n", "");
              option3= responseMap[questionCount]['Option3'];
              option3=option3.replaceAll("<p>", "");
              option3=option3.replaceAll("</p>", "");
              option3=option3.replaceAll("\\n", "");
              option4= responseMap[questionCount]['Option4'];
              option4=option4.replaceAll("<p>", "");
              option4=option4.replaceAll("</p>", "");
              option4=option4.replaceAll("\\n", "");
              answer= responseMap[questionCount]['Answer'];

            });
            Navigator.of(context).pop();

          },),

        );
        //list.add();
        // });



        /*   list.add(ListTile(
          title: Text((i+1).toString(),style: TextStyle(backgroundColor: Colors.grey),),
          onTap: () {

          },
        ));*/
      }
      debugPrint(responseMap.toString());
      setState(() {
        questionText= responseMap[0]['Question'];
        option1= responseMap[0]['Option1'];
        option1=option1.replaceAll("<p>", "");
        option1=option1.replaceAll("</p>", "");
        option1=option1.replaceAll("\\n", "");
        option2= responseMap[0]['Option2'];
        option2=option2.replaceAll("<p>", "");
        option2=option2.replaceAll("</p>", "");
        option2=option2.replaceAll("\\n", "");

        option3= responseMap[0]['Option3'];
        option3=option3.replaceAll("<p>", "");
        option3=option3.replaceAll("</p>", "");
        option3=option3.replaceAll("\\n", "");

        option4= responseMap[0]['Option4'];
        option4=option4.replaceAll("<p>", "");
        option4=option4.replaceAll("</p>", "");
        option4=option4.replaceAll("\\n", "");

        answer= responseMap[0]['Answer'];

      });

      //print(map['sliderImages']);

    } catch (e) {
      print(e);
    }
  }



  List imgList=global.sliderImages;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: DesignCourseAppTheme.nearlyWhite,
      child: Scaffold(
        /*drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: Wrap(
            // Important: Remove any padding from the ListView.

              children:<Widget>[Wrap(children:list,)]/* <Widget>[



              DrawerHeader(
                child: Text('Tez Laxmi', ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(
                title: Text('Admin'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: Text('Notifications'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: Text('Achievements'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: Text('Share'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },

              ),
              ListTile(
                title: Text('About Developer'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),

            ],*/
          ),
        ),*/
        appBar: AppBar(
          //  backgroundColor: Colors.white,
          /*leading: Padding(
            padding: EdgeInsets.only(left: 12),
            child: IconButton(
              icon: Icon(Icons.dehaze ),
              onPressed: () {
                print('Click leading');
              },
            ),
          ),*/
            leading: IconButton(icon:Icon(Icons.arrow_back),
              onPressed:() {
                Navigator.push<dynamic>(
                  context,
                  MaterialPageRoute<dynamic>(
                    builder: (BuildContext context) => DesignCourseHomeScreen(),
                  ),
                );
              },
            ),
          title: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children:<Widget>[
                Text(global.appName),
              ]
          ),
          /*
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                print('Click search');
              },
            ),
            IconButton(
              icon: Icon(Icons.star),
              onPressed: () {
                print('Click start');
              },
            ),
          ],
*/
        ),
        backgroundColor: Colors.transparent,
        body: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Card(
              borderOnForeground: true,
              child: Row(children: <Widget>[

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        padding: const EdgeInsets.all(10.0),
                        width:MediaQuery.of(context).size.width*1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.only(left:0.0,right:0.0),
                              width:MediaQuery.of(context).size.width*.95,
                              //child: Text("Maths and Reasoning",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20,)),
                              child: Html(data:(questionCount+1).toString()+" "+questionText),
                            ),


                          ],
                        )
                    ),
                    Container(
                        padding: const EdgeInsets.only(left:10.0,right:10),
                        width:MediaQuery.of(context).size.width*.8,
                        child: Row(
                          children: <Widget>[
                            Radio(
                              value: 1,
                              groupValue: selectedRadio,
                              activeColor: Colors.green,
                              onChanged: (val) {
                                print("Radio $val");
/*
                                setState(() {
                                  responseMap[questionCount]["selected"]=val;
                                  print("selected changed");
                                  abc=0;
                                  print("abc value changed");

                                });

                                setSelectedRadio(val);
*/
                              },
                            ),
                            Html(data:option1),
                          ],
                        )
                    ),
                    Container(
                        padding: const EdgeInsets.only(left:10.0,right:10),
                        width:MediaQuery.of(context).size.width*.8,
                        child: Row(
                          children: <Widget>[
                            Radio(value: 2,
                              groupValue: selectedRadio,
                              activeColor: Colors.green,
                              onChanged: (val) {
                                /*print("Radio $val");
                                setState(() {
                                  responseMap[questionCount]["selected"]=val;
                                  print("selected changed");
                                });

                                setSelectedRadio(val);

                                 */
                              },),
                            Html(data:option2),
                          ],
                        )
                    ),

                    Container(
                        padding: const EdgeInsets.only(left:10.0,right:10),
                        width:MediaQuery.of(context).size.width*.8,
                        child: Row(
                          children: <Widget>[
                            Radio(value: 3,
                              groupValue: selectedRadio,
                              activeColor: Colors.green,
                              onChanged: (val) {
                                /*print("Radio $val");
                                responseMap[questionCount]["selected"]=val;
                                setSelectedRadio(val);

                                 */
                              },),
                            Html(data:option3),
                          ],
                        )
                    ),
                    Container(
                        padding: const EdgeInsets.only(left:10.0,right:10),
                        width:MediaQuery.of(context).size.width*.8,
                        child: Row(
                          children: <Widget>[
                            Radio(value: 4,
                              groupValue: selectedRadio,
                              activeColor: Colors.green,
                              onChanged: (val) {
                              /*
                                print("Radio $val");
                                responseMap[questionCount]["selected"]=val;
                                setSelectedRadio(val);

                               */
                              },),
                            Html(data:option4),
                          ],
                        )
                    ),
                    SizedBox(height:20),
                    Container(padding: const EdgeInsets.only(left:10.0,right:10),
                        child:(responseMap[questionCount]["Answer"]=='option'+(responseMap[questionCount]["selected"]).toString())? Icon(Icons.check_circle,color: Colors.green,):(responseMap[questionCount]["selected"]==0)?Text("---",style: TextStyle(fontWeight: FontWeight.bold),):Icon(Icons.cancel,color:Colors.red))
                    ,SizedBox(height:20,width:40),
                    Container(padding: const EdgeInsets.only(left:10.0,right:10),child: Text("Right Answer: "+responseMap[questionCount]["Answer"],style:TextStyle(fontWeight: FontWeight.bold))),
                    SizedBox(height: 20,)
                    /*
                    Container(
                      padding: const EdgeInsets.only(left:10.0,right:10),
                      child:

                        Row(
                          children: <Widget>[
                            RaisedButton(child: Text("PREVIOUS",style: TextStyle(color: Colors.white)),color: Colors.blueAccent,onPressed: (){

                              if(questionCount!=0){
                                questionCount--;
                                if(responseMap[questionCount].containsKey("selected")){
                                  selectedRadio=responseMap[questionCount]["selected"];
                                }
                                else
                                selectedRadio=0;
                                setState(() {

                                  questionText= responseMap[questionCount]['Question'];
                                  option1= responseMap[questionCount]['Option1'];
                                  option1=option1.replaceAll("<p>", "");
                                  option1=option1.replaceAll("</p>", "");
                                  option1=option1.replaceAll("\\n", "");
                                  option2= responseMap[questionCount]['Option2'];
                                  option2=option2.replaceAll("<p>", "");
                                  option2=option2.replaceAll("</p>", "");
                                  option2=option2.replaceAll("\\n", "");
                                  option3= responseMap[questionCount]['Option3'];
                                  option3=option3.replaceAll("<p>", "");
                                  option3=option3.replaceAll("</p>", "");
                                  option3=option3.replaceAll("\\n", "");
                                  option4= responseMap[questionCount]['Option4'];
                                  option4=option4.replaceAll("<p>", "");
                                  option4=option4.replaceAll("</p>", "");
                                  option4=option4.replaceAll("\\n", "");
                                  answer= responseMap[questionCount]['Answer'];

                                });

                              }


                            },),
                            SizedBox(width:10),
                            RaisedButton(child: Text("NEXT",style: TextStyle(color: Colors.white),),color:Colors.blue,onPressed: (){
                              if(questionCount!=responseMap.length-1)
                                {
                                  if(responseMap[questionCount+1].containsKey("selected")){
                                    setState(() {
                                      selectedRadio=responseMap[questionCount+1]["selected"];
                                    });

                                  }
                                  else
                                    selectedRadio=0;

                                  questionCount++;

                                  setState(() {

                                    questionText= responseMap[questionCount]['Question'];
                                    option1= responseMap[questionCount]['Option1'];
                                    option1=option1.replaceAll("<p>", "");
                                    option1=option1.replaceAll("</p>", "");
                                    option1=option1.replaceAll("\\n", "");
                                    option2= responseMap[questionCount]['Option2'];
                                    option2=option2.replaceAll("<p>", "");
                                    option2=option2.replaceAll("</p>", "");
                                    option2=option2.replaceAll("\\n", "");
                                    option3= responseMap[questionCount]['Option3'];
                                    option3=option3.replaceAll("<p>", "");
                                    option3=option3.replaceAll("</p>", "");
                                    option3=option3.replaceAll("\\n", "");
                                    option4= responseMap[questionCount]['Option4'];
                                    option4=option4.replaceAll("<p>", "");
                                    option4=option4.replaceAll("</p>", "");
                                    option4=option4.replaceAll("\\n", "");
                                    answer= responseMap[questionCount]['Answer'];

                                  });

                                }


                            },),
                            SizedBox(width: 10,),
                            RaisedButton(child: Text("SUBMIT",style: TextStyle(color: Colors.white),),color:Colors.red,onPressed: (){



                            },),

                          ],
                        ),

                    ),*/

                  ],),

              ],),

            )

          ],),
        bottomNavigationBar:
        Container(
          padding: const EdgeInsets.only(left:10.0,right:10),
          child:

          Row(
            children: <Widget>[
              RaisedButton(child: Text("PREVIOUS",style: TextStyle(color: Colors.white)),color: Colors.blueAccent,onPressed: (){

                if(questionCount!=0){
                  questionCount--;
                  if(responseMap[questionCount].containsKey("selected")){
                    selectedRadio=responseMap[questionCount]["selected"];
                  }
                  else
                    selectedRadio=0;
                  setState(() {

                    questionText= responseMap[questionCount]['Question'];
                    option1= responseMap[questionCount]['Option1'];
                    option1=option1.replaceAll("<p>", "");
                    option1=option1.replaceAll("</p>", "");
                    option1=option1.replaceAll("\\n", "");
                    option2= responseMap[questionCount]['Option2'];
                    option2=option2.replaceAll("<p>", "");
                    option2=option2.replaceAll("</p>", "");
                    option2=option2.replaceAll("\\n", "");
                    option3= responseMap[questionCount]['Option3'];
                    option3=option3.replaceAll("<p>", "");
                    option3=option3.replaceAll("</p>", "");
                    option3=option3.replaceAll("\\n", "");
                    option4= responseMap[questionCount]['Option4'];
                    option4=option4.replaceAll("<p>", "");
                    option4=option4.replaceAll("</p>", "");
                    option4=option4.replaceAll("\\n", "");
                    answer= responseMap[questionCount]['Answer'];

                  });

                }


              },),
              SizedBox(width:10),
              RaisedButton(child: Text("NEXT",style: TextStyle(color: Colors.white),),color:Colors.blue,onPressed: (){
                if(questionCount!=responseMap.length-1)
                {
                  if(responseMap[questionCount+1].containsKey("selected")){
                    setState(() {
                      selectedRadio=responseMap[questionCount+1]["selected"];
                    });

                  }
                  else
                    selectedRadio=0;

                  questionCount++;

                  setState(() {

                    questionText= responseMap[questionCount]['Question'];
                    option1= responseMap[questionCount]['Option1'];
                    option1=option1.replaceAll("<p>", "");
                    option1=option1.replaceAll("</p>", "");
                    option1=option1.replaceAll("\\n", "");
                    option2= responseMap[questionCount]['Option2'];
                    option2=option2.replaceAll("<p>", "");
                    option2=option2.replaceAll("</p>", "");
                    option2=option2.replaceAll("\\n", "");
                    option3= responseMap[questionCount]['Option3'];
                    option3=option3.replaceAll("<p>", "");
                    option3=option3.replaceAll("</p>", "");
                    option3=option3.replaceAll("\\n", "");
                    option4= responseMap[questionCount]['Option4'];
                    option4=option4.replaceAll("<p>", "");
                    option4=option4.replaceAll("</p>", "");
                    option4=option4.replaceAll("\\n", "");
                    answer= responseMap[questionCount]['Answer'];

                  });

                }


              },),
              SizedBox(width: 10,),
             /* RaisedButton(child: Text("SUBMIT",style: TextStyle(color: Colors.white),),color:Colors.red,onPressed: (){



              },),
*/
            ],
          ),

        ),
        /*
        BottomNavigationBar(
          currentIndex: 0,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,// this will be set when a new tab is tapped
          items: [


            BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              title: new Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.assignment_ind),
              title: new Text('Card'),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.group),
              title: new Text('Batches'),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.ondemand_video ),
              title: new Text('Videos'),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.receipt ),
                title: Text('Notes')
            ),

          ],
        ) ,*/
      ),
    );
  }

  Widget getCategoryUI() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,

      children: <Widget>[
        const SizedBox(
          height: 32,
        ),

        Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 18, right: 16),
          child: Text(
            'Practice Sheets',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 22,
              letterSpacing: 0.27,
              color: DesignCourseAppTheme.darkerText,
            ),
          ),
        ),
        const SizedBox(
          height: 32,
        ),

        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Row(
                children: getBlueButtons(global.subjects)

              /*<Widget>[


                getButtonUI1('Basic'),
                const SizedBox(
                  width: 16,
                ),
            getButtonUI1('Coding'),
                const SizedBox(
                  width: 16,
                ),
                getButtonUI1('Advanced'),
                const SizedBox(
                  width: 16,
                ),
                getButtonUI1('Advanced'),
                const SizedBox(
                  width: 16,
                ),
                getButtonUI1('Advanced'),
              ],*/
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 18, right: 16),
          child: Text(
            'Videos',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 22,
              letterSpacing: 0.27,
              color: DesignCourseAppTheme.darkerText,
            ),
          ),
        ),
        /*const SizedBox(
          height: 16,
        ),*/
//        CategoryListView(
//          callBack: () {
//            moveTo();
//          },
//        ),
      ],
    );
  }

  List<Widget> getBlueButtons(var testCategories)
  {
    List<Widget> list = new List<Widget>();
    for(var i = 0; i < testCategories.length; i++){
      list.add(getButtonUI1(testCategories[i]));
      list.add(const SizedBox(
        width: 16,
      ));
    }
    return  list;
  }


  Widget getCategoryUI1() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 18, right: 16),
          child: Text(
            'Tests',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 22,
              letterSpacing: 0.27,
              color: DesignCourseAppTheme.darkerText,
            ),
          ),
        ),
        /*const SizedBox(
          height: 16,
        ),*/
        /* Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Row(
            children: <Widget>[
              getButtonUI(CategoryType.ui, categoryType == CategoryType.ui),
              const SizedBox(
                width: 16,
              ),
              getButtonUI(
                  CategoryType.coding, categoryType == CategoryType.coding),
              const SizedBox(
                width: 16,
              ),
              getButtonUI(
                  CategoryType.basic, categoryType == CategoryType.basic),
            ],
          ),
        ),*/
        /*const SizedBox(
          height: 16,
        ),*/
//        CategoryListView(
//          callBack: () {
//            moveTo();
//          },
//        ),
      ],
    );
  }

  Widget getPopularCourseUI() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 18, right: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Popular Course',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 22,
              letterSpacing: 0.27,
              color: DesignCourseAppTheme.darkerText,
            ),
          ),
          Flexible(
            child: PopularCourseListView(
              callBack: () {
                moveTo();
              },
            ),
          )
        ],
      ),
    );
  }

  void moveTo() {
    Navigator.push<dynamic>(
      context,
      MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => CourseInfoScreen(),
      ),
    );
  }

  Widget getButtonUI(CategoryType categoryTypeData, bool isSelected) {
    String txt = '';
    if (CategoryType.ui == categoryTypeData) {
      txt = 'Maths';
    } else if (CategoryType.coding == categoryTypeData) {
      txt = 'Coding';
    } else if (CategoryType.basic == categoryTypeData) {
      txt = 'C++';
    }
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: isSelected
                ? DesignCourseAppTheme.nearlyBlue
                : DesignCourseAppTheme.nearlyWhite,
            borderRadius: const BorderRadius.all(Radius.circular(24.0)),
            border: Border.all(color: DesignCourseAppTheme.nearlyBlue)),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Colors.white24,
            borderRadius: const BorderRadius.all(Radius.circular(24.0)),
            onTap: () {
              setState(() {
                categoryType = categoryTypeData;
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 12, bottom: 12, left: 18, right: 18),
              child: Center(
                child: Text(
                  txt,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    letterSpacing: 0.27,
                    color: isSelected
                        ? DesignCourseAppTheme.nearlyWhite
                        : DesignCourseAppTheme.nearlyBlue,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }


  Widget getButtonUI1(String txt) {

    return  Container(
      decoration: BoxDecoration(
          color: DesignCourseAppTheme.nearlyBlue,

          borderRadius: const BorderRadius.all(Radius.circular(24.0)),
          border: Border.all(color: DesignCourseAppTheme.nearlyBlue)),
      child:
      InkWell(
        splashColor: Colors.white24,
        borderRadius: const BorderRadius.all(Radius.circular(24.0)),
        onTap: () {

        },
        child: Padding(
          padding: const EdgeInsets.only(
              top: 12, bottom: 12, left: 18, right: 18),
          child: Center(
            child: Text(
              txt,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 12,
                letterSpacing: 0.27,
                color: DesignCourseAppTheme.nearlyWhite
                ,
              ),
            ),
          ),
        ),
      ),

    );

  }


  Widget getSearchBarUI() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 0.75,
            height: 64,
            child: Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: Container(
                decoration: BoxDecoration(
                  color: HexColor('#F8FAFB'),
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(13.0),
                    bottomLeft: Radius.circular(13.0),
                    topLeft: Radius.circular(13.0),
                    topRight: Radius.circular(13.0),
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: TextFormField(
                          style: TextStyle(
                            fontFamily: 'WorkSans',
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: DesignCourseAppTheme.nearlyBlue,
                          ),
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: 'Search for course',
                            border: InputBorder.none,
                            helperStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: HexColor('#B9BABC'),
                            ),
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              letterSpacing: 0.2,
                              color: HexColor('#B9BABC'),
                            ),
                          ),
                          onEditingComplete: () {},
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: Icon(Icons.search, color: HexColor('#B9BABC')),
                    )
                  ],
                ),
              ),
            ),
          ),
          const Expanded(
            child: SizedBox(),
          )
        ],
      ),
    );
  }

  Widget getAppBarUI() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 18, right: 18),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                /*
                Text(
                  'Laxan Institute',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    letterSpacing: 0.2,
                    color: DesignCourseAppTheme.grey,
                  ),
                ),*/
                Row(
                  children: <Widget>[
                    Icon(Icons.phone_forwarded),
                    SizedBox(width: 10,),
                    Text(
                      global.number,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        letterSpacing: 0.27,
                        color: DesignCourseAppTheme.darkerText,
                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),
          Container(
            width: 60,
            height: 60,
            child: Image.network(global.logo),
          )
        ],
      ),
    );
  }
}

enum CategoryType {
  ui,
  coding,
  basic,
}
