import 'package:cosmetics/models/profile_model.dart';

abstract class ProfileState {}

class GetProfileInitialState extends ProfileState {}

class GetProfileLoading extends ProfileState {}

class GetProfileSuccess extends ProfileState {
  final ProfileModel profileModel;
  GetProfileSuccess(this.profileModel);
}

class GetProfileError extends ProfileState {
  final String error;
  GetProfileError(this.error);
}

class LogoutLoading extends ProfileState {}

class LogoutSuccess extends ProfileState {
  final String message;
  LogoutSuccess(this.message);
}

class LogoutError extends ProfileState {
  final String error;
  LogoutError(this.error);
}

class UpdateProfileLoading extends ProfileState {}

class UpdateProfileSuccess extends ProfileState {
  final String message;
  UpdateProfileSuccess(this.message);
}

class UpdateProfileError extends ProfileState {
  final String error;
  UpdateProfileError(this.error);
}
