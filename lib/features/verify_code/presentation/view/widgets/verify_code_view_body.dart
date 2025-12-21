import 'package:cosmetics/core/utils/app_images.dart';
import 'package:cosmetics/core/utils/utils.dart';
import 'package:cosmetics/core/widgets/button_widget.dart';
import 'package:flutter/material.dart';

import '../../../../../core/style/app_colors.dart';

class VerifyCodeViewBody extends StatefulWidget {
  const VerifyCodeViewBody({super.key});

  @override
  State<VerifyCodeViewBody> createState() => _VerifyCodeViewBodyState();
}

class _VerifyCodeViewBodyState extends State<VerifyCodeViewBody> {
  final List<TextEditingController> controllers = List.generate(
    4,
    (_) => TextEditingController(),
  );

  final List<FocusNode> focusNodes = List.generate(4, (_) => FocusNode());

  @override
  void dispose() {
    for (final c in controllers) {
      c.dispose();
    }
    for (final f in focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  void onCodeChanged(String value, int index) {
    setState(() {});

    // write
    if (value.length == 1) {
      if (index < 3) {
        FocusScope.of(context).requestFocus(focusNodes[index + 1]);
      }
    }

    // remove
    if (value.isEmpty && index > 0) {
      FocusScope.of(context).requestFocus(focusNodes[index - 1]);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 38),
              child: Column(
                children: [
                  40.ph,
                  Image.asset(Assets.assetsImagesSplashLogo, width: 67),
                  40.ph,
                  Text("Verify Code", style: theme.titleLarge),
                  40.ph,
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "We just sent a 4-digit verification code to ",
                          style: theme.titleSmall,
                        ),
                        TextSpan(
                          text: "+20 1022658997.",
                          style: theme.titleMedium?.copyWith(fontSize: 14),
                        ),
                        TextSpan(
                          text: "Enter the code in the box below to continue.",
                          style: theme.titleSmall,
                        ),
                      ],
                    ),
                  ),
                  40.ph,
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Edit the number",
                      style: theme.titleMedium?.copyWith(
                        color: AppColors.primary,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  20.ph,
                      
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      4,
                      (index) => SizedBox(
                        width: 45,
                        height: 45,
                        child: TextFormField(
                          controller: controllers[index],
                          focusNode: focusNodes[index],
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          maxLength: 1,
                          cursorColor: AppColors.dark_gray,
                          onChanged: (value) => onCodeChanged(value, index),
                          decoration: InputDecoration(
                            counterText: '',
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: AppColors.primary,
                                width: 1,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                width: 1,
                                color: controllers[index].text.isNotEmpty
                                    ? AppColors.primary
                                    : AppColors.borderColor, // ⬜ لما فاضي
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  43.ph,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Didn’t receive a code? ',
                        style: theme.titleMedium!.copyWith(fontSize: 12),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Resend',
                          textAlign: TextAlign.center,
                          style: theme.titleMedium!.copyWith(
                            fontSize: 12,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                      Spacer(),
                      Text(
                        "0:36",
                        style: theme.titleMedium!.copyWith(fontSize: 12),
                      ),
                    ],
                  ),
                  48.ph,
                  ButtonWidget(
                    width: 250,
                    height: 56,
                    radius: 24,
                    title: "Done",
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
