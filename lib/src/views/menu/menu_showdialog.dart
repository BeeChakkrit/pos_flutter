import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pos_flutter/src/providers/color_app.dart';
import 'package:pos_flutter/src/views/menu/menu_controller.dart';
import 'package:pos_flutter/src/widgets/flash_row.dart';
import 'package:provider/provider.dart';

class MenuShowdialog extends StatelessWidget {
  final List<Map<String, dynamic>> controllerMenu;
  final MenuControllers controller;
  final String nammeMenu;
  final String imagefood;
  final int index;

  const MenuShowdialog({
    super.key,
    required this.controller,
    required this.controllerMenu,
    required this.index,
    required this.nammeMenu,
    required this.imagefood,
  });

  @override
  Widget build(BuildContext context) {
    final currentItem = controllerMenu[index];
    return Dialog(
      alignment: Alignment.centerRight,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      insetPadding: const EdgeInsets.all(16),
      child: StatefulBuilder(
        builder: (context, setState) {
          return Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.75,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                          leading: const Icon(Icons.content_paste, color: Colors.amber, size: 32),
                          title: Text(
                            'รายการคำสั่งซื้อทั้งหมด (${controller.menuImage.length})',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Consumer<MenuControllers>(
                            builder: (context, controller, _) {
                              return Text('เวลา: ${controller.formattedTime}');
                            },
                          )),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: ColorApp.background,
                            ),
                            child: LayoutBuilder(
                              builder: (context, constraints) {
                                return SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: ConstrainedBox(
                                    constraints: BoxConstraints(
                                      minWidth: constraints.maxWidth,
                                    ),
                                    child: Consumer<MenuControllers>(builder: (context, controller, _) {
                                      return DataTable(
                                        columnSpacing: 16,
                                        horizontalMargin: 0,
                                        columns: const [
                                          DataColumn(
                                            label: SizedBox(
                                              width: 60,
                                              child: Text('ลำดับ', overflow: TextOverflow.ellipsis),
                                            ),
                                          ),
                                          DataColumn(
                                            label: SizedBox(
                                              width: 150,
                                              child: Text('รายการ', overflow: TextOverflow.ellipsis),
                                            ),
                                          ),
                                          DataColumn(
                                            label: SizedBox(
                                              width: 70,
                                              child: Center(child: Text('ราคา')),
                                            ),
                                          ),
                                          DataColumn(
                                            label: SizedBox(
                                              width: 100,
                                              child: Center(child: Text('จำนวน')),
                                            ),
                                          ),
                                        ],
                                        rows: controller.controllerAddMenu.isEmpty
                                            ? []
                                            : controller.controllerAddMenu.asMap().entries.map((entry) {
                                                int index = entry.key;
                                                var item = entry.value;

                                                return DataRow(
                                                  cells: [
                                                    DataCell(
                                                      FlashCell(
                                                        shouldFlash: controller.flashingItems.contains(item['name']),
                                                        child: Center(child: Text('${index + 1}')),
                                                      ),
                                                    ),
                                                    DataCell(
                                                      FlashCell(
                                                        shouldFlash: controller.flashingItems.contains(item['name']),
                                                        child: SizedBox(
                                                          width: 150,
                                                          child: Text(item['name'], overflow: TextOverflow.ellipsis),
                                                        ),
                                                      ),
                                                    ),
                                                    DataCell(
                                                      FlashCell(
                                                        shouldFlash: controller.flashingItems.contains(item['name']),
                                                        child: Center(child: Text('${item['price']}')),
                                                      ),
                                                    ),
                                                    DataCell(
                                                      FlashCell(
                                                        shouldFlash: controller.flashingItems.contains(item['name']),
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            IconButton(
                                                              icon: const Icon(Icons.remove_circle_outline,
                                                                  color: Colors.red, size: 20),
                                                              onPressed: () {
                                                                if (item['qty'] > 1) {
                                                                  controller.controllerAddMenu[index]['qty'] -= 1;
                                                                } else {
                                                                  controller.removeOrderItem(index);
                                                                }
                                                                controller
                                                                    .flashItem(item['name']); // << เรียกให้กระพริบ
                                                              },
                                                            ),
                                                            SizedBox(
                                                              width: 20,
                                                              child:
                                                                  Text('${item['qty']}', textAlign: TextAlign.center),
                                                            ),
                                                            IconButton(
                                                              icon: const Icon(Icons.add_circle_outline,
                                                                  color: Colors.green, size: 20),
                                                              onPressed: () {
                                                                controller.controllerAddMenu[index]['qty'] += 1;
                                                                controller
                                                                    .flashItem(item['name']); // << เรียกให้กระพริบ
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              }).toList(),
                                      );
                                    }),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      Consumer<MenuControllers>(
                        builder: (context, controller, _) {
                          final total = controller.controllerAddMenu.fold(0.0, (sum, item) {
                            return sum + (item['price'] * item['qty']);
                          });
                          return Text('รวมทั้งหมด: ${total.toStringAsFixed(2)} บาท',
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold));
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.35,
                height: MediaQuery.of(context).size.height * 0.75,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // รูปภาพบนสุด (1/3)
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(16),
                        ),
                        child: CachedNetworkImage(
                          imageUrl: imagefood.toString(),
                          fit: BoxFit.cover,
                          placeholder: (context, url) =>
                              const Center(child: CircularProgressIndicator(color: Colors.white70)),
                          errorWidget: (context, url, error) => const Icon(Icons.error),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "ชื่อเมนู :${nammeMenu.toString()}",
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            'รายละเอียดเพิ่มเติม',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'เลือกตัวเลือกหรือระบุความต้องการเพิ่มเติมสำหรับเมนูนี้...',
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    Expanded(child: Container()),

                    // ส่วนเนื้อหา
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // ปุ่มเพิ่มลดจำนวน
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove_circle_outline, color: Colors.red),
                                onPressed: () {
                                  int existingIndex = controller.controllerAddMenu.indexWhere(
                                    (item) => item['name'] == currentItem['name'],
                                  );
                                  if (existingIndex != -1) {
                                    if (controller.controllerAddMenu[existingIndex]['qty'] <= 1) {
                                      controller.removeOrderItem(existingIndex);
                                    } else {
                                      controller.decreaseQty(existingIndex);
                                    }
                                  }
                                  controller.flashItem(currentItem['name']); // << เรียกให้กระพริบ
                                },
                              ),
                              Consumer<MenuControllers>(
                                builder: (context, controller, _) {
                                  int existingIndex = controller.controllerAddMenu.indexWhere(
                                    (item) => item['name'] == currentItem['name'],
                                  );
                                  return Container(
                                    width: 30,
                                    alignment: Alignment.center,
                                    child: Text(
                                      existingIndex != -1
                                          ? '${controller.controllerAddMenu[existingIndex]['qty']}'
                                          : '0',
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                  );
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.add_circle_outline, color: Colors.green),
                                onPressed: () {
                                  int existingIndex = controller.controllerAddMenu.indexWhere(
                                    (item) => item['name'] == currentItem['name'],
                                  );
                                  if (existingIndex != -1) {
                                    controller.increaseQty(existingIndex);
                                  } else {
                                    controller.addOrderItem({
                                      'no': controller.controllerAddMenu.length + 1,
                                      'name': currentItem['name'],
                                      'price': currentItem['price'],
                                      'qty': 1,
                                      'image': currentItem['image'],
                                    });
                                  }
                                  controller.flashItem(currentItem['name']); // << เรียกให้กระพริบ
                                },
                              ),
                            ],
                          ),

                          const SizedBox(height: 20),

                          // ปุ่มยืนยัน
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                                // เพิ่ม logic การยืนยัน
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.amber,
                                foregroundColor: Colors.black,
                                padding: const EdgeInsets.symmetric(vertical: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: const Text('ยืนยันการสั่งซื้อ'),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
