import 'package:cosmetics/core/style/app_colors.dart';
import 'package:cosmetics/core/style/text_styles.dart';
import 'package:cosmetics/core/utils/app_images.dart';
import 'package:cosmetics/core/utils/utils.dart';
import 'package:cosmetics/core/widgets/button_widget.dart';
import 'package:cosmetics/core/widgets/custom_text_form_filed.dart';
import 'package:cosmetics/features/login/presentatin/view/widgets/country_code.dart';
import 'package:flutter/material.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  TextEditingController phone = TextEditingController();
  final TextEditingController password = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                Column(
                  children: [
                    35.ph,
                    Image.asset(Assets.assetsImagesLoginLogo, height: 220),
                    20.ph,
                    Text("Login Now", style: TextStyles.textStyle24Bold),
                    10.ph,
                    Text(
                      "Please enter the details below to continue",
                      style: TextStyles.textStyle14.copyWith(
                        color: AppColors.hint_text,
                      ),
                    ),
                    20.ph,
                    Row(
                      children: [
                        SizedBox(width: 73, child: CountryCodeDropdown()),
                        10.pw,
                        Expanded(
                          child: CustomTextFormFiled(
                            label: "Phone Number",
                            controller: phone,
                            hintText: "Phone Number",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter your phone number";
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                
                    9.ph,
                    CustomTextFormFiled(
                      label: "Password",
                      controller: password,
                      hintText: "Password",
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your password";
                        }
                        return null;
                      },
                    ),
                    11.ph,
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Forget Password?",
                        style: TextStyles.textStyle12.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                    43.ph,
                    ButtonWidget(
                      title: "Login",
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          // Perform login action
                        }
                      },
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
