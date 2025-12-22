import 'package:cosmetics/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/style/app_colors.dart';
import '../../../../../core/utils/app_images.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    final theme=Theme.of(context).textTheme;
    return Card(
      child: AspectRatio(
        aspectRatio: 176 / 237,
        child: Stack(
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(7),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.background,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 9,
                    offset: Offset(2, 2),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AspectRatio(aspectRatio: 161/169,
                      child: Image.asset(Assets.assetsImagesHomeProduct)),
                  5.ph,
                  Text(
                    "Face tint / lip tint",
                    style: theme.titleMedium!.copyWith(
                      fontSize: 14,
                    ),
                  ),
                  5.ph,
                  Text(
                    "\$44.99",
                    style: theme.titleLarge!.copyWith(
                      fontSize: 12,
                      color: Color(0xff70839C),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 16,
              right: 22,
              child: Container(
                width: 32,
                height: 32,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: SvgPicture.asset(Assets.assetsIconsHomeCard),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
