import 'package:flutter/material.dart';

class PageControllers extends ChangeNotifier {
  double itemHeight = 100;
  double itemWidth = 100;

  void updateSize(Size size) {
    final newHeight = (size.height - kToolbarHeight) / 1.6;
    final newWidth = size.width / 2;

    if (itemHeight != newHeight || itemWidth != newWidth) {
      itemHeight = newHeight;
      itemWidth = newWidth;
      notifyListeners();
    }
  }

  List<IconData> get iconsPage => [
        Icons.fastfood,
        Icons.list_alt,
        Icons.add_circle_outline,
        Icons.bar_chart,
      ];

  List<String> get namePage => [
        'สั่งอาหาร',
        'รายการสั่ง',
        'รายการเพิ่มเติม',
        'รายงานประจำวัน',
      ];

  List<String> pages = [
    '/home',
    '/order',
    '/iteamecategory',
    '/report',
  ];
}
