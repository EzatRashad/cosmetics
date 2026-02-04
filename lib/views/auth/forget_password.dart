import 'package:cosmetics/core/utils/navigate.dart';
import 'package:cosmetics/core/utils/utils.dart';
import 'package:cosmetics/core/utils/validatio.dart';
import 'package:cosmetics/core/widgets/app_image.dart';
import 'package:cosmetics/core/widgets/app_button.dart';
import 'package:cosmetics/core/widgets/app_input.dart';
import 'package:cosmetics/view_model/forget_password/forget_password_cubit.dart';
import 'package:cosmetics/view_model/forget_password/forget_password_state.dart';
import 'package:cosmetics/views/auth/login/widgets/country_code.dart';
import 'package:cosmetics/views/auth/verify_code/verify_code_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  final phone = TextEditingController();

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
                        Text("Forget Password", style: theme.titleLarge),
                        40.ph,
                        Text(
                          textAlign: TextAlign.center,
                          "Please enter your phone number below to recovery your password.",
                          style: theme.titleSmall,
                        ),
                        50.ph,
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child: CountryCodeDropdown(
                                codes: cubit.countries,
                                initialValue: cubit.selectedCountryCode,
                                onChanged: (val) =>
                                    cubit.changeCountryCode(val ?? "+20"),
                              ),
                            ),
                            10.pw,
                            Expanded(
                              flex: 3,
                              child: AppInput(
                                label: "Phone Number",
                                controller: phone,
                                validator: Validation.validatePhone,
                              ),
                            ),
                          ],
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
                                    cubit.forgetPassword(
                                      countryCode: cubit.selectedCountryCode,
                                      phoneNumber: phone.text,
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
              if (state is ForgetPasswordSuccess) {
                context.showSnackBar(message: state.message);
                context.nextScreen(
                  VerifyCodeView(
                    phoneNumber: phone.text,
                    isForgetPassword: true,
                    code: context
                        .read<ForgetPasswordCubit>()
                        .selectedCountryCode,
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
