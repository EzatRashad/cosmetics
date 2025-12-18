import 'package:cosmetics/core/style/app_colors.dart';
import 'package:cosmetics/core/style/text_styles.dart';
import 'package:cosmetics/core/utils/app_images.dart';
import 'package:cosmetics/core/utils/navigate.dart';
import 'package:cosmetics/core/utils/utils.dart';
import 'package:cosmetics/core/widgets/button_widget.dart';
import 'package:cosmetics/core/widgets/custom_text_form_filed.dart';
import 'package:cosmetics/features/create_account/presentation/view/create_account_view.dart';
import 'package:cosmetics/features/login/presentatin/view/login_view.dart';
import 'package:cosmetics/features/login/presentatin/view/widgets/country_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
                    40.ph,
                    Image.asset(Assets.assetsImagesSplashLogo, width: 67),
                    35.ph,
                    Text("Create Account", style: TextStyles.textStyle24Bold),
                    50.ph,
                    CustomTextFormFiled(label: "Your Name", controller: name),
                    10.ph,
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
                    10.ph,
                    CustomTextFormFiled(
                      label: "Password",
                      controller: password,
                      obscureText: true,
                      suffixIcon: SvgPicture.asset(
                        Assets.assetsImagesVisibilyOff,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    10.ph,
                    CustomTextFormFiled(
                      label: "Confirm Password",
                      controller: confirm_password,
                      obscureText: true,
                      suffixIcon: SvgPicture.asset(
                        Assets.assetsImagesVisibilyOff,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    89.ph,
                    ButtonWidget(
                      width: 250,
                      height: 56,
                      radius: 24,
                      title: "Next",
                      onTap: () {
                        //context.nextScreen(  )
                      },
                    ),
                    86.ph,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Have an account?  ',
                          style: TextStyles.textStyle12.copyWith(
                            color: AppColors.secondary,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            context.nextScreen(LoginView());
                          },
                          child: Text(
                            'Login',
                            textAlign: TextAlign.center,
                            style: TextStyles.textStyle12.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w600,
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
