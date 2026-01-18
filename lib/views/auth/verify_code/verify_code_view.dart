import 'package:cosmetics/view_model/otp_cubit/otp_cubit.dart';
import 'package:cosmetics/views/auth/verify_code/widgets/verify_code_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyCodeView extends StatelessWidget {
  const VerifyCodeView({super.key, required this.phoneNumber, required this.code});
  final String phoneNumber;
  final String code;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OtpCubit(),
      child:  VerifyCodeViewBody(
        phoneNumber: phoneNumber, code: code,
      ),
      
    );
  }
}