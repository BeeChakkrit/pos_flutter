import 'package:flutter/material.dart';

class LoadData extends StatelessWidget {
  const LoadData({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              color: Colors.white,
            ), // ไอคอนโหลด
            SizedBox(height: 12),
            Text(
              'กำลังโหลดออเดอร์...',
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
