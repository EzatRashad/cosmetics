
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {
  final String message;
  RegisterSuccess(this.message);
}

class RegisterError extends RegisterState {
  final String message;
  RegisterError(this.message);
}

class GetCountriesLoading extends RegisterState {}

class GetCountriesSuccess extends RegisterState {
  final List<String> countries;
  GetCountriesSuccess(this.countries);
}

class GetCountriesError extends RegisterState {
  final String message;
  GetCountriesError(this.message);
}
class CountryCodeChanged extends RegisterState {
  final String selectedCode;
  CountryCodeChanged(this.selectedCode);
}

