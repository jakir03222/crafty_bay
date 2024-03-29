import 'package:crafty_bay/presentation/product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app_colors.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => const ProductListScreen(
              category: "Elitronics",
            ));
      },
      child: Column(
        children: [
          Card(
            elevation: 0,
            color: AppColors.primoryColor.withOpacity(0.2),
            child: const Padding(
              padding: EdgeInsets.all(20.0),
              child: Icon(
                Icons.computer,
                color: AppColors.primoryColor,
                size: 32,
              ),
            ),
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              color: AppColors.primoryColor,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
