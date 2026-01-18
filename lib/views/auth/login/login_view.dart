import 'package:cosmetics/view_model/login_cubit/login_cubit.dart';
import 'package:cosmetics/views/auth/login/widgets/login_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit()..getCountries(),
      child: LoginViewBody(),
    );
  }
}
