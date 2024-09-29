import 'package:flutter/material.dart';
import 'package:safe_bikes_map/settings/domain/Settings.dart';

class SettingsRow extends StatelessWidget {
  final Function(SettingOption) onSelect;
  final String text;
  final SettingOption alreadySelected;
  const SettingsRow(
      {super.key,
      required this.onSelect,
      required this.text,
      required this.alreadySelected});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        text,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      ),
      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: alreadySelected == SettingOption.none
                    ? Colors.green
                    : null),
            onPressed: () => onSelect(SettingOption.none),
            child: const Text('Nie')),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: alreadySelected == SettingOption.medium
                    ? Colors.green
                    : null),
            onPressed: () => onSelect(SettingOption.medium),
            child: const Text('Delikatnie')),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: alreadySelected == SettingOption.high
                    ? Colors.green
                    : null),
            onPressed: () => onSelect(SettingOption.high),
            child: const Text('Unikaj'))
      ]),
      const SizedBox(height: 16),
    ]);
  }
}
