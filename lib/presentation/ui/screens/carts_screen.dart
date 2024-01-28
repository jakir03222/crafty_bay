import 'package:crafty_bay/presentation/state_holders/main_bottom_nav_conttoller.dart';
import 'package:crafty_bay/presentation/ui/screens/utitlty/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'utitlty/widgets/cards/card_product_item.dart';

class CartsScreen extends StatefulWidget {
  const CartsScreen({super.key});

  @override
  State<CartsScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<CartsScreen> {
  ValueNotifier<int> noOfItem = ValueNotifier(1);
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (_) {
        Get.find<MainBottomNavController>().backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Carts"),
          leading: IconButton(
              onPressed: () {
                Get.find<MainBottomNavController>().backToHome();
              },
              icon: const Icon(Icons.arrow_back_ios)),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: 5,
                itemBuilder: (context, int index) =>
                    CardProductItem(noOfItem: noOfItem),
                separatorBuilder: (_, __) => const SizedBox(
                  height: 8,
                ),
              ),
            ),
            totalPriceAndCheckSection,
          ],
        ),
      ),
    );
  }

  Container get totalPriceAndCheckSection {
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
                "Total Price",
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
              child: const Text("Check out"),
            ),
          )
        ],
      ),
    );
  }
}
