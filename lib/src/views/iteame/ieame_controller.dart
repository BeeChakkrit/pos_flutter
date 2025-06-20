import 'package:flutter/material.dart';

class IeameController extends ChangeNotifier {
  bool openIteam = true;

  void toggleIteam() {
    openIteam = !openIteam;

    print(openIteam);
    notifyListeners();
  }

  final List<Map<String, dynamic>> items = [
    {
      'id': '001',
      'name': 'ข้าวผัด',
      'category': 'อาหาร',
      'price': 50,
      'quantity': 2,
    },
    {
      'id': '002',
      'name': 'ชาเย็น',
      'category': 'เครื่องดื่ม',
      'price': 25,
      'quantity': 1,
    },
    {
      'id': '003',
      'name': 'ไก่ทอด',
      'category': 'อาหาร',
      'price': 60,
      'quantity': 3,
    },
    {
      'id': '004',
      'name': 'ส้มตำ',
      'category': 'อาหาร',
      'price': 40,
      'quantity': 4,
    },
    {
      'id': '005',
      'name': 'น้ำเปล่า',
      'category': 'เครื่องดื่ม',
      'price': 10,
      'quantity': 5,
    },
  ];

  List<Map<String, dynamic>> get filteredItems {
    return items.where((item) => item['quantity'] > 0).toList();
  }
}
