import 'package:flutter/material.dart';

class SectionTitleWidget extends StatelessWidget {
  const SectionTitleWidget({
    super.key,
    required this.titel,
    required this.onTabSeeAll,
  });
  final String titel;
  final VoidCallback onTabSeeAll;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          titel,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        TextButton(onPressed: onTabSeeAll, child: const Text("See All"))
      ],
    );
  }
}
