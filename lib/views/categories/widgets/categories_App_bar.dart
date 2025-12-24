import 'package:cosmetics/core/style/app_colors.dart';
import 'package:cosmetics/core/utils/utils.dart'; 
import 'package:cosmetics/core/widgets/custom_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesAppBar extends StatelessWidget {
  const CategoriesAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppColors.background,
      elevation: 0,
      floating: true,
      snap: true,
      actions: [CustomImageWidget(imageName: "card.svg")],
      title: Text('My Cart', style: Theme.of(context).textTheme.titleLarge),
      centerTitle: true,
    );
  }
}

OutlineInputBorder buildBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(20.r),
    borderSide: BorderSide(width: 1.w, color: Color(0xffB3B3C1)),
  );
}
