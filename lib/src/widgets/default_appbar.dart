import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  Widget? leading;
  Color? backgroundColor;
  bool? isBackButton;
  final String titles;
  DefaultAppBar(
      {super.key, required this.titles, this.backgroundColor = Colors.deepPurple, this.leading, this.isBackButton});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: isBackButton ?? true
          ? leading
          : IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
      backgroundColor: backgroundColor,
      title: Text(
        titles,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
