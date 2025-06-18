import 'package:flutter/material.dart';

class MySizedbox extends StatelessWidget {
  final double size;
  final String myType;

  const MySizedbox({super.key, required this.size, required this.myType});

  @override
  Widget build(BuildContext context) {
    return myType == 'h'
        ? SizedBox(
            height: size,
          )
        : SizedBox(
            width: size,
          );
  }
}
