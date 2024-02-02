import 'package:flutter/material.dart';

class SizeSelector extends StatefulWidget {
  const SizeSelector({
    Key? key, // Added missing Key parameter
    required this.sizes,
    required this.onChange,
  }) : super(key: key);

  final List<String> sizes;
  final Function(String) onChange;

  @override
  State<SizeSelector> createState() => SizeSelectorState();
}

class SizeSelectorState extends State<SizeSelector> {
  late String _selectedSize;

  @override
  void initState() {
    super.initState();
    _selectedSize = widget.sizes.first;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: widget.sizes
          .map((c) => InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: () {
                  _selectedSize = c;
                  widget.onChange(c);
                  if (mounted) {
                    setState(() {});
                  }
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8.0),
                  margin: const EdgeInsets.only(right: 9),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black54),
                    borderRadius: BorderRadius.circular(30),
                    color: c == _selectedSize ? Colors.green : null,
                  ),
                  child: Text(
                    c,
                    style: TextStyle(
                      color: c == _selectedSize ? Colors.white : Colors.black54,
                    ),
                  ),
                ),
              ))
          .toList(),
    );
  }
}
