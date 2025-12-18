import 'package:cosmetics/core/style/text_styles.dart';
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        
        Image.asset(image,height: 250,),
        20.ph,
        Text(
          title,
          style: TextStyles.textStyle16Bold.copyWith(color: Color(0xff434C6D),),
        ),
        const SizedBox(height: 15),
        Text(
          subTitle,
          style: TextStyles.textStyle14.copyWith( color: Color(0xff434C6D)),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
