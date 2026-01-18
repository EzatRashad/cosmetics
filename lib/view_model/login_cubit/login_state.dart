
import 'package:cosmetics/models/user_model.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final UserModel userModel;
  LoginSuccess(this.userModel);
}

class LoginError extends LoginState {
  final String message;
  LoginError(this.message);
}

class GetCountriesLoading extends LoginState {}

class GetCountriesSuccess extends LoginState {
  final List<String> countries;
  GetCountriesSuccess(this.countries);
}

class GetCountriesError extends LoginState {
  final String message;
  GetCountriesError(this.message);
}
class CountryCodeChanged extends LoginState {
  final String selectedCode;
  CountryCodeChanged(this.selectedCode);
}

