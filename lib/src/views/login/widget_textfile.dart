import 'package:flutter/material.dart';

class TextfileLogin extends StatelessWidget {
  final String text;
  const TextfileLogin({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    // Colors.blue[900]
    return TextField(
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue.shade900),
        ),
        // focusedBorder: OutlineInputBorder(
        //   borderSide: BorderSide(color: Colors.green),
        // ),
        labelText: text,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
