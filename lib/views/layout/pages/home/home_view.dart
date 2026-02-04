import 'dart:math';

import 'package:cosmetics/core/constants/consts.dart';
import 'package:cosmetics/core/style/app_colors.dart';
import 'package:cosmetics/core/utils/utils.dart';
import 'package:cosmetics/view_model/cart_cubit/cart_cubit.dart';
import 'package:cosmetics/view_model/cart_cubit/cart_state.dart';
import 'package:cosmetics/view_model/home_cubit/home_cubit.dart';
import 'package:cosmetics/view_model/home_cubit/home_state.dart';
import 'package:cosmetics/views/layout/pages/home/widgets/error_banner.dart';
import 'package:cosmetics/views/layout/pages/home/widgets/home_search_field.dart';
import 'package:cosmetics/views/layout/pages/home/widgets/product_item.dart';
import 'package:cosmetics/views/layout/pages/home/widgets/home_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit()..getHomeData(),
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 13.w),
            child: MultiBlocListener(
              listeners: [
                BlocListener<CartCubit, CartState>(
                  listener: (context, state) {
                    if (state is AddToCartSuccess) {
                      context.showSnackBar(
                        message: state.message,
                        backgroundColor: Colors.green,
                        textColor: Colors.white,
                      );
                    } else if (state is AddToCartError) {
                      context.showSnackBar(
                        message: state.message,
                        backgroundColor: AppColors.error,
                        textColor: Colors.white,
                      );
                    }
                  },
                ),
              ],
              child: BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state is HomeLoading) {
                    return Center(
                      child: Lottie.asset(loadingImage, width: 180),
                    );
                  }

                  if (state is HomeError) {
                    return Center(
                      child: ErrorBanner(
                        message: state.message,
                        onRetry: () {
                          context.read<HomeCubit>().getHomeData();
                        },
                      ),
                    );
                  }

                  if (state is HomeSuccess) {
                    return CustomScrollView(
                      slivers: [
                        SliverToBoxAdapter(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              12.ph,
                              const HomeSearchField(),
                              15.ph,
                              HomeBanner(sliders: state.sliders),
                              26.ph,
                              Text(
                                "Top rated products",
                                style: Theme.of(context).textTheme.titleLarge!
                                    .copyWith(fontSize: 16.sp),
                              ),
                              14.ph,
                            ],
                          ),
                        ),
                        SliverGrid.builder(
                          itemCount: state.products.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 163.w / 214.h,
                                mainAxisSpacing: 8.h,
                                crossAxisSpacing: 16.w,
                              ),
                          itemBuilder: (context, index) => ProductItem(
                            productModel: state.products[index],
                            image:
                                imageList[Random().nextInt(imageList.length)],
                          ),
                        ),
                      ],
                    );
                  }

                  return const SizedBox.shrink();
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

final imageList = [
  "https://images.unsplash.com/photo-1522335789203-aabd1fc54bc9?q=80&w=1000&auto=format&fit=crop",
  "https://images.unsplash.com/photo-1512496015851-a90fb38ba796?q=80&w=1000&auto=format&fit=crop",
  "https://images.unsplash.com/photo-1571781926291-c477ebfd024b?q=80&w=1000&auto=format&fit=crop",
  "https://images.unsplash.com/photo-1556229010-6c3f2c9ca5f8?q=80&w=1000&auto=format&fit=crop",
  "https://images.unsplash.com/photo-1612817288484-6f916006741a?q=80&w=1000&auto=format&fit=crop",
  "https://images.unsplash.com/photo-1620916566398-39f1143ab7be?q=80&w=1000&auto=format&fit=crop",
];
