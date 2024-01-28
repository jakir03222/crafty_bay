import 'package:crafty_bay/presentation/ui/screens/utitlty/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

import '../../assets_path.dart';

class CardProductItem extends StatelessWidget {
  const CardProductItem({
    super.key,
    required this.noOfItem,
  });

  final ValueNotifier<int> noOfItem;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Row(
        children: [
          Image.asset(
            AssetsPath.dummyShoeImageJpg,
            width: 100,
          ),
          Expanded(
              child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Nike Showp 2024 Edition",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black45,
                                      overflow: TextOverflow.ellipsis),
                                  maxLines: 3,
                                ),
                                Row(
                                  children: [
                                    Text("Color: Red"),
                                    SizedBox(height: 8),
                                    Text("Size: XL")
                                  ],
                                ),
                                Text(
                                  "\$ 1200",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.primoryColor),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.delete_forever_outlined,
                                    color: Colors.grey,
                                  ),
                                ),
                                ValueListenableBuilder(
                                  valueListenable: noOfItem,
                                  builder: (context, value, child) => ItemCount(
                                    color: AppColors.primoryColor,
                                    initialValue: value,
                                    minValue: 1,
                                    maxValue: 20,
                                    decimalPlaces: 0,
                                    onChanged: (v) {
                                      noOfItem.value = v.toInt();
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}
