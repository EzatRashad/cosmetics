import 'package:cosmetics/core/functions/on_generate_route.dart';
import 'package:cosmetics/core/style/app_colors.dart';
import 'package:cosmetics/features/splash/presentation/view/splash_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background
      ),

       onGenerateRoute: onGenerateRoute,
      initialRoute: SplashView.routeName,
    );
  }
}
