import 'package:flutter/material.dart';
import 'package:pos_flutter/src/providers/color_app.dart';

// ignore: must_be_immutable
class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  List<Widget>? actions;

  bool? isButton;

  DefaultAppBar({super.key, this.actions, this.isButton});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorApp.appBarBackground,
      centerTitle: false,
      title: const Text('POS Flutter',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          )),
      actions: isButton ?? true ? actions : [],
    );

    // AppBar(
    //   leading: isBackButton ?? true
    //       ? leading
    //       : IconButton(
    //           icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
    //           onPressed: () {
    //             Navigator.pop(context);
    //           },
    //         ),
    //   backgroundColor: backgroundColor,
    //   title: Text(
    //     titles,
    //     style: const TextStyle(
    //       fontSize: 20,
    //       fontWeight: FontWeight.bold,
    //       color: Colors.white,
    //     ),
    //   ),
    // );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
