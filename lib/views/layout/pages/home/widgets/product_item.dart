import 'package:cosmetics/core/utils/navigate.dart';
import 'package:cosmetics/core/utils/utils.dart';
import 'package:cosmetics/core/widgets/app_image.dart';
import 'package:cosmetics/core/widgets/app_network_image.dart';
import 'package:cosmetics/models/product_model.dart';
import 'package:cosmetics/view_model/cart_cubit/cart_cubit.dart';
import 'package:cosmetics/view_model/cart_cubit/cart_state.dart';
import 'package:cosmetics/views/layout/pages/product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/style/app_colors.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.productModel,
    required this.image,
  });
  final ProductModel productModel;
  final String image;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () {
        context.nextScreen(
          ProductDetailsView(product: productModel, image: image),
        );
      },
      child: Card(
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
                        child: AppNetworkImage(image: image),
                      ),
                    ),
                    5.ph,
                    Text(
                      productModel.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.titleMedium!.copyWith(fontSize: 14.sp),
                    ),
                    5.ph,
                    Text(
                      "\$${productModel.price}",
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
                child: GestureDetector(
                  onTap: context.read<CartCubit>().state is AddToCartLoading
                      ? null
                      : () {
                          context.read<CartCubit>().addToCart(
                            productId: productModel.id.toString(),
                          );
                        },
                  child: Container(
                    width: 32.w,
                    height: 32.h,
                    padding: EdgeInsets.all(8.r),
                    decoration: BoxDecoration(
                      color: context.read<CartCubit>().state is AddToCartLoading
                          ? Colors.grey
                          : AppColors.white,
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    child: AppImage(imageName: "home_card.svg"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
