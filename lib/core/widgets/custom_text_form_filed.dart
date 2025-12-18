import 'package:cosmetics/core/style/app_colors.dart';
import 'package:cosmetics/core/style/text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextFormFiled extends StatelessWidget {
  const CustomTextFormFiled({
    super.key,
    required this.label,
    required this.controller,
    this.obscureText = false,
    required this.hintText,
    this.suffixIcon,
    this.validator,
  });
  final String label;
  final String hintText;
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
        label: Text(label, style: TextStyles.textStyle14),
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: TextStyles.textStyle12,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.borderColor, width: 0.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),

          borderSide: BorderSide(color: AppColors.borderColor, width: 1),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(width: .5),
        ),
        errorMaxLines: 3,
        errorStyle: Theme.of(
          context,
        ).textTheme.titleSmall!.copyWith(color: AppColors.error),

        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),

          borderSide: BorderSide(color: AppColors.error, width: .5),
        ),
      ),
    );
  }
}
