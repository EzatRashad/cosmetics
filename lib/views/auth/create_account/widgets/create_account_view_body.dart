import 'package:cosmetics/core/utils/navigate.dart';
import 'package:cosmetics/core/utils/utils.dart';
import 'package:cosmetics/core/utils/validatio.dart';
import 'package:cosmetics/core/widgets/button_widget.dart';
import 'package:cosmetics/core/widgets/custom_image_widget.dart';
import 'package:cosmetics/core/widgets/app_input.dart';
import 'package:cosmetics/core/widgets/login_or_register.dart';
import 'package:cosmetics/view_model/register_cubit/regiser_state.dart';
import 'package:cosmetics/view_model/register_cubit/register_cubit.dart';
import 'package:cosmetics/views/auth/login/login_view.dart';
import 'package:cosmetics/views/auth/login/widgets/country_code.dart';
import 'package:cosmetics/views/auth/verify_code/verify_code_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateAccountViewBody extends StatefulWidget {
  const CreateAccountViewBody({super.key});

  @override
  State<CreateAccountViewBody> createState() => _CreateAccountViewBodyState();
}

class _CreateAccountViewBodyState extends State<CreateAccountViewBody> {
  final phone = TextEditingController();

  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final confirm_password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String countryCode = "+02";
  bool isPasswordVisible1 = true;
  bool isPasswordVisible2 = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 13.w),
          child: BlocConsumer<RegisterCubit, RegisterState>(
            listener: (context, state) {
              if (state is RegisterError) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.message)));
              }
              if (state is RegisterSuccess) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.message)));
                context.nextScreen(
                  VerifyCodeView(
                    phoneNumber: phone.text,
                    code: context.read<RegisterCubit>().selectedCountryCode,
                  ),
                );
              }
            },
            builder: (context, state) {
              var cubit = RegisterCubit.get(context);
              return Form(
                key: _formKey,
                child: ListView(
                  children: [
                    40.ph,
                    AppImage(
                      imageName: "splash_logo.png",
                      width: 67.w,
                      height: 100,
                    ),
                    35.ph,
                    Text("Create Account", style: theme.titleLarge),
                    50.ph,
                    AppInput(
                      label: "Your Name",
                      controller: name,
                      validator: (value) => Validation.validateName(value),
                    ),
                    10.ph,
                    AppInput(
                      label: "Email",
                      controller: email,
                      validator: (value) => Validation.validateEmail(value),
                    ),
                    10.ph,
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
                            validator: (value) =>
                                Validation.validatePhone(value),
                          ),
                        ),
                      ],
                    ),
                    10.ph,
                    AppInput(
                      label: "Password",
                      controller: password,
                      obscureText: isPasswordVisible1,
                      validator: (value) => Validation.validatePassword(value),
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
                      controller: confirm_password,
                      obscureText: isPasswordVisible2,
                      validator: (value) => Validation.validateConfirmPassword(
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
                    89.ph,
                    state is RegisterLoading
                        ? const Center(child: CircularProgressIndicator())
                        : ButtonWidget(
                            width: 250.w,
                            height: 56.h,
                            radius: 24.r,
                            title: "Next",
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                              cubit.register(
                                  username: name.text,
                                  countryCode: countryCode,
                                  phoneNumber: phone.text,
                                  email: email.text,
                                  password: password.text,
                                );
                              }
                            },
                          ),

                    30.ph,
                    LoginOrRegister(
                      text1: "Have an account?  ",
                      text2: "Login",
                      widget: LoginView(),
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
