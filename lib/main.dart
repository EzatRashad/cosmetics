import 'package:cosmetics/core/style/app_theme.dart';
import 'package:cosmetics/views/cart/cart_view.dart';
import 'package:cosmetics/views/cart/widgets/checkout_view_body.dart';
import 'package:cosmetics/views/layout/presentation/view/layout_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: AppTheme.currentTheme,

          home: LayoutView(),
        );
      },
    );
  }
}
