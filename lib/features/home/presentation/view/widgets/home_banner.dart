import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/app_images.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Stack(
      alignment: Alignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),

          child: Image.network(
            width: double.infinity,
            height: 320,
            fit: BoxFit.fill,
            "https://images.pexels.com/photos/2866796/pexels-photo-2866796.jpeg",
          ),
        ),
        Container(
          width: double.infinity,
          height: 151,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          color: Color(0xffE9DCD3).withValues(alpha: .6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "50% OFF DISCOUNT ",
                        style: theme.titleLarge!.copyWith(
                          fontSize: 16,
                          color: Color(0xff62322D),
                        ),
                      ),
                      Text(
                        "CUPON CODE : 125865",
                        style: theme.titleLarge!.copyWith(
                          fontSize: 16,
                          color: Color(0xff62322D),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  SvgPicture.asset(Assets.assetsIconsOffer),
                ],
              ),
              Spacer(),
              Row(
                children: [
                  SvgPicture.asset(Assets.assetsIconsOffer),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hurry up! ",
                        style: theme.titleLarge!.copyWith(
                          fontSize: 16,
                          color: Color(0xff434C6D),
                        ),
                      ),
                      Text(
                        " Skin care only !",
                        style: theme.titleLarge!.copyWith(
                          fontSize: 16,
                          color: Color(0xff434C6D),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
