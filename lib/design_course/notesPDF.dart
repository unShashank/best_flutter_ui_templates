import 'dart:convert';
import 'dart:io';

import 'package:admob_flutter/admob_flutter.dart';
import 'package:best_flutter_ui_templates/design_course/category_list_view.dart';
import 'package:best_flutter_ui_templates/design_course/course_info_screen.dart';
import 'package:best_flutter_ui_templates/design_course/pdf.dart';
import 'package:best_flutter_ui_templates/design_course/popular_course_list_view.dart';
import 'package:best_flutter_ui_templates/design_course/sheetQuestion.dart';
import 'package:best_flutter_ui_templates/design_course/videosCategory.dart';
import 'package:best_flutter_ui_templates/main.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdf_viewer/flutter_pdf_viewer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'batches.dart';
import 'card.dart';
import 'category_list_view1.dart';
import 'design_course_app_theme.dart';
import 'globals.dart' as global;
import 'home_design_course.dart';
import 'notesCategory.dart';
class NotesPDF extends StatefulWidget {
  var subjectId='',chapterId='';

  NotesPDF(chapterId,subjectId){
    this.subjectId=subjectId;
    this.chapterId=chapterId;
  }

  @override
  _NotesPDFState createState() => _NotesPDFState(subjectId,chapterId);
}




class _NotesPDFState extends State<NotesPDF> {
  CategoryType categoryType = CategoryType.ui;
  int _current = 0;
String subjectId='',chapterId='';

  bool clicked=false;
  _NotesPDFState(String subjectId,String chapterId){
    this.subjectId=subjectId;
    this.chapterId=chapterId;
  }





  /* List imgList = [
    'https://images.unsplash.com/photo-1502117859338-fd9daa518a9a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1554321586-92083ba0a115?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1536679545597-c2e5e1946495?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1543922596-b3bbaba80649?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1502943693086-33b5b1cfdf2f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=668&q=80'
  ];*/


  AdmobBannerSize bannerSize=AdmobBannerSize.FULL_BANNER;
  AdmobInterstitial interstitialAd;
  AdmobReward rewardAd;
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
  void showSnackBar(String content) {
    scaffoldState.currentState.showSnackBar(SnackBar(
      content: Text(content),
      duration: Duration(milliseconds: 1500),
    ));
  }

  void handleEvent(
      AdmobAdEvent event, Map<String, dynamic> args, String adType) {
    switch (event) {
      case AdmobAdEvent.loaded:
//        showSnackBar('New Admob $adType Ad loaded!');
        break;
      case AdmobAdEvent.opened:
//        showSnackBar('Admob $adType Ad opened!');
        break;
      case AdmobAdEvent.closed:
//        showSnackBar('Admob $adType Ad closed!');
        break;
      case AdmobAdEvent.failedToLoad:
//        showSnackBar('Admob $adType failed to load. :(');
        break;
      case AdmobAdEvent.rewarded:
        break;
      default:
    }
  }


  String getInterstitialAdUnitId() {
    if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/4411468910';
    } else if (Platform.isAndroid) {
      return global.admobIntertitialId2;
    }
    return null;
  }

  String getBannerAdUnitId() {
    if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/2934735716';
    } else if (Platform.isAndroid) {
      return global.admobBannerId2;
    }
    return null;
  }


  @override
  void initState() {


    super.initState();


    interstitialAd = AdmobInterstitial(
      adUnitId: getInterstitialAdUnitId(),
      listener: (AdmobAdEvent event, Map<String, dynamic> args) {
        if (event == AdmobAdEvent.closed) interstitialAd.load();
        handleEvent(event, args, 'Interstitial');
      },
    );

    interstitialAd.load();
   // getHttp();
  //  print("tempArray---------------------");
  //  print(tempArray);
  }
  var map;
var sortedArray=[],tempArray=new List();

  Future<List> getHttp() async {
    try {
      Response response = await Dio().get("https://www.jeevandangwalior.com/HanuSir/get_notes.php?subject_id="+subjectId+"&chapter_id="+chapterId);

      map = jsonDecode(response.toString());
     /*
      setState(() {
        map=map;
      });

      */
      print("tempArray length-------------------");

      print(map["test"][0]["pdf"]);
    } catch (e) {
      print(e);
    }
    return map["test"];
  }




  List imgList=global.sliderImages;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: DesignCourseAppTheme.nearlyWhite,
      child: Scaffold(

        appBar: AppBar(
          automaticallyImplyLeading: true,
          leading: IconButton(icon:Icon(Icons.arrow_back),
            onPressed:() => Navigator.pop(context, false),
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
        body:

        FutureBuilder(
          future: getHttp(),

            builder: (context, projectSnap) {
              if (projectSnap.hasData) {
                if (projectSnap.data.length > 0) {
                  return ListView.builder(
                    itemCount: projectSnap.data.length,
                    itemBuilder: (context, index) {
                      var chapter = projectSnap.data[index];
                      return Column(
                        children: <Widget>[

                          InkWell(
                            child: Card(
                              borderOnForeground: true,
                              child: Row(children: <Widget>[
                                Image.asset("assets/images/pdf.png"),
                                SizedBox(width: 20,),
                                Text(chapter["notes_name"]),
                              ],),


                            ),
                            onTap: () async {

                              if(clicked)
                              {
                                Navigator.push<dynamic>(
                                  context,
                                  MaterialPageRoute<dynamic>(
                                    builder: (BuildContext context) => PDFViewer(chapter["status"],chapter["pdf"]),
                                  ),
                                );

                              }
                              else
                              if (await interstitialAd.isLoaded) {
                                Navigator.push<dynamic>(
                                  context,
                                  MaterialPageRoute<dynamic>(
                                    builder: (BuildContext context) => PDFViewer(chapter["status"],chapter["pdf"]),
                                  ),
                                );
                                clicked=true;

                                interstitialAd.show();
                              } else {
                                Navigator.push<dynamic>(
                                  context,
                                  MaterialPageRoute<dynamic>(
                                    builder: (BuildContext context) => PDFViewer(chapter["status"],chapter["pdf"]),
                                  ),
                                );
                              }



                            },
                          ),
                          // Widget to display the list of project
                        ],
                      );
                    },
                  );
                }
              }
              return new Center( child: CircularProgressIndicator());
            }



        ),
        /*
        ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Card(
              borderOnForeground: true,
              child: Row(children: <Widget>[
                Image.asset("assets/images/1.png"),
                Text("Hello World")
              ],),
            )

        ],),

         */
        bottomNavigationBar: Container(
          margin: EdgeInsets.only(bottom: 0.0),
          child: AdmobBanner(
            adUnitId: getBannerAdUnitId(),
            adSize: bannerSize,
            listener:
                (AdmobAdEvent event, Map<String, dynamic> args) {
              handleEvent(event, args, 'Banner');
            },
          ),
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


  var option = 0;
  var mode = 2;

  Future<void> onPressed(url) async {
    String prefix = option == 10 ? "xor_" : "";

    final videoSrc = "assets/${prefix}buck_bunny.mp4";
    final pdfSrc = url;
    final key = option == 10 ? "test" : null;
    mode = 2;
    var videoPages;
    switch (mode) {
      case 0:
        videoPages = [
          VideoPage.fromAsset(8, videoSrc, xorDecryptKey: key),
          VideoPage.fromAsset(9, videoSrc, xorDecryptKey: key),
        ];
        break;
      case 1:
        final file = await assetToFile(videoSrc);
        videoPages = [
          VideoPage.fromFile(8, file, xorDecryptKey: key),
          VideoPage.fromFile(9, file, xorDecryptKey: key),
        ];
        break;
      case 2:
        break;
    }

    final config = PdfViewerConfig(
      nightMode: option == 1,
      enableSwipe: option != 2,
      swipeHorizontal: option == 3,
      autoSpacing: option == 4,
      pageFling: option == 5,
      pageSnap: option == 6,
      enableImmersive: option == 7,
      autoPlay: option == 8,
      forceLandscape: option == 11,
      slideShow: option == 9,
      videoPages: videoPages,
      xorDecryptKey: key,
      initialPage: null,
      atExit: (pageIndex) {
        print(">> atExit($pageIndex)");
      },
    );

    switch (mode) {
      case 0:
        await PdfViewer.loadAsset(pdfSrc, config: config);
        break;
      case 1:
        await PdfViewer.loadFile(await assetToFile(pdfSrc), config: config);
        break;
      case 2:
        await PdfViewer.loadBytes(await assetToBytes(pdfSrc), config: config);
        break;
    }
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
