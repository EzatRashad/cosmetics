import 'package:cosmetics/core/style/app_colors.dart';
import 'package:cosmetics/core/utils/navigate.dart';
import 'package:cosmetics/core/utils/utils.dart';
import 'package:cosmetics/core/utils/validatio.dart';
import 'package:cosmetics/core/widgets/App_image.dart';
import 'package:cosmetics/core/widgets/app_button.dart';
import 'package:cosmetics/core/widgets/app_input.dart';
import 'package:cosmetics/view_model/forget_password/forget_password_cubit.dart';
import 'package:cosmetics/view_model/forget_password/forget_password_state.dart';
import 'package:cosmetics/views/auth/login/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreatePasswordView extends StatefulWidget {
  const CreatePasswordView({
    super.key,
    required this.code,
    required this.phone,
  });

  final String code;
  final String phone;
  @override
  State<CreatePasswordView> createState() => _CreatePasswordViewState();
}

class _CreatePasswordViewState extends State<CreatePasswordView> {
  final password = TextEditingController();
  final confirmPassword = TextEditingController();

  bool isPasswordVisible1 = true;
  bool isPasswordVisible2 = true;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => ForgetPasswordCubit()..getCountries(),
          child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
            builder: (context, state) {
              final cubit = ForgetPasswordCubit.get(context);

              return Form(
                key: _formKey,
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 13.w),

                  children: [
                    Column(
                      children: [
                        40.ph,
                        AppImage(
                          imageName: "splash_logo.png",
                          width: 67.w,
                          height: 100,
                        ),
                        35.ph,
                        Text("Create Password", style: theme.titleLarge),
                        40.ph,
                        Text(
                          textAlign: TextAlign.center,
                          "The password should have at least 6 characters.",
                          style: theme.titleSmall,
                        ),
                        50.ph,
                        AppInput(
                          label: "Password",
                          controller: password,
                          obscureText: isPasswordVisible1,
                          validator: Validation.validatePassword,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                isPasswordVisible1 = !isPasswordVisible1;
                              });
                            },
                            child: AppImage(
                              imageName: isPasswordVisible1
                                  ? "visibily_off.svg"
                                  : "visiblily.svg",
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ),

                        10.ph,
                        AppInput(
                          label: "Confirm Password",
                          controller: confirmPassword,
                          obscureText: isPasswordVisible2,
                          validator: (value) =>
                              Validation.validateConfirmPassword(
                                password.text,
                                value,
                              ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                isPasswordVisible2 = !isPasswordVisible2;
                              });
                            },
                            child: AppImage(
                              imageName: isPasswordVisible2
                                  ? "visibily_off.svg"
                                  : "visiblily.svg",
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ),
                        55.ph,
                        state is ForgetPasswordLoading
                            ? const Center(child: CircularProgressIndicator())
                            : AppButton(
                                width: 250.w,
                                height: 56.h,
                                radius: 24.r,
                                title: "Next",
                                onTap: () {
                                  if (_formKey.currentState!.validate()) {
                                    cubit.resetPassword(
                                      countryCode: widget.code,
                                      phoneNumber: widget.phone,
                                      newPassword: password.text,
                                      confirmPassword: confirmPassword.text,
                                    );
                                  }
                                },
                              ),
                      ],
                    ),
                  ],
                ),
              );
            },
            listener: (context, state) {
              if (state is ResetPasswordSuccess) {
                context.showSnackBar(message: state.message);
                context.nextScreen(LoginView());
              }
              if (state is ResetPasswordError) {
                context.showSnackBar(
                  message: state.message,
                  backgroundColor: AppColors.error,
                );
                context.nextScreen(LoginView());
              }
            },
          ),
        ),
      ),
    );
  }
}
