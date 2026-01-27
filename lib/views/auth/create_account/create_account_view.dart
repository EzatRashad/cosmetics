import 'package:cosmetics/core/constants/api_constants.dart';
import 'package:cosmetics/core/error/api_error.dart';
import 'package:cosmetics/core/services/dio_helper.dart';
import 'package:cosmetics/core/utils/navigate.dart';
import 'package:cosmetics/core/utils/utils.dart';
import 'package:cosmetics/core/utils/validatio.dart';
import 'package:cosmetics/core/widgets/app_button.dart';
import 'package:cosmetics/core/widgets/App_image.dart';
import 'package:cosmetics/core/widgets/app_input.dart';
import 'package:cosmetics/core/widgets/login_or_register.dart';
import 'package:cosmetics/views/auth/login/login_view.dart';
import 'package:cosmetics/views/auth/login/widgets/country_code.dart';
import 'package:cosmetics/views/auth/verify_code/verify_code_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateAccountView extends StatefulWidget {
  const CreateAccountView({super.key});

  @override
  State<CreateAccountView> createState() => CreateAccountViewState();
}

class CreateAccountViewState extends State<CreateAccountView> {
  final phone = TextEditingController();
  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  final formKey = GlobalKey<FormState>();

  AppStatus registerStatus = AppStatus.initial;
  AppStatus getCountriesStatus = AppStatus.initial;

  List<String> countries = [];
  String selectedCountryCode = "+20";

  bool isPasswordVisible1 = true;
  bool isPasswordVisible2 = true;

  @override
  void initState() {
    super.initState();
    getCountries();
  }

  Future<void> getCountries() async {
    setState(() {
      getCountriesStatus = AppStatus.loading;
    });
    try {
      final response = await DioHelper.getData(url: countryCodesEndpoint);

      setState(() {
        countries = [];
        countries = List<String>.from(response.data.map((e) => e['code']));
        getCountriesStatus = AppStatus.success;
      });
    } catch (e) {
      setState(() {
        getCountriesStatus = AppStatus.error;
      });
    }
  }

  Future<void> register() async {
    setState(() {
      registerStatus = AppStatus.loading;
    });

    try {
      final response = await DioHelper.postData(
        url: registerEndpoint,
        data: {
          "username": name.text,
          "countryCode": selectedCountryCode,
          "phoneNumber": phone.text,
          "email": email.text,
          "password": password.text,
        },
      );

      setState(() {
        registerStatus = AppStatus.success;
      });

      context.showSnackBar(
        message: response.data['message'],
        backgroundColor: Colors.green,
        textColor: Colors.white,
      );

      context.nextScreen(
        VerifyCodeView(phoneNumber: phone.text, code: selectedCountryCode),
      );
    } on ApiError catch (e) {
      setState(() {
        registerStatus = AppStatus.error;
      });

      context.showSnackBar(
        message: e.message,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 13.w),
          child: Form(
            key: formKey,
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
                  validator: Validation.validateName,
                ),
                10.ph,

                AppInput(
                  label: "Email",
                  controller: email,
                  validator: Validation.validateEmail,
                ),
                10.ph,

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: getCountriesStatus == AppStatus.loading
                          ? CircularProgressIndicator()
                          : getCountriesStatus == AppStatus.error
                          ? IconButton(
                              onPressed: () => getCountries(),
                              icon: Icon(Icons.replay_outlined),
                            )
                          : CountryCodeDropdown(
                              codes: countries,
                              initialValue: selectedCountryCode,
                              onChanged: (val) {
                                setState(() {
                                  selectedCountryCode = val ?? "+20";
                                });
                              },
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

                10.ph,

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
                      Validation.validateConfirmPassword(password.text, value),
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

                registerStatus == AppStatus.loading
                    ? const Center(child: CircularProgressIndicator())
                    : AppButton(
                        width: 250.w,
                        height: 56.h,
                        radius: 24.r,
                        title: "Next",
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            register();
                          }
                        },
                      ),

                30.ph,

                LoginOrRegister(
                  text1: "Have an account?  ",
                  text2: "Login",
                  widget: const LoginView(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
