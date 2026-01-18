import 'package:cosmetics/core/style/app_colors.dart';
import 'package:cosmetics/core/utils/navigate.dart';
import 'package:cosmetics/core/utils/utils.dart';
import 'package:cosmetics/core/widgets/button_widget.dart';
import 'package:cosmetics/core/widgets/custom_image_widget.dart';
import 'package:cosmetics/core/widgets/app_input.dart';
import 'package:cosmetics/core/widgets/login_or_register.dart';
import 'package:cosmetics/view_model/login_cubit/login_cubit.dart';
import 'package:cosmetics/view_model/login_cubit/login_state.dart';
import 'package:cosmetics/views/auth/create_account/create_account_view.dart';
import 'package:cosmetics/views/auth/login/widgets/country_code.dart';
import 'package:cosmetics/views/layout/presentation/view/layout_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  bool isPasswordVisible = true;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 13.w),
          child: BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginError) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.message)));
              }
              if (state is LoginSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      "Login Success ${state.userModel.user?.username}",
                    ),
                  ),
                );
                context.nextScreen(LayoutView(), remove: true);
              }
            },
            builder: (context, state) {
              var cubit = LoginCubit.get(context);

              return Form(
                key: _formKey,
                child: ListView(
                  children: [
                    48.ph,
                    AppImage(imageName: "login_logo.png", height: 227.h),
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
                          ),
                        ),
                      ],
                    ),

                    8.ph,
                    AppInput(
                      label: "Password",
                      controller: password,
                      obscureText: isPasswordVisible,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                        child: AppImage(
                          imageName: isPasswordVisible
                              ? "visibily_off.svg"
                              : "visiblily.svg",
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                    12.ph,
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Text(
                        "Forget Password?",
                        style: theme.titleSmall!.copyWith(
                          color: AppColors.error,
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                    43.ph,

                    state is LoginLoading
                        ? const Center(child: CircularProgressIndicator())
                        : ButtonWidget(
                            width: 250.w,
                            height: 56.h,
                            radius: 24.r,
                            title: "Login",
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                cubit.login(
                                  countryCode: cubit.selectedCountryCode,
                                  phoneNumber: phone.text,
                                  password: password.text,
                                );
                              }
                            },
                          ),
                    30.ph,
                    LoginOrRegister(
                      text1: "Don’t have an account?  ",
                      text2: "Register",
                      widget: CreateAccountView(),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
