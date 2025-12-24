import 'package:cosmetics/core/style/app_colors.dart';
import 'package:cosmetics/core/utils/navigate.dart';
import 'package:cosmetics/core/utils/utils.dart';
import 'package:cosmetics/core/widgets/button_widget.dart';
import 'package:cosmetics/core/widgets/custom_image_widget.dart';
import 'package:cosmetics/core/widgets/custom_text_form_filed.dart';
import 'package:cosmetics/views/login/login_view.dart';
import 'package:cosmetics/views/login/widgets/country_code.dart';
import 'package:cosmetics/views/verify_code/verify_code_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateAccountViewBody extends StatefulWidget {
  const CreateAccountViewBody({super.key});

  @override
  State<CreateAccountViewBody> createState() => _CreateAccountViewBodyState();
}

class _CreateAccountViewBodyState extends State<CreateAccountViewBody> {
  final phone = TextEditingController();

  final name = TextEditingController();
  final password = TextEditingController();
  final confirm_password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 13.w),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                Column(
                  children: [
                    40.ph,
                    CustomImageWidget(imageName: "splash_logo.png", width: 67.w),
                    35.ph,
                    Text("Create Account", style: theme.titleLarge),
                    50.ph,
                    CustomTextFormFiled(label: "Your Name", controller: name),
                    10.ph,
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
                    10.ph,
                    CustomTextFormFiled(
                      label: "Password",
                      controller: password,
                      obscureText: true,
                      suffixIcon: CustomImageWidget(
                        imageName: "visibily_off.svg",
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    10.ph,
                    CustomTextFormFiled(
                      label: "Confirm Password",
                      controller: confirm_password,
                      obscureText: true,
                      suffixIcon: CustomImageWidget(
                        imageName: "visibily_off.svg",
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    89.ph,
                    ButtonWidget(
                      width: 250.w,
                      height: 56.h,
                      radius: 24.r,
                      title: "Next",
                      onTap: () {
                        context.nextScreen(VerifyCodeView());
                      },
                    ),
                    86.ph,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Have an account?  ',
                          style: theme.titleSmall!.copyWith(fontSize: 12.sp),
                        ),
                        GestureDetector(
                          onTap: () {
                            context.nextScreen(LoginView());
                          },
                          child: Text(
                            'Login',
                            textAlign: TextAlign.center,
                            style: theme.titleMedium!.copyWith(
                              fontSize: 12.sp,
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
