abstract class OtpState {}

class OtpInitial extends OtpState {}

class OtpLoading extends OtpState {}

class OtpSuccess extends OtpState {
  final String message;

  OtpSuccess({required this.message});
}

class OtpError extends OtpState {
  final String message;

  OtpError({required this.message});
}

class ResendOtpLoading extends OtpState {}

class ResendOtpSuccess extends OtpState {
  final String message;

  ResendOtpSuccess({required this.message});
}

class ResendOtpError extends OtpState {
  final String message;

  ResendOtpError({required this.message});
}
