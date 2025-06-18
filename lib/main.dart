import 'package:flutter/material.dart';
import 'package:pos_flutter/src/providers/auth_provider.dart';
import 'package:pos_flutter/src/views/menu/menu_controller.dart';
import 'package:pos_flutter/src/views/table/table_controller.dart';
import 'package:provider/provider.dart';
import 'app.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => TableController()),
        ChangeNotifierProvider(create: (_) => MenuControllers()),
      ],
      child: const MyApp(),
    ),
  );
}
