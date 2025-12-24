import 'package:cosmetics/core/utils/utils.dart';
import 'package:cosmetics/core/widgets/custom_image_widget.dart';
import 'package:cosmetics/views/categories/widgets/categories_App_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

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
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    24.ph,
                    Text(
                      'You have 4 products in your cart',
                      style: theme.titleSmall!.copyWith(
                        color: Color(0xff434C6D).withValues(alpha: 0.7),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    30.ph,
                  ],
                ),
              ),

              SliverList(
                delegate: SliverChildBuilderDelegate(childCount: 3, (
                  context,
                  index,
                ) {
                  return Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 102.w,
                            height: 102.h,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.r),
                              child: CustomImageWidget(
                                imageName: "home_product.png",
                              ),
                            ),
                          ),
                          8.pw,

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Note Cosmetics',
                                  style: theme.titleLarge!.copyWith(
                                    fontSize: 12.sp,
                                  ),
                                ),
                                6.ph,
                                Text(
                                  'Ultra rich mascara for lashes',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: theme.titleSmall!.copyWith(
                                    color: const Color(
                                      0xff434C6D,
                                    ).withValues(alpha: 0.9),
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                10.ph,
                                Text(
                                  '24.00 EGP',
                                  style: theme.titleLarge!.copyWith(
                                    fontSize: 12.sp,
                                  ),
                                ),
                                10.ph,

                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                    width: 142.w,
                                    height: 42.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.r),
                                      border: Border.all(
                                        color: const Color(0xffB3B3C1),
                                        width: 1.w,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        CustomImageWidget(
                                          imageName: "minus.svg",
                                        ),
                                        Text(
                                          '1',
                                          style: theme.titleLarge!.copyWith(
                                            fontSize: 12.sp,
                                          ),
                                        ),
                                        CustomImageWidget(
                                          imageName: "plus.svg",
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      if (index < 2) Divider(thickness: 1.h, height: 20.h),
                    ],
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
