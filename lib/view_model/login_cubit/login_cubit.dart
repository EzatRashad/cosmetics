import 'package:cosmetics/core/constants/consts.dart';
import 'package:cosmetics/core/error/api_error.dart';
import 'package:cosmetics/core/services/dio_helper.dart';
import 'package:cosmetics/models/user_model.dart';
import 'package:cosmetics/view_model/login_cubit/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

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

  Future<void> login({
    required String countryCode,
    required String phoneNumber,
    required String password,
  }) async {
    emit(LoginLoading());

    try {
      final response = await DioHelper.postData(
        url: loginEndpoint,
        data: {
          "countryCode": countryCode,
          "phoneNumber": phoneNumber,
          "password": password,
        },
      );
      UserModel userModel = UserModel.fromJson(response.data);

      emit(LoginSuccess(userModel));
    } on ApiError catch (error) {
      emit(LoginError(error.message));
    }
  }
}
