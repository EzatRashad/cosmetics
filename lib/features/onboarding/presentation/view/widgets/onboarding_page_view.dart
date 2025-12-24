import 'package:cosmetics/features/onboarding/presentation/view/widgets/onboarding_page_view_item.dart';
import 'package:flutter/material.dart';

class OnboardingPageView extends StatelessWidget {
  const OnboardingPageView({super.key, required this.pageController});
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        OnboardingPageViewItem(
          image: "on_borading_one.png",
          title: "WELCOME",
          subTitle:
              "Makeup has the power to transform your mood and empowers you to be a more confident person.",
        ),
        OnboardingPageViewItem(
          image: "on_borading_two.png",
          title: "SEARCH & PICK",
          subTitle:
              "We have dedicated set of products and routines hand picked for every skin type.",
        ),
        OnboardingPageViewItem(
          image: "on_borading_three.png",
          title: "PUCH NOTIFICATIONS",
          subTitle:
              "Allow notifications for new makeup & cosmetics offers.",
        ),
      ],
    );
  }
}
