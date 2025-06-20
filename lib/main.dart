import 'package:flutter/material.dart';
import 'package:pos_flutter/src/providers/auth_provider.dart';
import 'package:pos_flutter/src/views/iteame/ieame_controller.dart';
import 'package:pos_flutter/src/views/menu/menu_controller.dart';
import 'package:pos_flutter/src/views/order/orderall/order_add_controller.dart';
import 'package:pos_flutter/src/views/pagecategory/page_controller.dart';
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
        ChangeNotifierProvider(create: (_) => PageControllers()),
        ChangeNotifierProvider(create: (_) => OrderAddController()),
        ChangeNotifierProvider(create: (_) => IeameController()),
      ],
      child: const MyApp(),
    ),
  );
}
