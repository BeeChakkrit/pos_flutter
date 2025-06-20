import 'package:flutter/material.dart';
import 'package:pos_flutter/src/providers/color_app.dart';
import 'package:pos_flutter/src/views/iteame/ieame_controller.dart';
import 'package:pos_flutter/src/widgets/default_appbar.dart';
import 'package:pos_flutter/src/widgets/my_sizedbox.dart';
import 'package:provider/provider.dart';

class IteameCategory extends StatelessWidget {
  const IteameCategory({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<IeameController>(context, listen: false);

    return Scaffold(
      appBar: DefaultAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'รายการสินค้า',
              style: TextStyle(
                color: ColorApp.tableEmptyBorder,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const MySizedbox(size: 15, myType: 'h'),
            Container(
              padding: const EdgeInsets.all(16.0),
              color: ColorApp.appBarBackground,
              child: Row(
                children: [
                  Container(
                    width: 80,
                    alignment: Alignment.center,
                    child: const Text(
                      'รหัสสินค้า',
                      style: TextStyle(color: ColorApp.onPrimary, fontSize: 18),
                    ),
                  ),
                  const SizedBox(width: 25),
                  const Expanded(
                    flex: 2,
                    child: Text(
                      'ชื่อสินค้า',
                      style: TextStyle(color: ColorApp.onPrimary, fontSize: 18),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        'หมวดหมู่',
                        style: TextStyle(color: ColorApp.onPrimary, fontSize: 18),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    width: 70,
                    alignment: Alignment.center,
                    child: const Text(
                      'ราคา',
                      style: TextStyle(color: ColorApp.onPrimary, fontSize: 18),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    width: 100,
                    alignment: Alignment.center,
                    child: const Text(
                      'จำนวน',
                      style: TextStyle(color: ColorApp.onPrimary, fontSize: 18),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.center,
                      child: const Text(
                        'การจัดการ',
                        style: TextStyle(color: ColorApp.onPrimary, fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 0, color: ColorApp.tableEmptyBorder, thickness: 1),

            const Divider(
              height: 0,
              color: ColorApp.tableEmptyBorder,
              thickness: 1,
            ),

            ListView.builder(
              padding: const EdgeInsets.all(0),
              itemCount: controller.items.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                final item = controller.items[index];
                final rowColor = index.isEven ? ColorApp.surface.withOpacity(0.9) : ColorApp.surface.withOpacity(0.6);

                return Container(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  color: rowColor,
                  child: Row(
                    children: [
                      Container(
                        width: 80,
                        alignment: Alignment.center,
                        child: Text(
                          item['id'].toString(),
                          style: const TextStyle(color: ColorApp.onBackground, fontSize: 16),
                        ),
                      ),
                      const SizedBox(width: 25),
                      Expanded(
                        flex: 2,
                        child: Text(
                          item['name'].toString(),
                          style: const TextStyle(color: ColorApp.onBackground, fontSize: 16),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            item['category'].toString(),
                            style: const TextStyle(color: ColorApp.onBackground, fontSize: 16),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        width: 70,
                        alignment: Alignment.center,
                        child: Text(
                          item['price'].toString(),
                          style: const TextStyle(color: ColorApp.onBackground, fontSize: 16),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        width: 100,
                        alignment: Alignment.center,
                        child: Text(
                          item['quantity'].toString(),
                          style: const TextStyle(color: ColorApp.onBackground, fontSize: 16),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Consumer(builder: (BuildContext context, IeameController controller, Widget? child) {
                                return GestureDetector(
                                  onTap: () {
                                    controller.toggleIteam();
                                  },
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: ColorApp.iconSuccess.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: (controller.openIteam)
                                        ? const Icon(Icons.remove_red_eye, color: ColorApp.iconSuccess, size: 20)
                                        : const Icon(Icons.remove_red_eye_outlined,
                                            color: ColorApp.iconSuccess, size: 20),
                                  ),
                                );
                              }),
                              const SizedBox(width: 8),
                              const SizedBox(width: 8),
                              Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: ColorApp.iconInfo.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: const Icon(Icons.edit, color: ColorApp.iconInfo, size: 20),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),

            // ListView.
          ],
        ),
      ),
    );
  }
}
