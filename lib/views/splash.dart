import 'package:cosmetics/core/constants/api_constants.dart';
import 'package:cosmetics/core/services/cashe_helper.dart';
import 'package:cosmetics/core/style/app_colors.dart';
import 'package:cosmetics/core/utils/navigate.dart';
import 'package:cosmetics/core/widgets/App_image.dart';
import 'package:cosmetics/views/auth/login/login_view.dart';
import 'package:cosmetics/views/layout/presentation/view/layout_view.dart';
import 'package:cosmetics/views/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  bool loged = false;
  bool onBoardingSkip = false;

  @override
  void initState() {
    super.initState();
    loged = CasheHelper.getData(key: logedK)??false;
    onBoardingSkip = CasheHelper.getData(key: skipOnboardingK)??false;
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
    );

    _controller.forward();

    Future.delayed(const Duration(seconds: 1), () {
      context.nextScreen(
        loged
            ? const LayoutView()
            : onBoardingSkip
            ? const LoginView()
            : const OnboardingView(),
        remove: true,
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: ScaleTransition(
          scale: Tween<double>(begin: 0.85, end: 1.0).animate(_scaleAnimation),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppImage(
                imageName: "splash_logo.png",
                width: 140.w,
                height: 140.h,
              ),
              SizedBox(height: 12),
              AppImage(
                imageName: "splash_text.png",
                width: 100.w,
                height: 46.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
