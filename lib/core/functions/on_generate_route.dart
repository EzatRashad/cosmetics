import 'package:cosmetics/features/onboarding/presentation/view/onboarding_view.dart';
import 'package:cosmetics/features/splash/presentation/view/splash_view.dart';
import 'package:flutter/material.dart'; 

Route onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (_) => const SplashView());
      case OnboardingView.routeName:
      return MaterialPageRoute(builder: (_) => const OnboardingView());

    default:
      return MaterialPageRoute(builder: (_) => const Scaffold());
  }
}
//    Navigator.pushReplacementNamed(context, LoginView.routeName);
//Navigator.pushNamed(context, SignupView.routeName);
