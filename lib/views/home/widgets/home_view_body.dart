import 'package:cosmetics/core/utils/utils.dart';
import 'package:cosmetics/views/home/widgets/home_search_field.dart';
import 'package:cosmetics/views/home/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'home_banner.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 13.w),

          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    12.ph,

                    const HomeSearchField(),
                    15.ph,
                    HomeBanner(),
                    26.ph,
                    Text(
                      "Top rated products",
                      style: theme.titleLarge!.copyWith(fontSize: 16.sp),
                    ),
                    14.ph,
                  ],
                ),
              ),
              SliverGrid.builder(
                itemCount: 6,
                gridDelegate:   SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 163.w / 214.h,
                  mainAxisSpacing: 8.h,
                  crossAxisSpacing: 16.w,
                ),
                itemBuilder: (context, index) => ProductItem(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
