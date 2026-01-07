import 'package:cosmetics/core/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final String? fontFamily;
  final double width, height, radius;
  final Widget? child;
  final Gradient? gradient;
  final double? fontSize;
  final FontWeight? fontweight;
  final Alignment? alignment;
  final Color? textColor, buttonColor, borderColor;
  final VoidCallback? onTap;
  final bool withBorder;

  const ButtonWidget({
    super.key,
    this.gradient,
    this.title = "OK",
    this.width = double.infinity,
    this.height = 58.0,
    this.onTap,
    this.fontFamily,
    this.child,
    this.fontSize,
    this.fontweight,
    this.alignment,
    this.textColor = Colors.white,
    this.buttonColor,
    this.borderColor,
    this.withBorder = false,
    this.radius = 16.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: width,
      // height: height,
      decoration: BoxDecoration(
        // gradient: gradient,
        borderRadius: BorderRadius.circular(radius),
      ),
      constraints: BoxConstraints(minWidth: width, minHeight: height),
      child: ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(
            buttonColor ?? AppColors.primary,
          ),
          overlayColor: WidgetStateProperty.all<Color>(AppColors.transparent),
          shadowColor: WidgetStateProperty.all<Color>(AppColors.transparent),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
              side: withBorder
                  ? BorderSide(color: borderColor ?? AppColors.primary)
                  : BorderSide(color: AppColors.transparent),
            ),
          ),
        ),
        child:
            child ??
            Text(
              title,
              style: Theme.of(
                context,
              ).textTheme.titleMedium!.copyWith(color: AppColors.white),
            ),
      ),
    );
  }
}

class TextButtonWidget extends StatelessWidget {
  const TextButtonWidget({
    super.key,
    required this.function,
    required this.text,
    this.fontweight,
    this.color,
    this.size,
    this.fontFamily,
  });
  final Function function;
  final String text;
  final double? size;
  final Color? color;
  final FontWeight? fontweight;
  final String? fontFamily;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        function();
      },
      child: Text(
        text,
        style: TextStyle(
          fontWeight: fontweight ?? FontWeight.w500,
          fontFamily: fontFamily ?? "Almarai",
          fontSize: size ?? 16.sp,
          color: color ?? AppColors.white,
        ),
      ),
    );
  }
}
