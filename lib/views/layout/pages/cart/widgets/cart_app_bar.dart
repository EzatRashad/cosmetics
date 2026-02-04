import 'package:cosmetics/core/style/app_colors.dart';
import 'package:cosmetics/core/utils/utils.dart';
import 'package:cosmetics/core/widgets/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartAppBar extends StatelessWidget {
  const CartAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppColors.background,
      elevation: 0,
      floating: true,
      snap: true,
      expandedHeight: 150.h,
      flexibleSpace: FlexibleSpaceBar(
        background: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            24.ph,
            Text('Categories', style: Theme.of(context).textTheme.titleLarge),
            24.ph,
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color(0x0A000000),
                    blurRadius: 9.r,
                    offset: Offset(0, 2),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hint: Text(
                    "Search",
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  suffixIcon: SizedBox(
                    width: 20.w,
                    child: Center(child: AppImage(imageName: "search.svg")),
                  ),
                  hintStyle: Theme.of(context).textTheme.titleSmall,
                  filled: true,
                  fillColor: AppColors.background,
                  border: buildBorder(),
                  enabledBorder: buildBorder(),
                  focusedBorder: buildBorder(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

OutlineInputBorder buildBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(20.r),
    borderSide: BorderSide(width: 1.w, color: Color(0xffB3B3C1)),
  );
}
