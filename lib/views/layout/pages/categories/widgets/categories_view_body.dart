import 'package:cosmetics/core/utils/utils.dart';
import 'package:cosmetics/core/widgets/custom_image_widget.dart';
import 'package:cosmetics/views/layout/pages/categories/widgets/categories_App_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesViewBody extends StatelessWidget {
  const CategoriesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 13.w),

          child: CustomScrollView(
            slivers: [
              CategoriesAppBar(),

              SliverList.builder(
                itemCount: 6,
                itemBuilder: (context, index) => Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          height: 69.h,
                          child: AspectRatio(
                            aspectRatio: 64.w / 69.h,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.r),
                              child: AppImage(imageName: "home_product.png"),
                            ),
                          ),
                        ),
                        12.pw,
                        Text('Bundles', style: theme.titleMedium),
                        Spacer(),
                        AppImage(imageName: "arrow.svg"),
                      ],
                    ),
                    if (index < 5) Divider(thickness: 1.h, height: 20.h),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
