import 'package:cosmetics/core/utils/navigate.dart';
import 'package:cosmetics/core/utils/utils.dart';
import 'package:cosmetics/core/widgets/custom_image_widget.dart';
import 'package:cosmetics/features/login/presentatin/view/login_view.dart';
import 'package:cosmetics/features/onboarding/presentation/view/widgets/onboarding_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({super.key});

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  late PageController pageController;

  var currentPage = 0;

  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      currentPage = pageController.page!.round();

      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 41.w),
          child: Column(
            children: [
              TextButton(
                onPressed: () {},
                child: Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    "Skip",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ),
              Expanded(
                child: OnboardingPageView(pageController: pageController),
              ),
              currentPage == 2
                  ? Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50.w),
                      child: GestureDetector(
                        onTap: () {
                          context.nextScreen(LoginView(), replacment: true);
                        },
                        child: Container(
                          height: 50.h,
                          width: 200.w,
                          margin: EdgeInsets.only(bottom: 40.h),
                          decoration: BoxDecoration(
                            color: Color(0xff434C6D),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: const Center(
                            child: Text(
                              "Get Started",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        if (currentPage < 2) {
                          pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          );
                        }
                      },
                      child: Container(
                        height: 50.h,
                        width: 50.w,
                        margin: EdgeInsets.only(bottom: 40.h),
                        decoration: BoxDecoration(
                          color: Color(0xff434C6D),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: const Center(
                          child: CustomImageWidget(imageName: "forward.png"),
                        ),
                      ),
                    ),
              50.ph,
            ],
          ),
        ),
      ),
    );
  }
}
