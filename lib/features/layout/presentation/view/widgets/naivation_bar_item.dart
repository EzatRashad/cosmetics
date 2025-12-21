import 'package:cosmetics/features/layout/domain/bottom_navigation_bar_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
        ? SvgPicture.asset(bottomNavigationBarEntity.activeImage,)
        : SvgPicture.asset(bottomNavigationBarEntity.inActiveImage);
  }
}
