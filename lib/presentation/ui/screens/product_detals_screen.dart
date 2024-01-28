import 'package:crafty_bay/presentation/ui/screens/utitlty/widgets/product_detals/product_image_carousel.dart';
import 'package:flutter/material.dart';

class ProductDatailsScreen extends StatelessWidget {
  const ProductDatailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Details"),
      ),
      body: Expanded(
        child: Column(
          children: [
            const ProductImageCarousel(),
            Expanded(
              child: Column(
                children: [],
              ),
            ),
            Container(),
          ],
        ),
      ),
    );
  }
}
