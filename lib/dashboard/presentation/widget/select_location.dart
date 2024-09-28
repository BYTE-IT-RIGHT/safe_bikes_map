import 'package:flutter/material.dart';

class SelectLocation extends StatelessWidget {
  final bool isSelected;
  final String? text;
  final String defaultText;
  final Function onTap;
  final Widget prefix;
  final Color color;
  const SelectLocation({
    super.key,
    required this.isSelected,
    required this.text,
    required this.defaultText,
    required this.onTap,
    required this.prefix,
    required this.color
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: isSelected ? EdgeInsets.zero : const EdgeInsets.all(1),
      child: Stack(children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(
                  color: isSelected ? color : Colors.black,
                  width: isSelected ? 2 : 1),
              borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                prefix,
                Expanded(
                  child: Text(
                    text ?? defaultText,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color:
                            Colors.black.withOpacity(text == null ? 0.5 : 1)),
                  ),
                ),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: isSelected
                      ? Padding(
                          padding: const EdgeInsets.all(2),
                          child: RawMaterialButton(
                            shape: const CircleBorder(),
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            onPressed: () {},
                            child: const Icon(Icons.my_location_outlined),
                          ),
                        )
                      : const SizedBox(height: 52),
                )
              ],
            ),
          ),
        ),
        Positioned.fill(
            child: InkWell(
                borderRadius: BorderRadius.circular(8), onTap: () => onTap()))
      ]),
    );
  }
}
