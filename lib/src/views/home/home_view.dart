import 'package:flutter/material.dart';
import 'package:pos_flutter/src/providers/color_app.dart';
import 'package:pos_flutter/src/views/menu/menu_controller.dart';
import 'package:pos_flutter/src/views/menu/menu_name.dart';
import 'package:pos_flutter/src/views/menu/menu_healthy.dart';
import 'package:pos_flutter/src/widgets/default_appbar.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late MenuControllers controller;

  @override
  void initState() {
    super.initState();
    controller = Provider.of<MenuControllers>(context, listen: false);
  }

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<MenuControllers>(context);

    final pages = [
      MenuFast(controllers: controller.fastMenuList),
      // MenuFast(controllers: controller.healthyMenuList),
      MenuHealthy(controllers: controller.healthyMenuList),
      Center(child: Text('รายงานยอดขาย')),
    ];

    final titles = [
      'เมนูด่วน',
      'เมนูสุขภาพ',
      'รายงาน',
    ];

    final icons = [
      Icons.fastfood,
      Icons.restaurant_menu,
      Icons.bar_chart,
    ];
    return Scaffold(
      appBar: DefaultAppBar(),
      body: Row(
        children: [
          // Sidebar
          Container(
            width: 100,
            color: ColorApp.appBarBackground,
            child: ListView.builder(
              itemCount: titles.length,
              itemBuilder: (context, index) {
                final isSelected = index == selectedIndex;
                return GestureDetector(
                  onTap: () => setState(() {
                    selectedIndex = index;
                  }),
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.black54 : Colors.transparent,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          icons[index],
                          size: 30,
                          color: isSelected ? Colors.amber : Colors.grey[400],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          titles[index],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            color: isSelected ? Colors.white : Colors.grey[400],
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          // Main content
          Expanded(
            child: pages[selectedIndex],
          ),
        ],
      ),
    );
  }
}
