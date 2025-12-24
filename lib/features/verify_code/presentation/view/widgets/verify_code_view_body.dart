import 'package:cosmetics/core/utils/utils.dart';
import 'package:cosmetics/core/widgets/custom_image_widget.dart';
import 'package:cosmetics/features/verify_code/presentation/view/widgets/verify_button.dart';
import 'package:cosmetics/features/verify_code/presentation/view/widgets/verify_code_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
              padding: EdgeInsets.symmetric(horizontal: 38.w),
              child: Column(
                children: [
                  40.ph,
                  CustomImageWidget(imageName: "splash_logo.png", width: 67.w),
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
                          style: theme.titleMedium?.copyWith(fontSize: 14.sp),
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
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                  20.ph,

                  VerifyCodeFields(
                    controllers: controllers,
                    focusNodes: focusNodes,
                    onCodeChanged: onCodeChanged,
                  ),

                  43.ph,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Didn’t receive a code? ',
                        style: theme.titleMedium!.copyWith(fontSize: 12.sp),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Resend',
                          textAlign: TextAlign.center,
                          style: theme.titleMedium!.copyWith(
                            fontSize: 12.sp,
                            color: AppColors.primary.withValues(alpha: .5),
                          ),
                        ),
                      ),
                      Spacer(),
                      Text(
                        "0:36",
                        style: theme.titleMedium!.copyWith(fontSize: 12.sp),
                      ),
                    ],
                  ),
                  48.ph,
                  VerifyButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
