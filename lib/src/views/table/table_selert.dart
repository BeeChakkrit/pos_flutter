import 'package:flutter/material.dart';
import 'package:pos_flutter/src/providers/color_app.dart';
import 'package:pos_flutter/src/views/table/table_controller.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class TableSelert extends StatelessWidget {
  final int tableId;
  final String tableName;
  final String orderItem;
  Function()? onTap;

  TableSelert({
    super.key,
    required this.tableId,
    required this.tableName,
    required this.orderItem,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<TableController>(context);

    // 🎯 กำหนดสีพื้นหลังและสีเส้นตามสถานะโต๊ะ
    Color bgColor;
    Color borderColor;

    if (tableId == 0) {
      // ไม่มีลูกค้า
      bgColor = Colors.transparent;
      borderColor = ColorApp.tableEmptyBorder;
    } else if (tableId == 1) {
      // มีลูกค้า
      bgColor = ColorApp.tableOccupiedBackground;
      borderColor = ColorApp.tableOccupiedBorder;
    } else {
      // ลูกค้าชำระเงินแล้ว
      bgColor = ColorApp.tablePaidBackground;
      borderColor = ColorApp.tablePaidBorder;
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: bgColor,
          border: Border.all(
            color: borderColor,
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  tableName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: ColorApp.tableText,
                  ),
                ),
                Text(
                  controller.formattedTime,
                  style: const TextStyle(fontSize: 14, color: ColorApp.tableText),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              tableId == 1 || tableId == 2 ? 'Orders $orderItem Item' : 'NoOrders',
              style: const TextStyle(fontSize: 14, color: ColorApp.tableText),
            ),
          ],
        ),
      ),
    );
  }
}
