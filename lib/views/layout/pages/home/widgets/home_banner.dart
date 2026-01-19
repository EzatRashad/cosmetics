import 'package:cosmetics/core/widgets/custom_image_widget.dart';
import 'package:cosmetics/models/slider_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeBanner extends StatefulWidget {
  const HomeBanner({super.key, required this.sliders});
  final List<SliderModel> sliders;

  @override
  State<HomeBanner> createState() => HomeBannerState();
}

class HomeBannerState extends State<HomeBanner> {
  final PageController controller = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Column(
      children: [
        SizedBox(
          height: 320.h,
          child: PageView.builder(
            controller: controller,
            itemCount: widget.sliders.length,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      "https://images.pexels.com/photos/2866796/pexels-photo-2866796.jpeg",
                      width: double.infinity,
                      height: 320.h,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 151.h,
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 18.h,
                    ),
                    color: const Color(0xffE9DCD3).withValues(alpha: .6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${widget.sliders[index].discountPercent}% OFF DISCOUNT",
                                  style: theme.titleLarge!.copyWith(
                                    fontSize: 16.sp,
                                    color: const Color(0xff62322D),
                                  ),
                                ),
                                Text(
                                  "CUPON CODE : ${widget.sliders[index].couponCode}",
                                  style: theme.titleLarge!.copyWith(
                                    fontSize: 16.sp,
                                    color: const Color(0xff62322D),
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            AppImage(imageName: "offer.svg"),
                          ],
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            AppImage(imageName: "offer.svg"),
                            const Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.sliders[index].descriptionTitle1 ?? "",
                                  style: theme.titleLarge!.copyWith(
                                    fontSize: 16.sp,
                                    color: const Color(0xff434C6D),
                                  ),
                                ),
                                Text(
                                  widget.sliders[index].descriptionTitle2 ?? "",
                                  style: theme.titleLarge!.copyWith(
                                    fontSize: 16.sp,
                                    color: const Color(0xff434C6D),
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
            },
          ),
        ),

        /// Indicator
        SizedBox(height: 12.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            widget.sliders.length,
            (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: EdgeInsets.symmetric(horizontal: 4.w),
              width: currentIndex == index ? 18.w : 8.w,
              height: 8.h,
              decoration: BoxDecoration(
                color: currentIndex == index
                    ? const Color(0xff62322D)
                    : Colors.grey.shade400,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
