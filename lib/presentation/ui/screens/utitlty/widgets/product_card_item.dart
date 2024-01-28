import 'package:crafty_bay/presentation/ui/screens/product_detals_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../app_colors.dart';
import '../assets_path.dart';

class ProductCardItem extends StatelessWidget {
  const ProductCardItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => const ProductDatailsScreen());
      },
      borderRadius: BorderRadius.circular(16),
      child: SizedBox(
        height: 190,
        width: 160,
        child: Card(
            shape:
                BeveledRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  child: Image.asset(
                    AssetsPath.dummyShoeImageJpg,
                    width: 160,
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Nike shoe 120h asdas",
                        maxLines: 1,
                        style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.black.withOpacity(0.6)),
                      ),
                      const Row(
                        children: [
                          Text(
                            "\$120",
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.primoryColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 8.0),
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Icon(
                                Icons.star,
                                size: 14,
                                color: Colors.amber,
                              ),
                              Text(
                                "4.4",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black45),
                              ),
                            ],
                          ),
                          Card(
                            color: AppColors.primoryColor,
                            child: Icon(
                              Icons.favorite_outline_rounded,
                              size: 12,
                              color: Colors.white,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
