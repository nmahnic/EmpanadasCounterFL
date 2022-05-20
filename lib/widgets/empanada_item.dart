import 'package:fl_empanadas_counter/widgets/widgets.dart';
import 'package:flutter/material.dart';


class EmpanadaItem extends StatelessWidget {

  final Map<String, int> options;
  final int index;
  final Function(int) incrementCounter;
  final Function(int) decrementCounter;

  const EmpanadaItem({
    Key? key,
    required this.options,
    required this.index,
    required this.incrementCounter,
    required this.decrementCounter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        children: [
          EmpanadaTitle( title: options.keys.elementAt(index)),
          const Expanded(child: SizedBox()),
          RoundedIconButton(
            icon: Icons.remove,
            iconSize: 30, 
            onPress: () => decrementCounter(index),
          ),
          EmpanadaCounter(count: options.values.elementAt(index)),
          RoundedIconButton(
            icon: Icons.add,
            iconSize: 30, 
            onPress: () => incrementCounter(index),
          ),
        ],
      ),
    );
  }
}