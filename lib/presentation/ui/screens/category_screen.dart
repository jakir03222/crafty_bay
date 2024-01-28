import 'package:crafty_bay/presentation/state_holders/main_bottom_nav_conttoller.dart';
import 'package:crafty_bay/presentation/ui/screens/utitlty/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CatgoryScreen extends StatefulWidget {
  const CatgoryScreen({super.key});

  @override
  State<CatgoryScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<CatgoryScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (bool value) async {
        Get.find<MainBottomNavController>().backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 3,
          leading: IconButton(
            onPressed: () {
              Get.find<MainBottomNavController>().backToHome();
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          title: const Text("Catagory", style: TextStyle(fontSize: 18)),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: GridView.builder(
            itemCount: 20,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 0.98,
              mainAxisSpacing: 12,
              crossAxisSpacing: 8,
            ),
            itemBuilder: (context, index) {
              return FittedBox(child: CategoryItem(title: ""));
            },
          ),
        ),
      ),
    );
  }
}
