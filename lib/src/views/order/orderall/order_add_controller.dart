import 'package:flutter/material.dart';
import 'package:pos_flutter/src/providers/color_app.dart';

class OrderAddController extends ChangeNotifier {
  Map<String, List<Map<String, dynamic>>> orderList = {};

  void generateOrderList() {
    final now = DateTime.now();

    orderList = {
      'โต๊ะ 1': [
        {'type': 1, 'timestamp': now.add(const Duration(minutes: 10)).millisecondsSinceEpoch}, // เวลา deadline

        {'qty': 1, 'status': true, 'name': 'ข้าวผัดหมู'},
        {'qty': 2, 'status': true, 'name': 'ข้าวกะเพราไก่ไข่ดาว'},
        {'qty': 1, 'status': true, 'name': 'ข้าวมันไก่'},
        {'qty': 3, 'status': true, 'name': 'ข้าวขาหมู'},
      ],
      'โต๊ะ 2': [
        {'type': 1, 'timestamp': now.add(const Duration(minutes: 20)).millisecondsSinceEpoch}, // เวลา deadline
        {'qty': 1, 'status': true, 'name': 'ข้าวมันไก่'},
        {'qty': 1, 'status': true, 'name': 'ข้าวไข่เจียวหมูสับ'},
      ],
      'โต๊ะ 3': [
        {'type': 1, 'timestamp': now.add(const Duration(minutes: 7)).millisecondsSinceEpoch}, // เวลา deadline
        {'qty': 2, 'status': true, 'name': 'ผัดซีอิ๊วหมู'},
        {'qty': 1, 'status': true, 'name': 'ข้าวหมูแดง'},
      ],
      'โต๊ะ 4': [
        {'type': 1, 'timestamp': now.add(const Duration(minutes: 15)).millisecondsSinceEpoch}, // เวลา deadline
        {'qty': 1, 'status': true, 'name': 'ข้าวผัดหมู'},
        {'qty': 2, 'status': true, 'name': 'ข้าวกะเพราไก่ไข่ดาว'},
        {'qty': 1, 'status': true, 'name': 'ข้าวมันไก่'},
        {'qty': 3, 'status': true, 'name': 'ข้าวขาหมู'},
      ],
      'โต๊ะ 5': [
        {'type': 1, 'timestamp': now.add(const Duration(minutes: 20)).millisecondsSinceEpoch}, // เวลา deadline
        {'qty': 1, 'status': true, 'name': 'ข้าวมันไก่'},
        {'qty': 1, 'status': true, 'name': 'ข้าวไข่เจียวหมูสับ'},
      ],
      'โต๊ะ 6': [
        {'type': 1, 'timestamp': now.add(const Duration(minutes: 13)).millisecondsSinceEpoch}, // เวลา deadline
        {'qty': 2, 'status': true, 'name': 'ผัดซีอิ๊วหมู'},
        {'qty': 1, 'status': true, 'name': 'ข้าวหมูแดง'},
      ],
      'โต๊ะ 7': [
        {'type': 1, 'timestamp': now.add(const Duration(minutes: 6)).millisecondsSinceEpoch}, // เวลา deadline
        {'qty': 1, 'status': true, 'name': 'ข้าวผัดหมู'},
        {'qty': 2, 'status': true, 'name': 'ข้าวกะเพราไก่ไข่ดาว'},
        {'qty': 1, 'status': true, 'name': 'ข้าวมันไก่'},
        {
          'qty': 3,
          'status': true,
          'name': 'ข้าวขาหมู',
        }, // ตัวอย่างสถานะที่เสร็จแล้ว
      ],
      'โต๊ะ 8': [
        {'type': 1, 'timestamp': now.add(const Duration(minutes: 9)).millisecondsSinceEpoch}, // เวลา deadline
        {'qty': 1, 'status': true, 'name': 'ข้าวมันไก่'},
        {'qty': 1, 'status': true, 'name': 'ข้าวไข่เจียวหมูสับ'},
      ],
      'โต๊ะ 9': [
        {'type': 1, 'timestamp': now.add(const Duration(minutes: 5)).millisecondsSinceEpoch}, // เวลา deadline
        {'qty': 2, 'status': true, 'name': 'ผัดซีอิ๊วหมู'},
        {'qty': 1, 'status': true, 'name': 'ข้าวหมูแดง'},
      ],
    };
    notifyListeners(); // หากคุณใช้ Consumer / Selector
  }

  Color getColorFromTimestamp(int timestamp) {
    final now = DateTime.now();
    final deadline = DateTime.fromMillisecondsSinceEpoch(timestamp);
    final remaining = deadline.difference(now);

    if (remaining.inMinutes <= 5) {
      return ColorApp.iconError;
    } else if (remaining.inMinutes <= 10) {
      return ColorApp.iconWarning;
    } else {
      return ColorApp.iconSuccess;
    }
  }

  String formatRemainingTime(int timestamp) {
    final now = DateTime.now();
    final deadline = DateTime.fromMillisecondsSinceEpoch(timestamp);
    final remaining = deadline.difference(now);

    if (remaining.inSeconds <= 0) return "หมดเวลา";

    final minutes = remaining.inMinutes;
    final seconds = remaining.inSeconds % 60;

    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }
}
