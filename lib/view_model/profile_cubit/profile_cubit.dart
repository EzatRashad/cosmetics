import 'package:cosmetics/core/constants/consts.dart';
import 'package:cosmetics/core/error/api_error.dart';
import 'package:cosmetics/core/services/cashe_helper.dart';
import 'package:cosmetics/core/services/dio_helper.dart';
import 'package:cosmetics/models/profile_model.dart';
import 'package:cosmetics/view_model/profile_cubit/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(GetProfileInitialState());

  static ProfileCubit get(context) => BlocProvider.of(context);

  Future<void> getProfile() async {
    emit(GetProfileLoading());

    try {
      final response = await DioHelper.getData(url: getProfileEndpoint);

      final profile = ProfileModel.fromJson(response.data);
      emit(GetProfileSuccess(profile));
    } on ApiError catch (error) {
      emit(GetProfileError(error.message));
    }
  }

  Future<void> logout() async {
    emit(LogoutLoading());

    try {
      final response = await DioHelper.postData(url: logoutEndpoint);
      await CasheHelper.saveData(key: logedK, value: false);
      await CasheHelper.saveData(key: tokenK, value: "");
      await CasheHelper.saveData(key: posK, value: "");
      await CasheHelper.saveData(key: latk, value: 0);
      await CasheHelper.saveData(key: longk, value: 0);

      emit(LogoutSuccess(response.data['message']));
    } on ApiError catch (error) {
      emit(LogoutError(error.message));
    }
  }

  Future<void> updateProfile({
    required String username,
    required String phoneNumber,
    required String email,
  }) async {
    emit(UpdateProfileLoading());

    try {
      final response = await DioHelper.put(
        url: updateProfileEndpoint,
        data: {
          "username": username,
          "phoneNumber": phoneNumber,
          "email": email,
        },
      );

      //await getProfile();
      emit(UpdateProfileSuccess(response.data['message']));
    } on ApiError catch (error) {
      emit(UpdateProfileError(error.message));
    }
  }
}
