import 'package:best_flutter_ui_templates/design_course/about.dart';
import 'package:best_flutter_ui_templates/design_course/chapters.dart';
import 'package:best_flutter_ui_templates/design_course/notesCategory.dart';
import 'package:best_flutter_ui_templates/design_course/pdf.dart';
import 'package:best_flutter_ui_templates/design_course/videosCategory.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'category_list_view2.dart';
import 'htmlView.dart';
import 'test.dart';
import 'package:best_flutter_ui_templates/design_course/card.dart';
import 'package:best_flutter_ui_templates/design_course/category_list_view.dart';
import 'package:best_flutter_ui_templates/design_course/course_info_screen.dart';
import 'package:best_flutter_ui_templates/design_course/popular_course_list_view.dart';
import 'package:best_flutter_ui_templates/design_course/youtubeVideo.dart';
import 'package:best_flutter_ui_templates/main.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'category_list_view1.dart';
import 'design_course_app_theme.dart';
import 'globals.dart' as global;
import 'batches.dart';
import 'practiceSHeet.dart';
class DesignCourseHomeScreen extends StatefulWidget {
  @override
  _DesignCourseHomeScreenState createState() => _DesignCourseHomeScreenState();
}

class _DesignCourseHomeScreenState extends State<DesignCourseHomeScreen> {
  CategoryType categoryType = CategoryType.ui;
  YoutubePlayerController _controller;




  int _current = 0;


 /* List imgList = [
    'https://images.unsplash.com/photo-1502117859338-fd9daa518a9a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1554321586-92083ba0a115?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1536679545597-c2e5e1946495?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1543922596-b3bbaba80649?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1502943693086-33b5b1cfdf2f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=668&q=80'
  ];*/

  @override
  void initState() {

    super.initState();

    printStudentMobile();

    _controller = YoutubePlayerController(
      initialVideoId: 'iLnmTe5Q2Qw',
      flags: YoutubePlayerFlags(
        mute: false,
        autoPlay: false,
        forceHideAnnotation: true,
      ),
    );

  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Are you sure?'),
        content: new Text('Do you want to exit an App'),
        actions: <Widget>[
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: new Text('No'),
          ),
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: new Text('Yes'),
          ),
        ],
      ),
    )) ?? false;
  }
  
  
 List imgList=global.sliderImages;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Container(
        color: DesignCourseAppTheme.nearlyWhite,
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
                  Text(global.appName??''),
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
          body: Column(
            children: <Widget>[
              /*
              SizedBox(
                height: MediaQuery.of(context).padding.top,
              ),*/
              getAppBarUI(),
              SizedBox(
                height: 16,
              ),
              Expanded(
                child: SingleChildScrollView(

                  child: Container(
                    height: MediaQuery.of(context).size.height+350,
                    child: Column(
                      children: <Widget>[
                        CarouselSlider(
                          height: 200.0,
                          initialPage: 0,
                          enlargeCenterPage: true,
                          autoPlay: true,
                          reverse: false,
                          enableInfiniteScroll: true,
                          autoPlayInterval: Duration(seconds: 2),
                          autoPlayAnimationDuration: Duration(milliseconds: 2000),
                          pauseAutoPlayOnTouch: Duration(seconds: 10),
                          scrollDirection: Axis.horizontal,
                          onPageChanged: (index) {
                            setState(() {
                              _current = index;
                            });
                          },
                          items: imgList.map((imgUrl) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: EdgeInsets.symmetric(horizontal: 10.0),
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                  ),
                                  child: Image.network(
                                    imgUrl,
                                    fit: BoxFit.fill,
                                  ),
                                );
                              },
                            );
                          }).toList(),
                        ),
                       // getSearchBarUI(),

                        getCategoryUI(),
                        getCategoryUI1(),
                       /* Flexible(
                          child: getPopularCourseUI(),
                        ),*/
                      ],
                    ),
                  ),

                ),
              ),
            ],
          ),
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
      ),
    );
  }
  int _selectedIndex=0;
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
            'Complete Tests',
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
        CategoryListView1(


        ),
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 18, right: 16),
          child: Text(
            'Chapterwise Tests',
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
        CategoryListView2(

            callBack: () {

            }
        ),
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
        CategoryListView(
          _controller,
          callBack: () {
            //moveTo();
          },
        ),
      ],
    );
  }



  Widget getButtonUI(CategoryType categoryTypeData, bool isSelected) {
    String txt = '';
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


  Widget getButtonUI1(var txt) {

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
          navigateToList(txt['subjectId'],context);
        },
        child: Padding(
          padding: const EdgeInsets.only(
              top: 12, bottom: 12, left: 18, right: 18),
          child: Center(
            child: Text(
              txt['subjectName'].toString(),
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

                  InkWell(child: Icon(Icons.phone_forwarded,color: Colors.green,),
                  onTap: (){
                    launch("tel:"+global.number);
                  },
                  ),
                  SizedBox(width: 10,),
                  InkWell(
                    child: Text(
                      global.number,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        letterSpacing: 0.27,
                        color: DesignCourseAppTheme.darkerText,
                      ),
                    ),
                    onTap: (){
                      launch("tel:"+global.number);
                    },
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
var imageUrl="";
  void printStudentMobile() async{
    var prefs=await SharedPreferences.getInstance();
    var mobileOfStu=await prefs.getString("StudentMobileCheck")??'';


    setState(() {

      if(mobileOfStu.isNotEmpty)
        imageUrl="https://www.jeevandangwalior.com/HanuSir/image/${mobileOfStu.toString()}.jpg";
      else{
        imageUrl="assets/images/userImage.png";
      }
      print(imageUrl);
    });
    //var a=await SharedPreferences.getInstance();
    //print("o home"+a.get("StudentMobile"));

  }
}

void navigateToList(txt,context) async{
  Navigator.push(
    context,
    MaterialPageRoute<dynamic>(
      builder: (BuildContext context) => Chapters(txt),
    ),
  );



}

enum CategoryType {
  ui,
  coding,
  basic,
}
class MyText extends Text{

  MyText(String txt, String id) : super(txt);
}