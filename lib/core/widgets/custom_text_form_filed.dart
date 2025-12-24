import 'package:cosmetics/core/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormFiled extends StatelessWidget {
  const CustomTextFormFiled({
    super.key,
    required this.label,
    required this.controller,
    this.obscureText = false,
    this.suffixIcon,
    this.validator,
  });
  final String label;
  final TextEditingController controller;
  final bool obscureText;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,

      onTapOutside: (event) => FocusManager.instance.primaryFocus!.unfocus(),

      cursorColor: AppColors.borderColor,
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        isDense: true,
        label: Text(label, style: Theme.of(context).textTheme.titleSmall),
        suffixIcon: suffixIcon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: AppColors.borderColor, width:1.5.w),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),

          borderSide: BorderSide(color: AppColors.borderColor, width: 1.5.w),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(width: 1.5.w,color: AppColors.borderColor),
        ),
        errorMaxLines: 3,
        errorStyle: Theme.of(
          context,
        ).textTheme.titleSmall!.copyWith(color: AppColors.error),

        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),

          borderSide: BorderSide(color: AppColors.error, width: .5.w),
        ),
      ),
    );
  }
}
