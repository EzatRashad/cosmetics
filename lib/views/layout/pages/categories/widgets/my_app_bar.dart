import 'package:cosmetics/core/style/app_colors.dart';
import 'package:cosmetics/core/widgets/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key, required this.title, this.isAction = false});
  final String title;
  final bool isAction;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppColors.background,
      elevation: 0,
      floating: true,
      actions: [
        isAction
            ? GestureDetector(
                child: AppImage(imageName: "out.svg", width: 20.w),
              )
            : SizedBox(),
      ],
      snap: true,
      title: Text(title, style: Theme.of(context).textTheme.titleLarge),
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
