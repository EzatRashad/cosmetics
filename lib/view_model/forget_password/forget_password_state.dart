abstract class ForgetPasswordState {}

class ForgetPasswordInitial extends ForgetPasswordState {}

class ForgetPasswordLoading extends ForgetPasswordState {}

class ForgetPasswordSuccess extends ForgetPasswordState {
  final String message;
  ForgetPasswordSuccess(this.message);
}

class ForgetPasswordError extends ForgetPasswordState {
  final String message;
  ForgetPasswordError(this.message);
}

class GetCountriesLoading extends ForgetPasswordState {}

class GetCountriesSuccess extends ForgetPasswordState {
  final List<String> countries;
  GetCountriesSuccess(this.countries);
}

class GetCountriesError extends ForgetPasswordState {
  final String message;
  GetCountriesError(this.message);
}

class CountryCodeChanged extends ForgetPasswordState {
  final String selectedCode;
  CountryCodeChanged(this.selectedCode);
}

class ResetPasswordLoading extends ForgetPasswordState {}

class ResetPasswordSuccess extends ForgetPasswordState {
  final String message;
  ResetPasswordSuccess(this.message);
}

class ResetPasswordError extends ForgetPasswordState {
  final String message;
  ResetPasswordError(this.message);
}
