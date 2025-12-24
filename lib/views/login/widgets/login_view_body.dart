import 'package:cosmetics/core/style/app_colors.dart';
import 'package:cosmetics/core/utils/navigate.dart';
import 'package:cosmetics/core/utils/utils.dart';
import 'package:cosmetics/core/widgets/button_widget.dart';
import 'package:cosmetics/core/widgets/custom_image_widget.dart';
import 'package:cosmetics/core/widgets/custom_text_form_filed.dart';
import 'package:cosmetics/views/create_account/create_account_view.dart';
import 'package:cosmetics/views/login/widgets/country_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final phone = TextEditingController();
  final password = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 13.w),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                Column(
                  children: [
                    48.ph,
                    CustomImageWidget(
                      imageName: "login_logo.png",
                      height: 227.h,
                    ),
                    25.ph,
                    Text("Login Now", style: theme.titleLarge),
                    14.ph,
                    Text(
                      "Please enter the details below to continue",
                      style: theme.titleSmall,
                    ),
                    25.ph,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 73.w,
                          height: 46.h,
                          child: CountryCodeDropdown(),
                        ),
                        10.pw,
                        Expanded(
                          child: CustomTextFormFiled(
                            label: "Phone Number",
                            controller: phone,
                          ),
                        ),
                      ],
                    ),

                    8.ph,
                    CustomTextFormFiled(
                      label: "Password",
                      controller: password,
                      obscureText: true,
                      suffixIcon: CustomImageWidget(
                        imageName: "visibily_off.svg",
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    12.ph,
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Forget Password?",
                        style: theme.titleSmall!.copyWith(
                          color: AppColors.error,
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                    43.ph,

                    ButtonWidget(
                      width: 250.w,
                      height: 56.h,
                      radius: 24.r,
                      title: "Login",
                      onTap: () {
                        //context.nextScreen(  )
                      },
                    ),
                    86.ph,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don’t have an account?  ',
                          style: theme.titleSmall!.copyWith(fontSize: 12.sp),
                        ),
                        GestureDetector(
                          onTap: () {
                            context.nextScreen(CreateAccountView());
                          },
                          child: Text(
                            'Register',
                            textAlign: TextAlign.center,
                            style: theme.titleMedium!.copyWith(
                              fontSize: 12,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
