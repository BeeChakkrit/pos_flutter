import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pos_flutter/src/providers/color_app.dart';
import 'package:pos_flutter/src/views/pagecategory/page_controller.dart';
import 'package:pos_flutter/src/widgets/default_appbar.dart';
import 'package:provider/provider.dart';

class PageCategory extends StatefulWidget {
  const PageCategory({super.key});

  @override
  State<PageCategory> createState() => _PageCategoryState();
}

class _PageCategoryState extends State<PageCategory> {
  late PageControllers controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = Provider.of<PageControllers>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(),
      body: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          childAspectRatio: (controller.itemWidth / controller.itemHeight),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 4,
          children: List.generate(
              controller.iconsPage.length,
              (index) => GestureDetector(
                    onTap: () {
                      context.push(controller.pages[index]);
                    },
                    child: Container(
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(width: 1),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            SizedBox(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    controller.iconsPage[index],
                                    size: 50,
                                    color: ColorApp.iconDefault,
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    controller.namePage[index],
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ))),
    );
  }
}
