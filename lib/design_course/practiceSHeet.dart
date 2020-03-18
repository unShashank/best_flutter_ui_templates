import 'package:best_flutter_ui_templates/design_course/category_list_view.dart';
import 'package:best_flutter_ui_templates/design_course/course_info_screen.dart';
import 'package:best_flutter_ui_templates/design_course/popular_course_list_view.dart';
import 'package:best_flutter_ui_templates/design_course/videosCategory.dart';
import 'package:best_flutter_ui_templates/main.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'batches.dart';
import 'card.dart';
import 'category_list_view1.dart';
import 'design_course_app_theme.dart';
import 'globals.dart' as global;
import 'package:flutter_html/flutter_html.dart';

import 'home_design_course.dart';
import 'notesCategory.dart';
//import 'package:flutter_youtube/flutter_youtube.dart';
//import 'package:html/dom.dart' as dom;
class PracticeSheet extends StatefulWidget {
  @override
  _PracticeSheetState createState() => _PracticeSheetState();
}

class _PracticeSheetState extends State<PracticeSheet> {
  CategoryType categoryType = CategoryType.ui;
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
  }
  List imgList=global.sliderImages;
  @override
  Widget build(BuildContext context) {
    return Container(
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
                              child: Html(data:""" 
                              
                              1. \u092f\u0926\u093f<\/span> \u090f\u0915<\/span> \u0926\u0941\u0915\u093e\u0928<\/span> \u0916\u093f\u0932\u094c\u0928\u0947<\/span> \u092a\u0930<\/span> 20 \u092a\u094d\u0930\u0924\u093f\u0936\u0924<\/span> \u0915\u0940<\/span> \u091b\u0942\u091f<\/span> \u0926\u0947\u0928\u093e<\/span> \u091a\u093e\u0939\u093f\u0924\u093e<\/span> \u0939\u0948<\/span>, \u0924\u094b<\/span> \u0909\u0938\u0947<\/span> \u0935\u0939<\/span> \u0930\u0942\u092a\u092f\u0947<\/span> 300 \u092e\u0947\u0902<\/span> \u092c\u0947\u091a\u0928\u093e<\/span> \u092a\u0921\u0947\u0917\u093e\u0964<\/span> \u092f\u0926\u093f<\/span> \u0935\u0939<\/span> \u0909\u0938\u0947<\/span> \u0930\u0942\u092a\u092f\u0947<\/span> 405 \u092e\u0947\u0902<\/span> \u092c\u0947\u091a\u0924\u093e<\/span> \u0939\u0948<\/span>, \u0924\u094b<\/span> \u0907\u0938\u0915\u0947<\/span> \u0932\u093e\u092d<\/span> \u0915\u093e<\/span> \u092a\u094d\u0930\u0924\u093f\u0936\u0924<\/span> \u0915\u093f\u0924\u0928\u093e<\/span> \u0939\u094b\u0917\u093e<\/span>?      <\/span><\/span>\n\nIf a shopkeeper wants to give 20% discount on a toy, he has to sell it for Rs. 300. If he sells it at Rs. 405, then his gain percent is<\/span><\/span>\n
                              
                              
                               """),
                            ),


                          ],
                        )
                    ),
                    Container(
                        padding: const EdgeInsets.only(left:10.0,right:10),
                        width:MediaQuery.of(context).size.width*.8,
                        child: Html(data:"""
                        
                        A. 5%<\/span><\/span><\/p>
                        
                        """)
                    ),
                    Container(
                        padding: const EdgeInsets.only(left:10.0,right:10),
                        width:MediaQuery.of(context).size.width*.8,
                        child: Html(data:"""
                        
                        B. 6%<\/span><\/span><\/p>
                        
                        """)
                    ),

                    Container(
                        padding: const EdgeInsets.only(left:10.0,right:10),
                        width:MediaQuery.of(context).size.width*.8,
                        child: Html(data:"""
                        
                        C. 6%<\/span><\/span><\/p>
                        
                        """)
                    ),
                    Container(
                        padding: const EdgeInsets.only(left:10.0,right:10),
                        width:MediaQuery.of(context).size.width*.8,
                        child: Html(data:"""
                        
                        D. 6%<\/span><\/span><\/p>
                        
                        """)
                    ),
                    SizedBox(height:20),
                    Container(
                      padding: const EdgeInsets.only(left:10.0,right:10),
                      child:

                        RaisedButton(child: Text("Answer",style: TextStyle(color: Colors.black),),onPressed: (){
                          print('pressed');

                        },),

                    )
                  ],),

              ],),

            )

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
