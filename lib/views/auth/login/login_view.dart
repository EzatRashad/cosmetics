import 'package:cosmetics/core/constants/api_constants.dart';
import 'package:cosmetics/core/error/api_error.dart';
import 'package:cosmetics/core/services/cashe_helper.dart';
import 'package:cosmetics/core/services/dio_helper.dart';
import 'package:cosmetics/core/style/app_colors.dart';
import 'package:cosmetics/core/utils/navigate.dart';
import 'package:cosmetics/core/utils/utils.dart';
import 'package:cosmetics/core/widgets/app_button.dart';
import 'package:cosmetics/core/widgets/App_image.dart';
import 'package:cosmetics/core/widgets/app_input.dart';
import 'package:cosmetics/core/widgets/login_or_register.dart';
import 'package:cosmetics/models/user_model.dart';
import 'package:cosmetics/views/auth/create_account/create_account_view.dart';
import 'package:cosmetics/views/auth/forget_password.dart';
import 'package:cosmetics/views/auth/login/widgets/country_code.dart';
import 'package:cosmetics/views/layout/presentation/view/layout_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => LoginViewState();
}

class LoginViewState extends State<LoginView> {
  final phone = TextEditingController();
  final password = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Status loginStatus = Status.initial;
  Status getCountriesStatus = Status.initial;

  List<String> countries = [];
  String selectedCountryCode = "+20";
  String? errorMessage;
  bool isPasswordVisible = true;

  @override
  void initState() {
    super.initState();
    getCountries();
  }

  Future<void> getCountries() async {
    getCountriesStatus = Status.loading;
    try {
      final response = await DioHelper.getData(url: countryCodesEndpoint);

      setState(() {
        countries = List<String>.from(response.data.map((e) => e['code']));
        getCountriesStatus = Status.success;
      });
    } catch (e) {
      getCountriesStatus = Status.error;
    }
  }

  Future<void> login() async {
    setState(() {
      loginStatus = Status.loading;
    });

    try {
      final response = await DioHelper.postData(
        url: loginEndpoint,
        data: {
          "countryCode": selectedCountryCode,
          "phoneNumber": phone.text,
          "password": password.text,
        },
      );

      final user = UserModel.fromJson(response.data);

      CasheHelper.saveData(key: logedK, value: true);
      CasheHelper.saveData(key: tokenK, value: user.token);
      token = user.token;

      setState(() {
        loginStatus = Status.success;
      });

      context.showSnackBar(
        message: "Login Success ${user.user?.username}",
        backgroundColor: Colors.green,
        textColor: Colors.white,
      );

      context.nextScreen(const LayoutView(), remove: true);
    } on ApiError catch (e) {
      setState(() {
        loginStatus = Status.error;
        errorMessage = e.message;
      });

      context.showSnackBar(
        message: e.message,
        backgroundColor: AppColors.error,
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
                  children: [
                    Expanded(
                      flex: 1,
                      child: getCountriesStatus == Status.loading
                          ? CircularProgressIndicator()
                          : getCountriesStatus == Status.error
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
                      child: AppInput(label: "Phone Number", controller: phone),
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
                  child: GestureDetector(
                    onTap: () {
                      context.nextScreen(ForgetPasswordView());
                    },
                    child: Text(
                      "Forget Password?",
                      style: theme.titleSmall!.copyWith(
                        color: AppColors.error,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                ),

                43.ph,

                
                loginStatus == Status.loading
                    ? const Center(child: CircularProgressIndicator())
                    : AppButton(
                        width: 250.w,
                        height: 56.h,
                        radius: 24.r,
                        title: "Login",
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            login();
                          }
                        },
                      ),

                30.ph,
                LoginOrRegister(
                  text1: "Don’t have an account?  ",
                  text2: "Register",
                  widget: const CreateAccountView(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
