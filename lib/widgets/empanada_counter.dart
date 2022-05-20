import 'package:flutter/material.dart';

class EmpanadaCounter extends StatelessWidget {
  const EmpanadaCounter({
    Key? key,
    required this.count,
  }) : super(key: key);

  final int count;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 25,
      child: Center(
        child: Text(count.toString(), style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
        )
    );
  }
}