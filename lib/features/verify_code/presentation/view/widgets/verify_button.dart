import 'package:cosmetics/core/style/app_colors.dart';
import 'package:cosmetics/core/utils/navigate.dart';
import 'package:cosmetics/core/utils/utils.dart';
import 'package:cosmetics/core/widgets/button_widget.dart';
import 'package:cosmetics/core/widgets/custom_image_widget.dart';
import 'package:cosmetics/features/layout/presentation/view/layout_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerifyButton extends StatelessWidget {
  const VerifyButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return ButtonWidget(
      width: 250.w,
      height: 56.h,
      radius: 24.r,
      title: "Done",
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              contentPadding:   EdgeInsets.symmetric(
                vertical: 30.h,
                horizontal: 16.w,
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomImageWidget(
                    imageName: "dialog_check.png",
                    width: 100.w,
                    height: 100.h,
                  ),
                  26.ph,

                  Text("Account Activated!", style: theme.titleMedium),
                  23.ph,

                  Text(
                    "Congratulations! Your account has been successfully activatedL",
                    textAlign: TextAlign.center,
                    style: theme.titleMedium!.copyWith(
                      color: AppColors.hint_text,
                    ),
                  ),
                  23.ph,
                  ButtonWidget(
                    width: 250.w,
                    height: 56.h,
                    radius: 24.r,
                    title: "Go to home",
                    onTap: () {
                      context.nextScreen(LayoutView(), remove: true);
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
