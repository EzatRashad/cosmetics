import 'package:cosmetics/core/constants/api_constants.dart';
import 'package:cosmetics/core/error/api_error.dart';
import 'package:cosmetics/core/services/dio_helper.dart';
import 'package:cosmetics/view_model/register_cubit/regiser_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);

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

  Future<void> register({
    required String username,
    required String countryCode,
    required String phoneNumber,
    required String email,
    required String password,
  }) async {
    emit(RegisterLoading());

    try {
      final response = await DioHelper.postData(
        url: registerEndpoint,
        data: {
          "username": username,
          "countryCode": countryCode,
          "phoneNumber": phoneNumber,
          "email": email,
          "password": password,
        },
      );

      emit(RegisterSuccess(response.data['message']));
    } on ApiError catch (error) {
      emit(RegisterError(error.message));
    }
  }
}
