import 'package:flutter/material.dart';

class ColorApp {
  // พื้นหลัง/พื้นผิว/ธีมหลัก
  static const Color background = Color(0xFF1A1A1A);
  static const Color surface = Color(0xFF2A2A2A);
  static const Color primary = Color(0xFF795548); // น้ำตาลเข้ม
  static const Color secondary = Color(0xFF4E342E);
  static const Color onPrimary = Colors.white;
  static const Color onSecondary = Colors.white;
  static const Color onBackground = Color(0xFFCCCCCC);

  // AppBar
  static const Color appBarBackground = Color(0xFF121212);
  static const Color appBarText = Colors.white;
  static const Color appBarIcon = Colors.white;

  // โต๊ะ
  static const Color tableText = Colors.white;
  static const Color tableEmptyBorder = Color(0xFF888888);
  static const Color tableOccupiedBackground = Color(0xFF4E342E);
  static const Color tableOccupiedBorder = Color(0xFF6D4C41);
  static const Color tablePaidBackground = Color(0xFF2E7D32); // เขียวเข้ม
  static const Color tablePaidBorder = Color(0xFF1B5E20);

  // 🎯 สีสำหรับ "Icon"
  static const Color iconDefault = onBackground; // ไอคอนทั่วไป (สีเทาสว่าง)
  static const Color iconPrimary = primary; // ไอคอนเน้น (เช่นปุ่มเพิ่ม)
  static const Color iconSecondary = secondary; // ไอคอนรอง (เช่นปุ่มลด)
  static const Color iconDisabled = Color(0xFF555555); // ไอคอนที่ถูกปิด
  static const Color iconSuccess = tablePaidBackground; // ไอคอนสถานะสำเร็จ (สีเขียว)
  static const Color iconWarning = Color(0xFFFFA000); // สีส้มเตือน
  static const Color iconError = Color(0xFFD32F2F); // สีแดงแจ้งเตือน
  static const Color iconInfo = Color(0xFF64B5F6); // สีฟ้าข้อมูล
}
