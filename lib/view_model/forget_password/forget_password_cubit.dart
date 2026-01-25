import 'package:cosmetics/core/constants/api_constants.dart';
import 'package:cosmetics/core/error/api_error.dart';
import 'package:cosmetics/core/services/dio_helper.dart';
import 'package:cosmetics/view_model/forget_password/forget_password_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit() : super(ForgetPasswordInitial());

  static ForgetPasswordCubit get(context) => BlocProvider.of(context);

  List<String> countries = [];
  String selectedCountryCode = "+20";

  void changeCountryCode(String code) {
    selectedCountryCode = code;
    emit(CountryCodeChanged(code));
  }

  Future<void> getCountries() async {
    emit(GetCountriesLoading());

    try {
      final response = await DioHelper.getData(url: countryCodesEndpoint);
      countries.clear();
      countries = List<String>.from(response.data.map((e) => e['code']));

      emit(GetCountriesSuccess(countries));
    } on ApiError catch (error) {
      emit(GetCountriesError(error.message));
    }
  }

  Future<void> forgetPassword({
    required String countryCode,
    required String phoneNumber,
  }) async {
    emit(ForgetPasswordLoading());

    try {
      final response = await DioHelper.postData(
        url: forgetPasswordEndpoint,
        data: {"countryCode": countryCode, "phoneNumber": phoneNumber},
      );

      emit(ForgetPasswordSuccess(response.data['message']));
    } on ApiError catch (error) {
      emit(ForgetPasswordError(error.message));
    }
  }

  Future<void> resetPassword({
    required String countryCode,
    required String phoneNumber,
    required String newPassword,
    required String confirmPassword,
  }) async {
    emit(ResetPasswordLoading());

    try {
      final response = await DioHelper.postData(
        url: resetPasswordEndpoint,
        data: {
          "countryCode": countryCode,
          "phoneNumber": phoneNumber,
          "newPassword": newPassword,
          "confirmPassword": confirmPassword,
        },
      );

      emit(ResetPasswordSuccess(response.data['message']));
    } on ApiError catch (error) {
      emit(ResetPasswordError(error.message));
    }
  }
}
