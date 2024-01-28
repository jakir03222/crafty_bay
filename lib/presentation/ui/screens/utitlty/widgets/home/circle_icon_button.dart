import 'package:flutter/material.dart';

class CircleIconButton extends StatelessWidget {
  const CircleIconButton({
    super.key,
    required this.onTab,
    required this.iconData,
  });
  final VoidCallback onTab;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTab,
      borderRadius: BorderRadius.circular(15),
      child: CircleAvatar(
        radius: 15,
        backgroundColor: Colors.grey.shade300,
        child: Icon(
          iconData,
          color: Colors.grey,
          size: 25,
        ),
      ),
    );
  }
}
