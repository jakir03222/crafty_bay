import 'package:crafty_bay/presentation/product_list_screen.dart';
import 'package:crafty_bay/presentation/state_holders/main_bottom_nav_conttoller.dart';
import 'package:crafty_bay/presentation/ui/screens/utitlty/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'utitlty/widgets/category_item.dart';
import 'utitlty/widgets/home/banner_carousel.dart';
import 'utitlty/widgets/home/circle_icon_button.dart';
import 'utitlty/widgets/home/section_title.dart';
import 'utitlty/widgets/product_card_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              searchTextField,
              const SizedBox(height: 16),
              const BannarCarousel(),
              SectionTitleWidget(
                titel: "All Categories",
                onTabSeeAll: () {
                  Get.find<MainBottomNavController>().changeIndex(1);
                },
              ),
              categoryList,
              SectionTitleWidget(
                titel: "Popular",
                onTabSeeAll: () {
                  Get.to(() => const ProductListScreen());
                },
              ),
              ProductList,
              const SizedBox(height: 8.0),
              SectionTitleWidget(
                titel: "Speclal",
                onTabSeeAll: () {},
              ),
              ProductList,
              const SizedBox(height: 8.0),
              SectionTitleWidget(
                titel: "New Prduct",
                onTabSeeAll: () {},
              ),
              ProductList,
            ],
          ),
        ),
      ),
    );
  }

  SizedBox get categoryList {
    return SizedBox(
      height: 130,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        primary: false,
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index) {
          return const CategoryItem(title: "Electronics");
        },
        separatorBuilder: (context, index) {
          return const SizedBox(width: 10);
        },
      ),
    );
  }

  SizedBox get ProductList {
    return SizedBox(
      height: 200,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        primary: false,
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index) {
          return const ProductCardItem();
        },
        separatorBuilder: (context, index) {
          return const SizedBox(width: 10);
        },
      ),
    );
  }

  TextFormField get searchTextField {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Search",
        filled: true,
        fillColor: Colors.grey.shade200,
        prefixIcon: const Icon(
          Icons.search,
          color: Colors.grey,
        ),
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8)),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}

AppBar get appBar {
  return AppBar(
    title: Image.asset(
      AssetsPath.logo,
      width: 30,
    ),
    actions: [
      CircleIconButton(
        onTab: () {},
        iconData: Icons.person,
      ),
      const SizedBox(width: 8.0),
      CircleIconButton(
        onTab: () {},
        iconData: Icons.call,
      ),
      const SizedBox(width: 8.0),
      CircleIconButton(
        onTab: () {},
        iconData: Icons.notifications_active_outlined,
      )
    ],
  );
}
