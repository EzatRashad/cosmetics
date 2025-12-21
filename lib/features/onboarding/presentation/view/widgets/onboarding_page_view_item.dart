import 'package:cosmetics/core/utils/utils.dart';
import 'package:flutter/material.dart';

class OnboardingPageViewItem extends StatelessWidget {
  const OnboardingPageViewItem({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });
  final String image;
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(image, height: 250),
        20.ph,
        Text(
          title,
          style: theme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 15),
        Text(subTitle, style: theme.titleSmall, textAlign: TextAlign.center),
      ],
    );
  }
}
