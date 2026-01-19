import 'package:cosmetics/core/style/app_colors.dart';
import 'package:cosmetics/core/utils/utils.dart';
import 'package:cosmetics/models/product_model.dart';
import 'package:cosmetics/view_model/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({
    super.key,
    required this.product,
    required this.image,
  });

  final ProductModel product;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      bottomNavigationBar: _DetailsNav(
        isEnable: product.stock > 0,
        id: product.id.toString(),
      ),
      body: CustomScrollView(
        slivers: [
          _DetailsAppBar(image: image),

          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  12.ph,

                  Text(
                    "\$${product.price}",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: 20.sp,
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  16.ph,

                  Text(
                    product.description.isEmpty
                        ? "No description available"
                        : product.description,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 14.sp,
                      color: AppColors.hint_text,
                    ),
                  ),

                  24.ph,

                  Row(
                    children: [
                      Text(
                        "Stock:",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      8.pw,
                      Text(
                        product.stock.toString(),
                        style: TextStyle(
                          color: product.stock > 0 ? Colors.green : Colors.red,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),

                  100.ph,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DetailsAppBar extends StatelessWidget {
  const _DetailsAppBar({required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: MediaQuery.sizeOf(context).height * 0.4,
      pinned: true,
      backgroundColor: AppColors.white,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
        onPressed: () => Navigator.pop(context),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(20.h),
        child: Container(
          height: 20.h,
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.vertical(top: Radius.circular(32.r)),
          ),
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: const [
          StretchMode.zoomBackground,
          StretchMode.blurBackground,
        ],
        background: Image.network(
          image,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) =>
              const Center(child: Icon(Icons.image, size: 100)),
        ),
      ),
    );
  }
}

class _DetailsNav extends StatelessWidget {
  const _DetailsNav({required this.isEnable, required this.id});

  final bool isEnable;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 33.w, vertical: 12.h),
        color: AppColors.white,
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(10.r),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: AppColors.primary),
              ),
              child: const Icon(Icons.favorite_border),
            ),

            27.pw,

            Expanded(
              child: GestureDetector(
                onTap: isEnable
                    ? () {
                        context.read<CartCubit>().addToCart(productId: id);
                      }
                    : null,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 17.h),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(isEnable ? 1 : 0.5),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Text(
                    textAlign: TextAlign.center,
                    "Add To Cart",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: AppColors.white,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
