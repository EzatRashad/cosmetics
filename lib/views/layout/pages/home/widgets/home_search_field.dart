import 'package:cosmetics/core/style/app_colors.dart';
import 'package:cosmetics/core/widgets/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../view_model/home_cubit/home_cubit.dart';

class HomeSearchField extends StatelessWidget {
  const HomeSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
        onTapOutside: (event) => FocusManager.instance.primaryFocus!.unfocus(),
        onChanged: (value) {
          context.read<HomeCubit>().searchProducts(value);
        },
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
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.r),
      borderSide: BorderSide(width: 1.w, color: Color(0xffB3B3C1)),
    );
  }
}
