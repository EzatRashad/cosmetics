import 'package:cosmetics/core/style/app_colors.dart';
import 'package:cosmetics/core/utils/app_images.dart';
import 'package:cosmetics/core/utils/navigate.dart';
import 'package:cosmetics/core/utils/utils.dart';
import 'package:cosmetics/core/widgets/button_widget.dart';
import 'package:cosmetics/core/widgets/custom_text_form_filed.dart';
import 'package:cosmetics/features/create_account/presentation/view/create_account_view.dart';
import 'package:cosmetics/features/login/presentatin/view/widgets/country_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
          padding: const EdgeInsets.symmetric(horizontal: 13),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                Column(
                  children: [
                    48.ph,
                    Image.asset(Assets.assetsImagesLoginLogo, height: 227),
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
                          width: 73,
                          height: 46,
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
                      suffixIcon: SvgPicture.asset(
                        Assets.assetsImagesVisibilyOff,
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
                          fontSize: 12,
                        ),
                      ),
                    ),
                    43.ph,

                    ButtonWidget(
                      width: 250,
                      height: 56,
                      radius: 24,
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
                          style: theme.titleSmall!.copyWith(fontSize: 12),
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
