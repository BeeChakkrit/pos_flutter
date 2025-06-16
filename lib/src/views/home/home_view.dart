import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => context.go('/sale'),
              child: const Text('ไปที่ Sale'),
            ),
            ElevatedButton(
              onPressed: () => context.go('/report'),
              child: const Text('ไปที่ Report'),
            ),
          ],
        ),
      ),
    );
  }
}
