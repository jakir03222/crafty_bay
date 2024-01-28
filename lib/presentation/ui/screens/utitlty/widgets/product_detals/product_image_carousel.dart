import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay/presentation/ui/screens/utitlty/app_colors.dart';
import 'package:flutter/material.dart';

class ProductImageCarousel extends StatefulWidget {
  const ProductImageCarousel({super.key, this.height});
  final double? height;

  @override
  State<ProductImageCarousel> createState() => _ProductImageCarouselState();
}

class _ProductImageCarouselState extends State<ProductImageCarousel> {
  final ValueNotifier<int> _curerntIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              onPageChanged: (index, reason) {
                _curerntIndex.value = index;
              },
              viewportFraction: 1,
              height: widget.height ?? 220.0),
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                    ),
                    child: Center(
                      child: Text(
                        'text $i',
                        style: const TextStyle(fontSize: 16.0),
                      ),
                    ));
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 6.0),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: ValueListenableBuilder(
              valueListenable: _curerntIndex,
              builder: (context, index, child) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i <= 5; i++)
                      Container(
                        height: 12,
                        width: 12,
                        margin: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                            color: i == index
                                ? AppColors.primoryColor
                                : Colors.white,
                            border: Border.all(
                              color: i == index
                                  ? AppColors.primoryColor
                                  : Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(30)),
                      )
                  ],
                );
              }),
        )
      ],
    );
  }
}
