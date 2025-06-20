import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pos_flutter/src/providers/color_app.dart';
import 'package:pos_flutter/src/views/menu/menu_controller.dart';
import 'package:pos_flutter/src/views/menu/menu_showdialog.dart';
import 'package:pos_flutter/src/widgets/load_data.dart';
import 'package:provider/provider.dart';

class MenuFast extends StatelessWidget {
  final List<Map<String, dynamic>> controllers;
  const MenuFast({super.key, required this.controllers});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<MenuControllers>(context);

    // 👇 เรียก updateSize หลังจาก frame แรก build เสร็จ
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final size = MediaQuery.of(context).size;
      controller.updateSize(size);
    });

    return Scaffold(
      backgroundColor: ColorApp.background,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(20),
            childAspectRatio: (controller.itemWidth / controller.itemHeight),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 3,
            children: List.generate(
                controllers.length,
                (index) => GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          barrierDismissible: true,
                          builder: (context) {
                            return MenuShowdialog(
                              controllerMenu: controllers,
                              controller: controller,
                              index: index,
                              imagefood: controllers[index]['image'],
                              nammeMenu: controllers[index]['name'],
                            );
                          },
                        );
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
                              // Cached image with dark overlay
                              CachedNetworkImage(
                                imageUrl: controllers[index]['image'].toString(),
                                fit: BoxFit.cover,
                                placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator(
                                  color: Colors.white70,
                                )),
                                errorWidget: (context, url, error) => const Icon(Icons.error),
                                imageBuilder: (context, imageProvider) => Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.cover,
                                      colorFilter: ColorFilter.mode(
                                        Colors.black.withOpacity(0.4),
                                        BlendMode.darken,
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              // Text Overlay
                              Container(
                                alignment: Alignment.bottomLeft,
                                padding: const EdgeInsets.all(12),
                                child: Text(
                                  'ชื่อเมนู: ${controllers[index]['name']}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    shadows: [
                                      Shadow(
                                        offset: Offset(1.5, 1.5),
                                        blurRadius: 3.0,
                                        color: Colors.black87,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Consumer<MenuControllers>(
                                builder: (context, controller, _) {
                                  int existingIndex = controller.controllerAddMenu.indexWhere(
                                    (item) => item['name'] == controllers[index]['name'],
                                  );
                                  return existingIndex != -1
                                      ? CustomPaint(
                                          painter: BottomRightTrianglePainter(),
                                        )
                                      : const SizedBox.shrink();
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Consumer<MenuControllers>(
                                      builder: (context, controller, _) {
                                        int existingIndex = controller.controllerAddMenu.indexWhere(
                                          (item) => item['name'] == controllers[index]['name'],
                                        );
                                        return Text(
                                          existingIndex != -1
                                              ? '${controller.controllerAddMenu[existingIndex]['qty']}'
                                              : '',
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            shadows: [Shadow(color: Colors.black87, blurRadius: 3)],
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ))),
      ),
    );
  }
}

class BottomRightTrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path = Path()
      ..moveTo(size.width, size.height) // bottom-right
      ..lineTo(size.width * 0.10, size.height) // ครึ่งล่าง
      ..lineTo(size.width, size.height * 0.10) // ครึ่งขวา
      ..close();

    final paint = Paint()
      ..shader = LinearGradient(
        colors: [Colors.green.withOpacity(0.5), Colors.transparent],
        begin: Alignment.bottomRight,
        end: Alignment.center,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
