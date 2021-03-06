import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Category1 {
  Category1({
    this.videoController,
    this.title = '',
    this.imagePath = '',
    this.lessonCount = 0,
    this.money = 0,
    this.rating = 0.0,

  });

  String title;
  YoutubePlayerController videoController;
  int lessonCount;
  int money;
  double rating;
  String imagePath;
  static List<Category1> categoryList=<Category1>[];
  /*

  static List<Category1> categoryList = <Category1>[
    Category1(
      imagePath: 'assets/design_course/interFace1.png',
      title: 'Pythagoras Theorem',
      lessonCount: 24,
      money: 25,
      rating: 4.3,
    ),
    Category1(
      imagePath: 'assets/design_course/interFace2.png',
      title: 'Trignometry Explaines',
      lessonCount: 22,
      money: 18,
      rating: 4.6,
    ),
    Category1(
      imagePath: 'assets/design_course/interFace1.png',
      title: 'Reasoning Simplified',
      lessonCount: 24,
      money: 25,
      rating: 4.3,
    ),
    Category1(
      imagePath: 'assets/design_course/interFace2.png',
      title: 'C++',
      lessonCount: 22,
      money: 18,
      rating: 4.6,
    ),
  ];


   */
  static List<Category1> popularCourseList = <Category1>[
    Category1(
      imagePath: 'assets/design_course/interFace3.png',
      title: 'App Design Course',
      lessonCount: 12,
      money: 25,
      rating: 4.8,
    ),
    Category1(
      imagePath: 'assets/design_course/interFace4.png',
      title: 'Web Design Course',
      lessonCount: 28,
      money: 208,
      rating: 4.9,
    ),
    Category1(
      imagePath: 'assets/design_course/interFace3.png',
      title: 'App Design Course',
      lessonCount: 12,
      money: 25,
      rating: 4.8,
    ),
    Category1(
      imagePath: 'assets/design_course/interFace4.png',
      title: 'Web Design Course',
      lessonCount: 28,
      money: 208,
      rating: 4.9,
    ),
  ];
}
