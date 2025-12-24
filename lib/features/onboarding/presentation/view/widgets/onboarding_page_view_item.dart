import 'package:cosmetics/core/utils/utils.dart';
import 'package:cosmetics/core/widgets/custom_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        CustomImageWidget(imageName: image, height: 250.h),
        20.ph,
        Text(
          title,
          style: theme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
        ),
        15.ph,
        Text(subTitle, style: theme.titleSmall, textAlign: TextAlign.center),
      ],
    );
  }
}
