import 'package:cosmetics/view_model/auth/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/services/cashe_helper.dart';
import '../../core/constants/api_constants.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthAuthenticated());

  void logout() async {
    token = "";
    await CasheHelper.saveData(key: logedK, value: false);
    await CasheHelper.saveData(key: tokenK, value: "");
    emit(AuthUnauthenticated());
  }
}
