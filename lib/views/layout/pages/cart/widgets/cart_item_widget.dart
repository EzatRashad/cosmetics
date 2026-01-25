import 'package:cosmetics/core/utils/utils.dart';
import 'package:cosmetics/core/widgets/App_image.dart';
import 'package:cosmetics/models/cart_item_model.dart';
import 'package:cosmetics/view_model/cart_cubit/cart_cubit.dart';
import 'package:cosmetics/view_model/cart_cubit/cart_state.dart'; // تأكد من استيراد الـ states
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItemWidget extends StatelessWidget {
  final CartItemModel item;

  const CartItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

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
                child: Stack(
                  children: [
                    AppImage(imageName: "home_product.png"),
                    Positioned(
                      top: 6.h,
                      left: 6.w,
                      child: GestureDetector(
                        onTap: () => CartCubit.get(context)
                            .removeItem(itemId: item.productId.toString()),
                        child: AppImage(imageName: "out.svg", width: 19.w),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            8.pw,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.productName,
                    style: theme.titleLarge!.copyWith(fontSize: 12.sp),
                  ),
                  6.ph,
                  Text(
                    'Ultra rich mascara for lashes',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.titleSmall!.copyWith(
                      color: const Color(0xff434C6D).withOpacity(0.9),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  10.ph,
                  Text(
                    '${item.price} EGP',
                    style: theme.titleLarge!.copyWith(fontSize: 12.sp),
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
                      child: BlocSelector<CartCubit, CartState, int>(
                        selector: (state) {
                          if (state is GetCartSuccess) {
                            return state.cartModel.items
                                .firstWhere(
                                  (e) => e.productId == item.productId,
                                  orElse: () => item,
                                )
                                .quantity;
                          }
                          return item.quantity;
                        },
                        builder: (context, quantity) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  if (quantity > 1) {
                                    context.read<CartCubit>().updateCartItem(
                                          productId: item.productId.toString(),
                                          quantity: quantity - 1,
                                        );
                                  } else {
                                    context.read<CartCubit>().removeItem(
                                          itemId: item.productId.toString(),
                                        );
                                  }
                                },
                                child: AppImage(imageName: "minus.svg"),
                              ),
                              Text(
                                quantity.toString(),
                                style: theme.titleMedium,
                              ),
                              GestureDetector(
                                onTap: () {
                                  context.read<CartCubit>().updateCartItem(
                                        productId: item.productId.toString(),
                                        quantity: quantity + 1,
                                      );
                                },
                                child: AppImage(imageName: "plus.svg"),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}