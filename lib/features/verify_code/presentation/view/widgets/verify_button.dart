import 'package:cosmetics/core/style/app_colors.dart';
import 'package:cosmetics/core/utils/app_images.dart';
import 'package:cosmetics/core/utils/utils.dart';
import 'package:cosmetics/core/widgets/button_widget.dart';
import 'package:flutter/material.dart';

class VerifyButton extends StatelessWidget {
  const VerifyButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return ButtonWidget(
      width: 250,
      height: 56,
      radius: 24,
      title: "Done",
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 30,
                horizontal: 16,
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    Assets.assetsImagesDialogCheck,

                    width: 100,
                    height: 100,
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
                    width: 250,
                    height: 56,
                    radius: 24,
                    title: "Go to home",
                    onTap: () {},
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
