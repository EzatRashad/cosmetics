import 'package:cosmetics/core/widgets/app_image.dart';
import 'package:cosmetics/views/layout/domain/bottom_navigation_bar_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NaivgationBarItem extends StatelessWidget {
  const NaivgationBarItem({
    super.key,
    required this.isSelected,
    required this.bottomNavigationBarEntity,
  });

  final bool isSelected;
  final BottomNavigationBarEntity bottomNavigationBarEntity;
  @override
  Widget build(BuildContext context) {
    return isSelected
        ? AppImage(
            width: 20.w,
            height: 20.h,
            imageName: bottomNavigationBarEntity.activeImage,
          )
        : AppImage(
            width: 20.w,
            height: 20.h,
            imageName: bottomNavigationBarEntity.inActiveImage,
          );
  }
}
