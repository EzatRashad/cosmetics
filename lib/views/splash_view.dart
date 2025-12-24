import 'package:cosmetics/core/style/app_colors.dart';
import 'package:cosmetics/core/utils/navigate.dart';
import 'package:cosmetics/core/widgets/custom_image_widget.dart';
import 'package:cosmetics/views/onboarding_view.dart';
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

  @override
  void initState() {
    super.initState();

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
      context.nextScreen(const OnboardingView(), replacment: true);
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
              CustomImageWidget(
                imageName: "splash_logo.png",
                width: 140.w,
                height: 140.h,
              ),
              SizedBox(height: 12),
              CustomImageWidget(
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
