import 'package:cosmetics/core/constants/api_constants.dart';
import 'package:cosmetics/core/style/app_colors.dart';
import 'package:cosmetics/core/utils/navigate.dart';
import 'package:cosmetics/core/utils/utils.dart';
import 'package:cosmetics/core/widgets/app_button.dart';
import 'package:cosmetics/view_model/cart_cubit/cart_cubit.dart';
import 'package:cosmetics/view_model/cart_cubit/cart_state.dart';
import 'package:cosmetics/views/layout/pages/cart/checkout_view.dart';
import 'package:cosmetics/views/layout/pages/cart/widgets/cart_item_widget.dart';
import 'package:cosmetics/views/layout/pages/categories/widgets/my_app_bar.dart';
import 'package:cosmetics/views/layout/pages/home/widgets/error_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  void initState() {
    super.initState();
    context.read<CartCubit>().getCart();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 13.w),
          child: BlocConsumer<CartCubit, CartState>(
            buildWhen: (previous, current) =>
                current is GetCartLoading ||
                current is GetCartSuccess ||
                current is GetCartError,
            builder: (context, state) {
              final cubit = CartCubit.get(context);

              if (state is GetCartLoading) {
                return Center(child: Lottie.asset(loadingImage, width: 180));
              }

              if (state is GetCartError) {
                return ErrorBanner(
                  message: state.message,
                  onRetry: () => cubit.getCart(),
                );
              }

              if (state is GetCartSuccess) {
                var model = state.cartModel;
                return Stack(
                  children: [
                    CustomScrollView(
                      slivers: [
                        const MyAppBar(title: "My Cart", isAction: true),
                        SliverToBoxAdapter(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              24.ph,
                              Text(
                                'You have ${model.items.length} ${model.items.length > 1 ? "products" : "product"} in your cart',
                                style: theme.titleSmall!.copyWith(
                                  color: const Color(
                                    0xff434C6D,
                                  ).withOpacity(0.7),
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              30.ph,
                            ],
                          ),
                        ),
                        model.items.isNotEmpty
                            ? SliverList(
                                delegate: SliverChildBuilderDelegate((
                                  context,
                                  index,
                                ) {
                                  var item = model.items[index];
                                  return Column(
                                    children: [
                                      CartItemWidget(item: item),
                                      if (index < model.items.length - 1)
                                        Divider(thickness: 1.h, height: 20.h),
                                    ],
                                  );
                                }, childCount: model.items.length),
                              )
                            : SliverToBoxAdapter(
                                child: Center(
                                  child: Lottie.asset(
                                    "assets/images/empty.json",
                                  ),
                                ),
                              ),
                      ],
                    ),
                    Positioned(
                      right: 0,
                      left: 0,
                      bottom: 10.h,
                      child: model.total > 0
                          ? AppButton(
                              height: 55.h,
                              radius: 20.r,
                              title: "CHECKOUT  ${model.total} EGP",
                              onTap: () =>
                                  context.nextScreen(const CheckoutView()),
                            )
                          : const SizedBox(),
                    ),
                  ],
                );
              }

              return const SizedBox();
            },
            listener: (BuildContext context, CartState state) {
              if (state is RemoveFromCartSuccess) {
                context.showSnackBar(
                  message: state.message,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                );
              }
              if (state is RemoveFromCartError) {
                context.showSnackBar(
                  message: state.error,
                  backgroundColor: AppColors.error,
                  textColor: Colors.white,
                );
              }
              if (state is UpdateCartItemSuccess) {
                context.showSnackBar(
                  message: state.message,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                );
              }
              if (state is UpdateCartItemError) {
                context.showSnackBar(
                  message: state.error,
                  backgroundColor: AppColors.error,
                  textColor: Colors.white,
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
