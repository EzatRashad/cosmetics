import 'package:cosmetics/core/utils/app_images.dart';
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
          image: Assets.assetsImagesOnBoradingOne,
          title: "WELCOME",
          subTitle:
              "Makeup has the power to transform your mood and empowers you to be a more confident person.",
        ),
        OnboardingPageViewItem(
          image: Assets.assetsImagesOnBoradingTwo,
          title: "SEARCH & PICK",
          subTitle:
              "We have dedicated set of products and routines hand picked for every skin type.",
        ),
        OnboardingPageViewItem(
          image: Assets.assetsImagesOnBoradingThree,
          title: "PUCH NOTIFICATIONS",
          subTitle:
              "Allow notifications for new makeup & cosmetics offers.",
        ),
      ],
    );
  }
}
