import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pos_flutter/src/providers/color_app.dart';
import 'package:pos_flutter/src/views/table/table_controller.dart';
import 'package:pos_flutter/src/views/table/table_selert.dart';
import 'package:pos_flutter/src/widgets/default_appbar.dart';
import 'package:provider/provider.dart';

class TableView extends StatelessWidget {
  const TableView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<TableController>(context);

    // 👇 เรียก updateSize หลังจาก frame แรก build เสร็จ
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final size = MediaQuery.of(context).size;
      controller.updateSize(size);
    });

    return Scaffold(
      backgroundColor: ColorApp.background,
      appBar: DefaultAppBar(
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.exit_to_app))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          childAspectRatio: (controller.itemWidth / controller.itemHeight),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 4,
          children: List.generate(
            10,
            (index) => TableSelert(
              onTap: index == 0
                  ? () {
                      context.go('/home');
                    }
                  : null,
              tableId: index,
              tableName: 'Table ${index + 1}',
              orderItem: '${index + 1}',
            ),
          ),
        ),
      ),
    );
  }
}
