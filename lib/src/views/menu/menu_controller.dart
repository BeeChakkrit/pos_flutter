import 'dart:async';

import 'package:flutter/material.dart';

class MenuControllers extends ChangeNotifier {
  double itemHeight = 100;
  double itemWidth = 100;

  late Timer _timer;
  DateTime _time = DateTime.now();

  final List<String> _menuImage = [
    'https://images.pexels.com/photos/19247566/pexels-photo-19247566.jpeg',
    'https://images.pexels.com/photos/1893556/pexels-photo-1893556.jpeg',
    'https://images.pexels.com/photos/17313960/pexels-photo-17313960.jpeg',
    'https://images.pexels.com/photos/23325845/pexels-photo-23325845.jpeg',
    'https://images.pexels.com/photos/30146068/pexels-photo-30146068.jpeg',
    'https://images.pexels.com/photos/10895168/pexels-photo-10895168.jpeg',
    'https://images.pexels.com/photos/18855780/pexels-photo-18855780.jpeg',
    'https://images.pexels.com/photos/18709846/pexels-photo-18709846.jpeg',
    'https://images.pexels.com/photos/18134694/pexels-photo-18134694.jpeg',
    'https://images.pexels.com/photos/12838898/pexels-photo-12838898.jpeg',
    'https://images.pexels.com/photos/16407788/pexels-photo-16407788.jpeg',
    'https://images.pexels.com/photos/13357805/pexels-photo-13357805.jpeg',
    'https://images.pexels.com/photos/106343/pexels-photo-106343.jpeg',
    'https://images.pexels.com/photos/2367818/pexels-photo-2367818.jpeg',
    'https://images.pexels.com/photos/16407796/pexels-photo-16407796.jpeg',
    'https://images.pexels.com/photos/888284/pexels-photo-888284.jpeg',
    'https://images.pexels.com/photos/2343461/pexels-photo-2343461.jpeg',
    'https://images.pexels.com/photos/4791260/pexels-photo-4791260.jpeg',
    'https://images.pexels.com/photos/7195123/pexels-photo-7195123.jpeg',
    'https://images.pexels.com/photos/3611846/pexels-photo-3611846.jpeg',
  ];

  late List<Map<String, dynamic>> fastMenu;
  late List<Map<String, dynamic>> healthyMenu;

  MenuControllers() {
    _initMenuData();
    _startTimer();
  }

  void _initMenuData() {
    fastMenu = [
      {"no": 1, "name": "ข้าวผัดหมู", "price": 50, "qty": 1, "image": _menuImage[0]},
      {"no": 2, "name": "ข้าวกะเพราไก่ไข่ดาว", "price": 55, "qty": 1, "image": _menuImage[1]},
      {"no": 3, "name": "ราดหน้าเส้นใหญ่หมู", "price": 60, "qty": 1, "image": _menuImage[2]},
      {"no": 4, "name": "ก๋วยเตี๋ยวหมูน้ำตก", "price": 50, "qty": 1, "image": _menuImage[3]},
      {"no": 5, "name": "ข้าวไข่เจียวหมูสับ", "price": 45, "qty": 1, "image": _menuImage[4]},
      {"no": 6, "name": "ผัดซีอิ๊วหมู", "price": 55, "qty": 1, "image": _menuImage[5]},
      {"no": 7, "name": "ข้าวหมูกระเทียม", "price": 50, "qty": 1, "image": _menuImage[6]},
      {"no": 8, "name": "มักกะโรนีผัดไส้กรอก", "price": 60, "qty": 1, "image": _menuImage[7]},
      {"no": 9, "name": "ข้าวผัดแกงเขียวหวาน", "price": 65, "qty": 1, "image": _menuImage[8]},
      {"no": 10, "name": "ข้าวมันไก่", "price": 50, "qty": 1, "image": _menuImage[9]},
      {"no": 11, "name": "ข้าวขาหมู", "price": 60, "qty": 1, "image": _menuImage[10]},
      {"no": 12, "name": "ข้าวหมูแดง", "price": 55, "qty": 1, "image": _menuImage[11]},
    ];

    healthyMenu = [
      {"no": 13, "name": "สลัดอกไก่", "price": 65, "qty": 1, "image": _menuImage[12]},
      {"no": 14, "name": "ข้าวกล้องไก่อบ", "price": 70, "qty": 1, "image": _menuImage[13]},
      {"no": 15, "name": "ต้มจืดเต้าหู้หมูสับ", "price": 55, "qty": 1, "image": _menuImage[14]},
      {"no": 16, "name": "ข้าวต้มปลา", "price": 60, "qty": 1, "image": _menuImage[15]},
      {"no": 17, "name": "น้ำเต้าหู้ไม่ใส่น้ำตาล", "price": 20, "qty": 1, "image": _menuImage[16]},
      {"no": 18, "name": "ยำเห็ดรวม", "price": 55, "qty": 1, "image": _menuImage[17]},
      {"no": 19, "name": "สุกี้น้ำอกไก่", "price": 60, "qty": 1, "image": _menuImage[18]},
      {"no": 20, "name": "ข้าวคลุกอะโวคาโด", "price": 75, "qty": 1, "image": _menuImage[19]},
    ];
  }

  Future<void> preloadMenuImages(BuildContext context, List<String> urls) async {
    final futures = urls.map((url) {
      return precacheImage(NetworkImage(url), context);
    }).toList();

    await Future.wait(futures);
  }

  List<Map<String, dynamic>> controllerMenuAdditeam = [];
  List<Map<String, dynamic>> get controllerAddMenu => controllerMenuAdditeam;

  // ตัวอื่น ๆ เหมือนเดิม
  List<String> get menuImage => _menuImage;
  List<Map<String, dynamic>> get fastMenuList => fastMenu;
  List<Map<String, dynamic>> get healthyMenuList => healthyMenu;

  void updateQty(int index, int qty) {
    controllerAddMenu[index]['qty'] = qty;
    notifyListeners();
  }

  // void _reorderItems() {
  //   for (int i = 0; i < fastMenu.length; i++) {
  //     fastMenu[i]['no'] = i + 1;
  //   }
  // }

  void updateSize(Size size) {
    final newHeight = (size.height - kToolbarHeight) / 1.6;
    final newWidth = size.width / 2;

    if (itemHeight != newHeight || itemWidth != newWidth) {
      itemHeight = newHeight;
      itemWidth = newWidth;
      notifyListeners();
    }
  }

  void addOrderItem(Map<String, dynamic> newItem) {
    controllerAddMenu.add(newItem);
    //   _reorderItems();

    notifyListeners();
  }

  void increaseQty(int index) {
    controllerAddMenu[index]['qty']++;
    notifyListeners();
  }

  // void decreaseQty(int index) {
  //   controllerAddMenu[index]['qty']--;
  //   notifyListeners();
  // }

  void removeOrderItem(int index) {
    controllerAddMenu.removeAt(index);
    notifyListeners();
  }

  void decreaseQty(int index) {
    if (controllerAddMenu[index]['qty'] > 1) {
      controllerAddMenu[index]['qty'] -= 1;
    } else {
      removeOrderItem(index);
      return;
    }
    // _reorderItems();
    notifyListeners();
  }

  int get totalQty {
    return controllerAddMenu.fold(0, (sum, item) => sum + ((item['qty'] ?? 0) as int));
  }

  double get totalPrice {
    return controllerAddMenu.fold(0.0, (sum, item) {
      return sum + (item['price'] * item['qty']);
    });
  }

  Set<String> flashingItems = {};

  void flashItem(String name) {
    flashingItems.add(name);
    notifyListeners();
    Future.delayed(const Duration(milliseconds: 200), () {
      flashingItems.remove(name);
      notifyListeners();
    });
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      _time = DateTime.now();
      notifyListeners();
    });
  }

  String get formattedTime => '${_pad(_time.hour)}:${_pad(_time.minute)}.${_pad(_time.second)}';

  String _pad(int val) => val.toString().padLeft(2, '0');

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
