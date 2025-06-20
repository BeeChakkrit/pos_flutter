import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pos_flutter/src/providers/color_app.dart';

// ignore: must_be_immutable
class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  List<Widget>? actions;
  bool? isButton;
  bool? isBackButton;

  DefaultAppBar({super.key, this.actions, this.isButton, this.isBackButton});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: isBackButton ?? false
          ? IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
              onPressed: () {
                context.pop();
              },
            )
          : null,
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
