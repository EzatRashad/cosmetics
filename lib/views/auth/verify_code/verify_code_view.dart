import 'dart:async';

import 'package:cosmetics/core/style/app_colors.dart';
import 'package:cosmetics/core/utils/navigate.dart';
import 'package:cosmetics/core/utils/utils.dart';
import 'package:cosmetics/core/widgets/app_button.dart';
import 'package:cosmetics/core/widgets/app_image.dart';
import 'package:cosmetics/view_model/otp_cubit/oto_state.dart';
import 'package:cosmetics/view_model/otp_cubit/otp_cubit.dart';
import 'package:cosmetics/views/auth/create_password.dart';
import 'package:cosmetics/views/auth/login/login_view.dart';
import 'package:cosmetics/views/auth/verify_code/widgets/verify_code_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerifyCodeView extends StatefulWidget {
  const VerifyCodeView({
    super.key,

    required this.phoneNumber,
    required this.code,
    this.isForgetPassword = false,
  });
  final bool isForgetPassword;
  final String phoneNumber;
  final String code;

  @override
  State<VerifyCodeView> createState() => _VerifyCodeViewState();
}

class _VerifyCodeViewState extends State<VerifyCodeView> {
  int remainingSeconds = 60;
  Timer? countdownTimer;
  void startTimer() {
    countdownTimer?.cancel();
    remainingSeconds = 60;

    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSeconds == 0) {
        timer.cancel();
      } else {
        setState(() {
          remainingSeconds--;
        });
      }
    });
  }

  final List<TextEditingController> controllers = List.generate(
    4,
    (_) => TextEditingController(),
  );

  final List<FocusNode> focusNodes = List.generate(4, (_) => FocusNode());

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  @override
  void dispose() {
    for (final c in controllers) {
      c.dispose();
    }
    for (final f in focusNodes) {
      f.dispose();
    }
    countdownTimer?.cancel();

    super.dispose();
  }

  void onCodeChanged(String value, int index) {
    setState(() {});

    // write
    if (value.length == 1 && index < 3) {
      FocusScope.of(context).requestFocus(focusNodes[index + 1]);
    }

    // remove
    if (value.isEmpty && index > 0) {
      FocusScope.of(context).requestFocus(focusNodes[index - 1]);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return BlocProvider(
      create: (_) => OtpCubit(),
      child: Scaffold(
        body: SafeArea(
          child: BlocConsumer<OtpCubit, OtpState>(
            listener: (context, state) {
              if (state is OtpSuccess) {
                widget.isForgetPassword
                    ? context.nextScreen(
                        CreatePasswordView(
                          code: widget.code,
                          phone: widget.phoneNumber,
                        ),
                      )
                    : showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 30.h,
                            horizontal: 16.w,
                          ),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              AppImage(
                                imageName: "dialog_check.png",
                                width: 100.w,
                                height: 100.h,
                              ),
                              26.ph,
                              Text(
                                "Account Activated!",
                                style: theme.titleMedium,
                              ),
                              23.ph,
                              Text(
                                "Congratulations! Your account has been successfully activatedL",
                                textAlign: TextAlign.center,
                                style: theme.titleMedium!.copyWith(
                                  color: AppColors.hint_text,
                                ),
                              ),
                              23.ph,
                              AppButton(
                                width: 250.w,
                                height: 56.h,
                                radius: 24.r,
                                title: "Ready To Login",
                                onTap: () {
                                  context.nextScreen(
                                    const LoginView(),
                                    remove: true,
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      );
              }

              if (state is OtpError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            builder: (context, state) {
              return ListView(
                padding: EdgeInsets.symmetric(horizontal: 38.w),
                children: [
                  40.ph,
                  AppImage(
                    imageName: "splash_logo.png",
                    width: 67.w,
                    height: 100,
                  ),

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
                          text: "${widget.code} ${widget.phoneNumber}. ",
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
                    alignment: AlignmentDirectional.centerStart,
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
                    children: [
                      Text(
                        'Didn’t receive a code? ',
                        style: theme.titleMedium!.copyWith(fontSize: 12.sp),
                      ),
                      GestureDetector(
                        onTap: () {
                          startTimer();
                        },

                        child: Text(
                          'Resend',
                          style: theme.titleMedium!.copyWith(
                            fontSize: 12.sp,
                            color: AppColors.primary.withValues(alpha: .5),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "${(remainingSeconds ~/ 60).toString().padLeft(1, '0')}:${(remainingSeconds % 60).toString().padLeft(2, '0')}",
                        style: theme.titleMedium!.copyWith(fontSize: 12.sp),
                      ),
                    ],
                  ),

                  48.ph,

                  state is OtpLoading
                      ? const Center(child: CircularProgressIndicator())
                      : AppButton(
                          width: 250.w,
                          height: 56.h,
                          radius: 24.r,
                          title: "Done",
                          onTap: () {
                            if (controllers.every((c) => c.text.isNotEmpty)) {
                              final otpCode = controllers
                                  .map((c) => c.text)
                                  .join();

                              context.read<OtpCubit>().verifyOtp(
                                countryCode: widget.code,
                                phoneNumber: widget.phoneNumber,
                                otpCode: otpCode,
                              );
                            }
                          },
                        ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
