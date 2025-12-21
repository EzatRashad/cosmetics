import 'package:cosmetics/core/style/app_colors.dart';
import 'package:cosmetics/core/utils/app_images.dart';
import 'package:cosmetics/core/utils/navigate.dart';
import 'package:cosmetics/features/onboarding/presentation/view/onboarding_view.dart';
import 'package:flutter/material.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

     
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
        child: FadeTransition(
          opacity: _animation,
          child: ScaleTransition(
            scale: Tween<double>(begin: 0.85, end: 1.0).animate(_animation),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage(Assets.assetsImagesSplashLogo),
                  width: 140,
                  height: 140,
                ),
                Image(
                  image: AssetImage(Assets.assetsImagesSplashText),
                  width: 100,
                  height: 46,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
