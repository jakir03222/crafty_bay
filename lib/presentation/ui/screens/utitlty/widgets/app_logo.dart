import 'package:crafty_bay/presentation/ui/screens/utitlty/assets_path.dart';
import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  final double? width;
  final double? height;
  const AppLogo({super.key, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AssetsPath.logo,
      width: width,
      height: height,
    );
  }
}
