import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_manager_astad/utils/assets_path.dart';

class ScreenBackground extends StatelessWidget {
  final Widget child;
  const ScreenBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
         SvgPicture.asset(AssetsPath.backgroundSvg,
         width: double.maxFinite,
          fit: BoxFit.cover),
         SafeArea(child: child),
      ],
    );
  }
}