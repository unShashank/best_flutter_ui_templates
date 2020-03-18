import 'dart:convert';

import 'package:best_flutter_ui_templates/design_course/category_list_view.dart';
import 'package:best_flutter_ui_templates/design_course/course_info_screen.dart';
import 'package:best_flutter_ui_templates/design_course/popular_course_list_view.dart';
import 'package:best_flutter_ui_templates/design_course/videosCategory.dart';
import 'package:best_flutter_ui_templates/main.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'about.dart';
import 'batches.dart';
import 'category_list_view1.dart';
import 'design_course_app_theme.dart';
import 'globals.dart' as global;
import 'home_design_course.dart';
import 'notesCategory.dart';
class MyCard extends StatefulWidget {
  @override
  _MyCardState createState() => _MyCardState();
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}

class _MyCardState extends State<MyCard> {
  CategoryType categoryType = CategoryType.ui;
  int _current = 0;
  /* List imgList = [
    'https://images.unsplash.com/photo-1502117859338-fd9daa518a9a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1554321586-92083ba0a115?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1536679545597-c2e5e1946495?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1543922596-b3bbaba80649?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1502943693086-33b5b1cfdf2f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=668&q=80'
  ];*/
var name=TextEditingController();
var fatherName=TextEditingController();
var subject=TextEditingController();
var feesDeposite=TextEditingController();
var date=TextEditingController();
var nextDate=TextEditingController();
var feesStatus=TextEditingController();
var admissionDate=TextEditingController();
var cardValidity=TextEditingController();
var mobile=TextEditingController();
var batchTime=TextEditingController();
var breakDate=TextEditingController();
var education=TextEditingController();
var email=TextEditingController();

  String imageUrl="";


  @override
  void initState() {

    super.initState();
    name.text='';
    fatherName.text='';
    subject.text='';
    feesDeposite.text='';
    date.text='';
    nextDate.text='';
    feesStatus.text='';
    admissionDate.text='';
    cardValidity.text='';
    mobile.text='';
    batchTime.text='';
    breakDate.text='';
    education.text='';
    email.text='';

    getHttp();

   }
   var cardBackground=DesignCourseAppTheme.nearlyWhite;

   void getHttp()async{


     var prefs=SharedPreferences.getInstance().then((prefs)async{
       var studentMobile=prefs.get("StudentMobile")??'';


       var teacherMobile=prefs.get("Mobile")??'';
       print("https://www.jeevandangwalior.com/HanuSir/getStudentDetails.php?studentMobile=${studentMobile}&teacherMobile=${teacherMobile}");
       Response response = await Dio().get("https://www.jeevandangwalior.com/HanuSir/getStudentDetails.php?studentMobile=${studentMobile}&teacherMobile=${teacherMobile}");

       var map= await jsonDecode(response.toString());
       print("------------------Card------------------");
       print(map);
       var validity=map[0]["Valid"].toString();
       var validityDifference=-1;
       var mobileOfStu=await prefs.getString("StudentMobileCheck")??'';
       
       
       setState(() {

         if(mobileOfStu.isNotEmpty)
         imageUrl="https://www.jeevandangwalior.com/HanuSir/image/${mobileOfStu.toString()}.jpg";
         else{
           imageUrl="assets/images/userImage.png";
         }
         print(imageUrl);
       });


       if(validity!="0"){
         var validityDate = new DateTime(int.parse(validity.split('/')[2]), int.parse(validity.split('/')[1]), int.parse(validity.split('/')[0]));
         var currentDate= DateTime.now();
         currentDate=new DateTime(currentDate.year,currentDate.month,currentDate.day);
         validityDifference = validityDate.difference(currentDate).inDays;

         print(validityDate.toString());
         print(currentDate.toString());

         print(validityDifference);


       }
       else{
         name.text=map[0]["Name"]==null?'':map[0]["Name"].toString();
         fatherName.text=map[0]["FatherName"]==null?'':map[0]["FatherName"].toString();
         subject.text=map[0]["Subject"]==null?'':map[0]["Subject"].toString();
         // feesDeposite.text=map[0]["Fees"]==null?'':map[0]["Fees"].toString();
         //  date.text=map[0]["FeesDate"]==null?'':map[0]["FeesDate"].toString();
         //  nextDate.text=map[0]["FeesNextDate"]==null?'':map[0]["FeesNextDate"].toString();
         //  feesStatus.text=map[0]["FeesStatus"]==null?'':map[0]["FeesStatus"].toString();
         //  admissionDate.text=map[0]["BreakDate"]==null?'':map[0]["BreakDate"].toString();
         //  cardValidity.text=map[0]["Valid"]==null?'':map[0]["Valid"].toString();
         mobile.text=map[0]["Mobile"]==null?'':map[0]["Mobile"].toString();
         batchTime.text=map[0]["BatchTime"]==null?'':map[0]["BatchTime"].toString();
         //  breakDate.text=map[0]["BreakDate"]==null?'':map[0]["BreakDate"].toString();
         education.text=map[0]["Class"]==null?'':map[0]["Class"].toString();
         email.text=map[0]["Email"]==null?'':map[0]["Email"].toString();

       }

       if(validityDifference>0)
       {

         name.text=map[0]["Name"]==null?'':map[0]["Name"].toString();
         fatherName.text=map[0]["FatherName"]==null?'':map[0]["FatherName"].toString();
         subject.text=map[0]["Subject"]==null?'':map[0]["Subject"].toString();
         feesDeposite.text=map[0]["Fees"]==null?'':map[0]["Fees"].toString();
         date.text=map[0]["FeesDate"]==null?'':map[0]["FeesDate"].toString();
         nextDate.text=map[0]["FeesNextDate"]==null?'':map[0]["FeesNextDate"].toString();
         feesStatus.text=map[0]["FeesStatus"]==null?'':map[0]["FeesStatus"].toString();
         admissionDate.text=map[0]["BreakDate"]==null?'':map[0]["BreakDate"].toString();
         cardValidity.text=map[0]["Valid"]==null?'':map[0]["Valid"].toString();
         mobile.text=map[0]["Mobile"]==null?'':map[0]["Mobile"].toString();
         batchTime.text=map[0]["BatchTime"]==null?'':map[0]["BatchTime"].toString();
         breakDate.text=map[0]["BreakDate"]==null?'':map[0]["BreakDate"].toString();
         education.text=map[0]["Class"]==null?'':map[0]["Class"].toString();
         email.text=map[0]["Email"]==null?'':map[0]["Email"].toString();

         //var prefs=await SharedPreferences.getInstance();
         String remainingFees=prefs.getString("RemainingFees")??"-1";


         if(feesStatus.text=='complete'){
           setState(() {
             cardBackground=Colors.lightGreen;
           });

         }

         if(nextDate.text.isNotEmpty)
         {
           var next = new DateTime(int.parse(nextDate.text.split('/')[2]), int.parse(nextDate.text.split('/')[1]), int.parse(nextDate.text.split('/')[0]));
           var currentDate= DateTime.now();
           currentDate=new DateTime(currentDate.year,currentDate.month,currentDate.day);
           var difference = next.difference(currentDate).inDays;
           //print(difference.toString());
           // print(next.toString());
           // print(currentDate.toString());

           print(difference.toString());
           if(remainingFees!='0'){
             if(difference<=0){
               setState(() {
                 cardBackground=Colors.redAccent;
               });

             }
           }

         }
       }


     });




   }

  List imgList=global.sliderImages;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: cardBackground,

      child: Scaffold(

        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child:

                Column(
                  children: <Widget>[
                    new Row(
                      children: <Widget>[
                        new Flexible(
                          child: Column(
                            children: <Widget>[
                              Container(
                                height: 100,
                                width: 100,
                                child: CircleAvatar(
                                  radius: 30.0,
                                  backgroundImage:
                                  NetworkImage(imageUrl),
                                  backgroundColor: Colors.transparent,
                                ),
                              ),

                            ],
                          ),
                        ),
                        SizedBox(width:10),
                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start
                          ,

                          children:<Widget>[Container(
                              width: 160,
                              child: Text(global.studentName.toUpperCase(),style: TextStyle(fontSize: 14.0,fontWeight: FontWeight.bold,color: Colors.white,),)),
                            Text(global.stuMobile.toUpperCase(),style: TextStyle(fontSize: 13.0,color: Colors.yellow),)

                          ],)


                      ],
                    ),
                    SizedBox(height: 10,),
                    Text(global.studentEmail,style: TextStyle(color: Colors.white),)
                  ],
                )

                /*ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      imageUrl,
                      height: 100.0,
                      width: 100.0,
                    ),
                  )*/,
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              /*
                ListTile(
                  title: Text('Job Alert'),
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
                ),*/
              ListTile(
                title: Row(
                  children: <Widget>[
                    Icon(Icons.share),
                    SizedBox(width: 15,),
                    Text('Share'),

                  ],
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Share.share("Hello");

                },

              ),
              ListTile(
                title: Row(
                  children: <Widget>[
                    Icon(Icons.person),
                    SizedBox(width: 15,),
                    Text('About Developer'),

                  ],
                ),
                onTap: () {
                  Navigator.of(context).pop();

                  Navigator.push(
                    context,
                    MaterialPageRoute<dynamic>(
                      builder: (BuildContext context) => About(),
                    ),
                  );
                  // Update th
                  // e state of the app.
                  // ...
                },
              ),

            ],
          ),
        ),
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
          padding: EdgeInsets.all(6),
          children: <Widget>[

            Column(
              children: <Widget>[
                new Row(
                  children: <Widget>[
                    new Flexible(
                      child: Column(
                        children: <Widget>[
                          new TextField(style: TextStyle(fontWeight: FontWeight.bold),
                            enableInteractiveSelection: false, // will disable paste operation
                            focusNode: new AlwaysDisabledFocusNode(),
        decoration: const InputDecoration(labelText: "Name", hintText: ""),
        autocorrect: false,
        controller: name,
        onChanged: (String value) {
          //firstName = value;
        },

                          ),
                          new TextField(style: TextStyle(fontWeight: FontWeight.bold),
                            decoration: const InputDecoration(labelText: "Father's Name", hintText: ""),
                            enableInteractiveSelection: false, // will disable paste operation
                            focusNode: new AlwaysDisabledFocusNode(),
                            autocorrect: false,
                            controller: fatherName,
                            onChanged: (String value) {
                              //firstName = value;
                            },

                          ),
                          new TextField(style: TextStyle(fontWeight: FontWeight.bold),
                            decoration: const InputDecoration(labelText: "Subject", hintText: ""),
                            autocorrect: false,
                            enableInteractiveSelection: false, // will disable paste operation
                            focusNode: new AlwaysDisabledFocusNode(),
                            controller: subject,
                            onChanged: (String value) {
                              //firstName = value;
                            },

                          ),
                        ],
                      ),
                    ),

                    new Flexible(
                      child: Card(child:Image.network(imageUrl,height: 200,alignment: Alignment.topRight,) ,)
                    ),

                  ],
                ),
              ],
            ),

            Column(children: <Widget>[
              Row(children: <Widget>[
                Flexible(child: TextField(style: TextStyle(fontWeight: FontWeight.bold),
    decoration: const InputDecoration(labelText: "Fees Deposite", hintText: ""),
    autocorrect: false,
                  enableInteractiveSelection: false, // will disable paste operation
                  focusNode: new AlwaysDisabledFocusNode(),
    controller: feesDeposite,
    onChanged: (String value) {
    //firstName = value;
    },)),
                Flexible(child: TextField(style: TextStyle(fontWeight: FontWeight.bold),
                  decoration: const InputDecoration(labelText: "Date", hintText: ""),
                  autocorrect: false,
                  enableInteractiveSelection: false, // will disable paste operation
                  focusNode: new AlwaysDisabledFocusNode(),
                  controller: date,
                  onChanged: (String value) {
                    //firstName = value;
                  },))
              ],)
            ],),
            Column(children: <Widget>[
              Row(children: <Widget>[
                Flexible(child: TextField(style: TextStyle(fontWeight: FontWeight.bold),
                  decoration: const InputDecoration(labelText: "Next Date", hintText: ""),
                  autocorrect: false,
                  enableInteractiveSelection: false, // will disable paste operation
                  focusNode: new AlwaysDisabledFocusNode(),
                  controller: nextDate,
                  onChanged: (String value) {
                    //firstName = value;
                  },)),
                Flexible(child: TextField(style: TextStyle(fontWeight: FontWeight.bold),
                  decoration: const InputDecoration(labelText: "Fees Status", hintText: ""),
                  autocorrect: false,
                  enableInteractiveSelection: false, // will disable paste operation
                  focusNode: new AlwaysDisabledFocusNode(),
                  controller: feesStatus,
                  onChanged: (String value) {
                    //firstName = value;
                  },))
              ],)
            ],)
,   Column(children: <Widget>[
              Row(children: <Widget>[
                Flexible(child: TextField(style: TextStyle(fontWeight: FontWeight.bold),
                  decoration: const InputDecoration(labelText: "Admission Date", hintText: ""),
                  autocorrect: false,
                  enableInteractiveSelection: false, // will disable paste operation
                  focusNode: new AlwaysDisabledFocusNode(),
                  controller: admissionDate,
                  onChanged: (String value) {
                    //firstName = value;
                  },)),
                Flexible(child: TextField(style: TextStyle(fontWeight: FontWeight.bold),
                  decoration: const InputDecoration(labelText: "Card Validity", hintText: ""),
                  autocorrect: false,
                  enableInteractiveSelection: false, // will disable paste operation
                  focusNode: new AlwaysDisabledFocusNode(),
                  controller: cardValidity,
                  onChanged: (String value) {
                    //firstName = value;
                  },))
              ],)
            ],)
,   Column(children: <Widget>[
              Row(children: <Widget>[
                Flexible(child: TextField(style: TextStyle(fontWeight: FontWeight.bold),
                  decoration: const InputDecoration(labelText: "Mobile", hintText: ""),
                  autocorrect: false,
                  enableInteractiveSelection: false, // will disable paste operation
                  focusNode: new AlwaysDisabledFocusNode(),
                  controller: mobile,
                  onChanged: (String value) {
                    //firstName = value;
                  },)),
                Flexible(child: TextField(style: TextStyle(fontWeight: FontWeight.bold),
                  decoration: const InputDecoration(labelText: "Batch Time", hintText: ""),
                  autocorrect: false,
                  enableInteractiveSelection: false, // will disable paste operation
                  focusNode: new AlwaysDisabledFocusNode(),
                  controller: batchTime,
                  onChanged: (String value) {
                    //firstName = value;
                  },))
              ],)
            ],)
,   Column(children: <Widget>[
              Row(children: <Widget>[
                Flexible(child: TextField(style: TextStyle(fontWeight: FontWeight.bold),
                  decoration: const InputDecoration(labelText: "Break Date", hintText: ""),
                  autocorrect: false,
                  controller: breakDate,
                  enableInteractiveSelection: false, // will disable paste operation
                  focusNode: new AlwaysDisabledFocusNode(),
                  onChanged: (String value) {
                    //firstName = value;
                  },)),
                Flexible(child: TextField(style: TextStyle(fontWeight: FontWeight.bold),
                  decoration: const InputDecoration(labelText: "Education", hintText: ""),
                  autocorrect: false,
                  controller: education,
                  enableInteractiveSelection: false, // will disable paste operation
                  focusNode: new AlwaysDisabledFocusNode(),
                  onChanged: (String value) {
                    //firstName = value;
                  },))
              ],)
            ],)
,   Column(children: <Widget>[
              Row(children: <Widget>[
                Flexible(child: TextField(style: TextStyle(fontWeight: FontWeight.bold),
                  decoration: const InputDecoration(labelText: "Email", hintText: ""),
                  autocorrect: false,
                  controller: email,
                  enableInteractiveSelection: false, // will disable paste operation
                  focusNode: new AlwaysDisabledFocusNode(),
                  onChanged: (String value) {
                    //firstName = value;
                  },)),

              ],)
            ],)


            /* Card(
              borderOnForeground: true,
              child: Row(children: <Widget>[
                Image.asset("assets/images/1.png"),
                Text("Hello World")
              ],),
            )*/

          ],),
        bottomNavigationBar: BottomNavigationBar(

          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          onTap: _onItemTapped,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,// this will be set when a new tab is tapped
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              title: new Text('Home'),
            ),
            BottomNavigationBarItem(
                icon: InkWell(child:new Icon(Icons.assignment_ind) ,
                    onTap:(){

                      print("tapped");
                      Navigator.push(
                        context,
                        MaterialPageRoute<dynamic>(
                          builder: (BuildContext context) => MyCard(),
                        ),
                      );

                    }
                ),
                title: new Text('Card')

            ),
            BottomNavigationBarItem(
                icon: new Icon(Icons.group) ,

                title: new Text('Batches')

            ),

            BottomNavigationBarItem(
                icon: new Icon(Icons.ondemand_video) ,

                title: new Text('Videos')

            ),
            BottomNavigationBarItem(
                icon: new Icon(Icons.receipt),
                title: new Text('Notes')

            ),

          ],
        ) ,
      ),
    );
  }
  int _selectedIndex=1;
  void _onItemTapped(int index) {
    switch(index){
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute<dynamic>(
            builder: (BuildContext context) => DesignCourseHomeScreen(),
          ),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute<dynamic>(
            builder: (BuildContext context) => MyCard(),
          ),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute<dynamic>(
            builder: (BuildContext context) => BatchesListView(),
          ),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute<dynamic>(
            builder: (BuildContext context) => VideoCategory(),
          ),
        );
        break;
      case 4:
        Navigator.push(
          context,
          MaterialPageRoute<dynamic>(
            builder: (BuildContext context) => NotesCategory(),
          ),
        );

        break;
    }
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
