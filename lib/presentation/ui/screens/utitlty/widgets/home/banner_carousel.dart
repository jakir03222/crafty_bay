import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay/presentation/ui/screens/utitlty/app_colors.dart';
import 'package:flutter/material.dart';

class BannarCarousel extends StatefulWidget {
  const BannarCarousel({super.key, this.height});
  final double? height;

  @override
  State<BannarCarousel> createState() => _BannarCarouselState();
}

class _BannarCarouselState extends State<BannarCarousel> {
  final ValueNotifier<int> _curerntIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              onPageChanged: (index, reason) {
                _curerntIndex.value = index;
              },
              viewportFraction: 1,
              autoPlay: true,
              height: widget.height ?? 150.0),
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 1.0),
                    decoration: BoxDecoration(
                        color: AppColors.primoryColor,
                        borderRadius: BorderRadius.circular(8)),
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
        ValueListenableBuilder(
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
                              : Colors.transparent,
                          border: Border.all(
                            color: i == index
                                ? AppColors.primoryColor
                                : Colors.green.shade400,
                          ),
                          borderRadius: BorderRadius.circular(30)),
                    )
                ],
              );
            })
      ],
    );
  }
}
