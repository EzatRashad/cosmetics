import 'package:cosmetics/core/constants/consts.dart';
import 'package:cosmetics/core/error/api_error.dart';
import 'package:cosmetics/core/services/dio_helper.dart';
import 'package:cosmetics/view_model/otp_cubit/oto_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit() : super(OtpInitial());

  Future<void> verifyOtp({
    required String countryCode,
    required String phoneNumber,
    required String otpCode,
  }) async {
    emit(OtpLoading());
    try {
      final response = await DioHelper.postData(
        url: otpEndpoint,
        data: {
          'countryCode': countryCode,
          'phoneNumber': phoneNumber,
          "otpCode": otpCode,
        },
      );
      emit(OtpSuccess(message: response.data['message']));
    } on ApiError catch (error) {
      emit(OtpError(message: error.message));
    }
  }

  Future<void> resendOtp({
    required String countryCode,
    required String phoneNumber,
  }) async {
    emit(ResendOtpLoading());
    try {
      final response = await DioHelper.postData(
        url: resendOtpEndpoint,
        data: {'countryCode': countryCode, 'phoneNumber': phoneNumber},
      );
      emit(ResendOtpSuccess(message: response.data['message']));
    } on ApiError catch (error) {
      emit(ResendOtpError(message: error.message));
    }
  }
}
