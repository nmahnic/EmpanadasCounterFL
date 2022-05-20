import 'package:flutter/material.dart';

class EmpanadaTitle extends StatelessWidget {
  const EmpanadaTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
      child: Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
    );
  }
}