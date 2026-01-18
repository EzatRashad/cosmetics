import 'dart:developer';

import 'package:cosmetics/core/constants/api_constants.dart';
import 'package:cosmetics/core/services/cashe_helper.dart';
import 'package:cosmetics/core/services/dio_helper.dart';
import 'package:cosmetics/core/style/app_theme.dart';
import 'package:cosmetics/views/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  await CasheHelper.init();
  token = CasheHelper.getData(key: tokenK);
  log(token??"token is null");

  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          home: child,
        );
      },
      child: const SplashView(),
    );
  }
}
