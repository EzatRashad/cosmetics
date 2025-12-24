import 'package:cosmetics/core/widgets/custom_image_widget.dart';
import 'package:cosmetics/features/layout/domain/bottom_navigation_bar_entity.dart';
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
        ? CustomImageWidget(
            width: 20.w,
            height: 20.h,
            imageName: bottomNavigationBarEntity.activeImage,
          )
        : CustomImageWidget(
            width: 20.w,
            height: 20.h,
            imageName: bottomNavigationBarEntity.inActiveImage,
          );
  }
}
