import 'package:flutter/material.dart';

class ColorSelector extends StatefulWidget {
  const ColorSelector({
    super.key,
    required this.colors,
    required this.onChange,
  });
  final List<Color> colors;
  final Function(Color) onChange;

  @override
  State<ColorSelector> createState() => _ColorSelectorState();
}

class _ColorSelectorState extends State<ColorSelector> {
  late Color _selectedSize;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedSize = widget.colors.first;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: widget.colors
          .map((c) => InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: () {
                  _selectedSize = c;
                  widget.onChange(c);
                  if (mounted) {
                    setState(() {});
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: c,
                    child: _selectedSize == c
                        ? const Icon(
                            Icons.done,
                            color: Colors.white,
                          )
                        : null,
                  ),
                ),
              ))
          .toList(),
    );
  }
}
