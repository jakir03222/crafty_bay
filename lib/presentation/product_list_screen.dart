import 'package:flutter/material.dart';
import 'ui/screens/utitlty/widgets/product_card_item.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key, this.category});
  final String? category;
  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category ?? "Products"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: GridView.builder(
          itemCount: 30,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 0.85,
            mainAxisSpacing: 8,
            crossAxisSpacing: 4,
          ),
          itemBuilder: (context, index) {
            return const FittedBox(child: ProductCardItem());
          },
        ),
      ),
    );
  }
}
