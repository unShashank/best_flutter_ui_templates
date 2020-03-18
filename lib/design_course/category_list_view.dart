import 'package:best_flutter_ui_templates/design_course/design_course_app_theme.dart';
import 'package:best_flutter_ui_templates/design_course/models/category.dart';
import 'package:best_flutter_ui_templates/main.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'globals.dart';

class CategoryListView extends StatefulWidget {

   final YoutubePlayerController controller;
  const CategoryListView(this.controller, {Key key, this.callBack}) : super(key: key);

  final Function callBack;
  @override
  _CategoryListViewState createState() => _CategoryListViewState(controller);
}

class _CategoryListViewState extends State<CategoryListView>
    with TickerProviderStateMixin {
  AnimationController animationController;
  YoutubePlayerController controller;
  _CategoryListViewState(this.controller);

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
setCategoryList();

    super.initState();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 16),
      child: Container(
        height: 134,
        width: double.infinity,
        child: FutureBuilder<bool>(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox();
            } else {
              return ListView.builder(
                padding: const EdgeInsets.only(
                    top: 0, bottom: 0, right: 16, left: 16),
                itemCount: Category.categoryList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  final int count = Category.categoryList.length > 10
                      ? 10
                      : Category.categoryList.length;
                  final Animation<double> animation =
                      Tween<double>(begin: 0.0, end: 1.0).animate(
                          CurvedAnimation(
                              parent: animationController,
                              curve: Interval((1 / count) * index, 1.0,
                                  curve: Curves.fastOutSlowIn)));
                  animationController.forward();

                  return CategoryView(
                    controller:this.controller,
                    category: Category.categoryList[index],
                    animation: animation,
                    animationController: animationController,
                    callback: () {
                      widget.callBack();
                    },
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }

  void setCategoryList() {
    Category.categoryList.clear();

    //List<YoutubePlayerController> controllers=new List<YoutubePlayerController>(100);

    for(var i=0;i<videos.length;i++){
      var regex = RegExp(r'.*\?v=(.+?)($|[\&])', caseSensitive: false, multiLine: false);
      var url = videos[i];

        var videoId = regex.firstMatch(url).group(1);
      controller = YoutubePlayerController(
        initialVideoId: videoId,
        flags: YoutubePlayerFlags(
          mute: false,
          autoPlay: false,
          forceHideAnnotation: true,
        ),
      );

      Category.categoryList.add( Category(
        videoController:controller,
        imagePath: videos[i],
        title: videoId,
        lessonCount: 24,
        money: 25,
        rating: 4.3,
      ));
      
    }
    
  }
}

class CategoryView extends StatelessWidget {
  final YoutubePlayerController controller;

  const CategoryView(
      {
        Key key,
        this.controller,
      this.category,
      this.animationController,
      this.animation,
      this.callback})
      : super(key: key);

  final VoidCallback callback;
  final Category category;
  final AnimationController animationController;
  final Animation<dynamic> animation;



  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
          opacity: animation,
          child: Transform(
            transform: Matrix4.translationValues(
                100 * (1.0 - animation.value), 0.0, 0.0),
            child: InkWell(
              splashColor: Colors.transparent,
              onTap: () {
                callback();
              },
              child: SizedBox(
                width: 280,
                child: Stack(
                  children: <Widget>[
                    Container(
                      child: Row(
                        children: <Widget>[
                          const SizedBox(
                            width: 48,
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: HexColor('#F8FAFB'),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(16.0)),
                              ),
                              height: 200,
                              child:YoutubePlayer(
                                controller: category.videoController,
                                showVideoProgressIndicator: true,

                                aspectRatio: 320,
                                onReady: () {
                                  print('Player is ready.');
                                },
                              )
                            ),
                          )
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
