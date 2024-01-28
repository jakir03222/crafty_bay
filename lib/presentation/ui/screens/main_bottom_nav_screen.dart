import 'package:crafty_bay/presentation/state_holders/main_bottom_nav_conttoller.dart';
import 'package:crafty_bay/presentation/ui/screens/carts_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/category_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/hoem_screens.dart';
import 'package:crafty_bay/presentation/ui/screens/utitlty/app_colors.dart';
import 'package:crafty_bay/presentation/ui/screens/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainBottonNavScreen extends StatefulWidget {
  const MainBottonNavScreen({super.key});

  @override
  State<MainBottonNavScreen> createState() => _MainBottonNavScreenState();
}

class _MainBottonNavScreenState extends State<MainBottonNavScreen> {
  final List<Widget> _screens = const [
    HomeScreen(),
    CatgoryScreen(),
    CartsScreen(),
    WishListScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainBottomNavController>(
      builder: (controller) {
        return Scaffold(
          body: _screens[controller.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.currentIndex,
            selectedItemColor: AppColors.primoryColor,
            unselectedItemColor: Colors.grey,
            // showSelectedLabels: true,
            showUnselectedLabels: true,
            onTap: (index) {
              controller.changeIndex(index);
            },

            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_filled), label: "home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.dashboard), label: "Categories"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart), label: "Cart"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_outline), label: "wishList"),
            ],
          ),
        );
      },
    );
  }
}
