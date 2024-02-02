import 'package:crafty_bay/presentation/ui/screens/utitlty/widgets/product_detals/product_image_carousel.dart';
import 'package:flutter/material.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

import 'utitlty/app_colors.dart';
import 'utitlty/widgets/product_detals/color_selector.dart';
import 'utitlty/widgets/product_detals/size_selector.dart';

class ProductDatailsScreen extends StatefulWidget {
  const ProductDatailsScreen({super.key});

  @override
  State<ProductDatailsScreen> createState() => _ProductDatailsScreenState();
}

class _ProductDatailsScreenState extends State<ProductDatailsScreen> {
  ValueNotifier<int> noOfItem = ValueNotifier(1);
  List<Color> colors = [
    Colors.purple,
    Colors.black,
    Colors.amber,
    Colors.red,
    Colors.lightBlue,
  ];
  List<String> sizes = ['S', 'L', 'M', 'XL', 'XXL', 'XXXL'];
  Color _selectedSize = Colors.purple;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Details"),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const ProductImageCarousel(),
                  productDetailsBody,
                ],
              ),
            ),
          ),
          priceAndAddToCartSection
        ],
      ),
    );
  }

  Padding get productDetailsBody {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Expanded(
                  child: Text(
                "NikeSport shoe 2023 Edition Eo23R Save 30%",
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              )),
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
          const SizedBox(height: 8.0),
          reviewAndRatingRow,
          Text(
            "Color",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          ColorSelector(
              colors: colors,
              onChange: (selectedColor) {
                _selectedSize = selectedColor;
              }),
          const SizedBox(height: 16.0),
          Text(
            "Size",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 8.0),
          SizeSelector(sizes: sizes, onChange: (s) {}),
          const SizedBox(height: 16.0),
          Text(
            "Description",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 16.0),
          Text(
            '''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.''',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Row get reviewAndRatingRow {
    return const Row(
      children: [
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Icon(
              Icons.star,
              size: 18,
              color: Colors.amber,
            ),
            SizedBox(width: 8.0),
            Text(
              "4.4",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black45),
            ),
            SizedBox(width: 8.0),
            Text(
              "Reviews",
              style: TextStyle(
                fontSize: 16,
                color: AppColors.primoryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        SizedBox(width: 8.0),
        Card(
          color: AppColors.primoryColor,
          child: Icon(
            Icons.favorite_outline_rounded,
            size: 18,
            color: Colors.white,
          ),
        )
      ],
    );
  }

  Container get priceAndAddToCartSection {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primoryColor.withOpacity(0.15),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Price",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.black45),
              ),
              Text(
                "10000000",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primoryColor),
              )
            ],
          ),
          SizedBox(
            width: 100,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text("Add to Card"),
            ),
          )
        ],
      ),
    );
  }
}
