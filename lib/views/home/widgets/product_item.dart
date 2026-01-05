import 'package:cosmetics/core/utils/utils.dart';
import 'package:cosmetics/core/widgets/custom_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/style/app_colors.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Card(
      child: AspectRatio(
        aspectRatio: 176.w / 237.h,
        child: Stack(
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(7.r),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
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
                  Expanded(
                    child: AspectRatio(
                      aspectRatio: 161.w / 169.h,
                      child: CustomImageWidget(imageName: "home_product.png"),
                    ),
                  ),
                  5.ph,
                  Text(
                    "Face tint / lip tint",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.titleMedium!.copyWith(fontSize: 14.sp),
                  ),
                  5.ph,
                  Text(
                    "\$44.99",
                    style: theme.titleLarge!.copyWith(
                      fontSize: 12.sp,
                      color: Color(0xff70839C),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 16.h,
              right: 22.w,
              child: Container(
                width: 32.w,
                height: 32.h,
                padding: EdgeInsets.all(8.r),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: CustomImageWidget(imageName: "home_card.svg"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
