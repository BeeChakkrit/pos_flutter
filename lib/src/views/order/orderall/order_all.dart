import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pos_flutter/src/views/order/orderall/order_add_controller.dart';
import 'package:pos_flutter/src/widgets/default_appbar.dart';
import 'package:pos_flutter/src/widgets/load_data.dart';
import 'package:pos_flutter/src/widgets/my_sizedbox.dart';
import 'package:provider/provider.dart';

class OrderAll extends StatefulWidget {
  const OrderAll({super.key});

  @override
  State<OrderAll> createState() => _OrderAllState();
}

class _OrderAllState extends State<OrderAll> {
  late Timer _timer;

  late Map<String, List<Map<String, dynamic>>> orderList;

  var controller = OrderAddController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<OrderAddController>(context, listen: false).generateOrderList();
    });
    // ✅ Timer สำหรับ refresh ทุกวินาที
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {}); // ทำให้ widget rebuild → เวลาใหม่จะคำนวณใหม่
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller = Provider.of<OrderAddController>(context, listen: false);
    final entries = controller.orderList.entries.toList();

    if (entries.isEmpty) {
      return const LoadData();
    }

    return Scaffold(
      appBar: DefaultAppBar(isBackButton: true),
      body: MasonryGridView.count(
        crossAxisCount: 4,
        mainAxisSpacing: 12,
        crossAxisSpacing: 10,
        padding: const EdgeInsets.all(12),
        itemCount: entries.length,
        itemBuilder: (context, index) {
          final orderName = entries[index].key;
          final orderData = entries[index].value;

          // แก้ตรงนี้
          final firstItem = orderData.isNotEmpty ? orderData.first : {};

          final menuItems = orderData.length > 1 ? orderData.sublist(1) : [];

          final timestamp = firstItem['timestamp'] ?? 0;
          final color = controller.getColorFromTimestamp(timestamp);
          final timeText = controller.formatRemainingTime(timestamp);

          return Container(
            decoration: const BoxDecoration(
              color: Color(0xFF2A2A2A),
              borderRadius: BorderRadius.vertical(top: Radius.circular(4)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        orderName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        timeText, // ⏱ เหลือเท่าไร
                        style: const TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12, bottom: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: menuItems.map<Widget>((item) {
                      return GestureDetector(
                        onTap: () {
                          item['status'] = !item['status'];
                        },
                        child: Padding(
                            padding: const EdgeInsets.only(bottom: 4),
                            child: item['status']
                                ? Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 24,
                                        child: Text(
                                          '${item['qty']}',
                                          style: const TextStyle(color: Color(0xFFCCCCCC)),
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: Text(
                                          item['name'],
                                          style: const TextStyle(
                                            color: Color(0xFFCCCCCC),
                                            height: 1.4,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                : Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 24,
                                        child: Text(
                                          '${item['qty']}',
                                          style: const TextStyle(
                                            color: Color.fromARGB(255, 93, 93, 93),
                                            decoration: TextDecoration.lineThrough,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: Text(
                                          item['name'],
                                          style: const TextStyle(
                                            color: Color.fromARGB(255, 93, 93, 93),
                                            decoration: TextDecoration.lineThrough,
                                            height: 1.4,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                      );
                    }).toList(),
                  ),
                ),
                const MySizedbox(size: 10, myType: 'h'),
                const ReceiptZigzag(
                  color: Color(0xFF1A1A1A),
                  height: 15,
                  toothWidth: 12,
                  toothHeight: 3,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class ReceiptZigzag extends StatelessWidget {
  const ReceiptZigzag({
    super.key,
    this.color = Colors.white,
    this.height = 12,
    this.toothWidth = 8,
    this.toothHeight = 4, // 👈 เพิ่มตรงนี้
  });

  final Color color;
  final double height;
  final double toothWidth;
  final double toothHeight;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(double.infinity, height),
      painter: _ZigzagPainter(color, height, toothWidth, toothHeight),
    );
  }
}

class _ZigzagPainter extends CustomPainter {
  final Color color;
  final double height;
  final double toothWidth;
  final double toothHeight;

  _ZigzagPainter(this.color, this.height, this.toothWidth, this.toothHeight);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    final path = Path();

    path.moveTo(0, 0);

    for (double x = 0; x < size.width; x += toothWidth) {
      path.lineTo(x + toothWidth / 2, toothHeight); // 👈 ทู่ขึ้น
      path.lineTo(x + toothWidth, 0);
    }

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
