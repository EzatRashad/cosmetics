 import 'package:cosmetics/view_model/register_cubit/register_cubit.dart';
import 'package:cosmetics/views/auth/create_account/widgets/create_account_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateAccountView extends StatelessWidget {
  const CreateAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (_) => RegisterCubit()..getCountries(),
  child: CreateAccountViewBody(),
);

  }
}