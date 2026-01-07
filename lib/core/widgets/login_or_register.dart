import 'package:cosmetics/core/style/app_colors.dart';
import 'package:cosmetics/core/utils/navigate.dart';
import 'package:cosmetics/views/auth/create_account/create_account_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginOrRegister extends StatelessWidget {
  const LoginOrRegister({super.key, required this.text1, required this.text2, required this.widget});
  final String text1;
  final String text2;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text1,
          style: theme.titleSmall!.copyWith(fontSize: 12.sp),
        ),
        GestureDetector(
          onTap: () {
            context.nextScreen(widget);
          },
          child: Text(
           text2,
            textAlign: TextAlign.center,
            style: theme.titleMedium!.copyWith(
              fontSize: 12,
              color: AppColors.primary,
            ),
          ),
        ),
      ],
    );
  }
}
