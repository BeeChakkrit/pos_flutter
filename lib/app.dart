import 'package:flutter/material.dart';
import 'package:pos_flutter/src/providers/color_app.dart';
import 'routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData.dark().copyWith(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: ColorApp.background,
        appBarTheme: const AppBarTheme(
          backgroundColor: ColorApp.appBarBackground,
          titleTextStyle: TextStyle(
            color: ColorApp.appBarText,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(color: ColorApp.appBarIcon),
          elevation: 0,
        ),
        colorScheme: const ColorScheme.dark(
          primary: ColorApp.primary,
          secondary: ColorApp.secondary,
          surface: ColorApp.surface,
          onPrimary: ColorApp.onPrimary,
          onSecondary: ColorApp.onSecondary,
          onSurface: ColorApp.onBackground,
        ),
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
