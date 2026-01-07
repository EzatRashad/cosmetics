import 'package:cosmetics/core/utils/navigate.dart';
import 'package:cosmetics/core/utils/utils.dart';
import 'package:cosmetics/core/widgets/button_widget.dart';
import 'package:cosmetics/core/widgets/custom_image_widget.dart';
import 'package:cosmetics/core/widgets/custom_text_form_filed.dart';
import 'package:cosmetics/core/widgets/login_or_register.dart';
import 'package:cosmetics/views/auth/login/login_view.dart';
import 'package:cosmetics/views/auth/login/widgets/country_code.dart';
import 'package:cosmetics/views/auth/verify_code/verify_code_view.dart';
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
  bool isPasswordVisible1 = true;
  bool isPasswordVisible2 = true;

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
                40.ph,
                CustomImageWidget(
                  imageName: "splash_logo.png",
                  width: 67.w,
                  height: 100,
                ),
                35.ph,
                Text("Create Account", style: theme.titleLarge),
                50.ph,
                CustomTextFormFiled(label: "Your Name", controller: name),
                10.ph,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 1, child: CountryCodeDropdown()),
                    10.pw,
                    Expanded(
                      flex: 3,
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
                  obscureText: isPasswordVisible1,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        isPasswordVisible1 = !isPasswordVisible1;
                      });
                    },
                    child: CustomImageWidget(
                      imageName: isPasswordVisible1
                          ? "visibily_off.svg"
                          : "visiblily.svg",
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
                10.ph,
                CustomTextFormFiled(
                  label: "Confirm Password",
                  controller: confirm_password,
                  obscureText: isPasswordVisible2,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        isPasswordVisible2 = !isPasswordVisible2;
                      });
                    },
                    child: CustomImageWidget(
                      imageName: isPasswordVisible2
                          ? "visibily_off.svg"
                          : "visiblily.svg",
                      fit: BoxFit.scaleDown,
                    ),
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
                LoginOrRegister(
                  text1: "Have an account?  ",
                  text2: "Login",
                  widget: LoginView(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
