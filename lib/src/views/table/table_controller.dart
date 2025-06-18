import 'package:flutter/material.dart';

class TableController extends ChangeNotifier {
  double itemHeight = 100;
  double itemWidth = 100;

  void updateSize(Size size) {
    final newHeight = (size.height - kToolbarHeight) / 1.6;
    final newWidth = size.width / 2;

    // ตรวจสอบก่อนเรียก notifyListeners เพื่อไม่ให้ loop
    if (itemHeight != newHeight || itemWidth != newWidth) {
      itemHeight = newHeight;
      itemWidth = newWidth;
      notifyListeners();
    }
  }

  DateTime get _time => DateTime.now();
  String get formattedTime => '${_time.hour}:${_time.minute}';
}
