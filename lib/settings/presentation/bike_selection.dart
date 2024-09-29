import 'package:flutter/material.dart';

class BikeSelection extends StatelessWidget {
  final Function(int) onSelect;
  final String text;
  final int alreadySelected;
  const BikeSelection(
      {super.key,
      required this.alreadySelected,
      required this.onSelect,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text(
        'Rodzaj roweru',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      ),
      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: alreadySelected == 0 ? Colors.green : null,
                foregroundColor: alreadySelected == 0 ? Colors.white : null),
            onPressed: () => onSelect(0),
            child: const Text('Cross')),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: alreadySelected == 1 ? Colors.green : null,
                foregroundColor: alreadySelected == 1 ? Colors.white : null),
            onPressed: () => onSelect(1),
            child: const Text('Szosowy')),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: alreadySelected == 2 ? Colors.green : null,
                foregroundColor: alreadySelected == 2 ? Colors.white : null),
            onPressed: () => onSelect(2),
            child: const Text('Górski'))
      ]),
      const SizedBox(height: 16),
    ]);
  }
}
