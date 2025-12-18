import 'package:cosmetics/core/style/text_styles.dart';
import 'package:cosmetics/core/utils/app_images.dart';
import 'package:cosmetics/core/utils/utils.dart';
import 'package:cosmetics/features/onboarding/presentation/view/widgets/onboarding_page_view.dart';
import 'package:flutter/material.dart';

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
        body: Column(
          children: [
            TextButton(
              onPressed: () {},
              child: Align(
                alignment: Alignment.topRight,
                child: Text(
                  "Skip",
                  style: TextStyles.textStyle16Regular.copyWith(
                    color: Color(0xff434C6D),
                  ),
                ),
              ),
            ),
            Expanded(child: OnboardingPageView(pageController: pageController)),
            currentPage == 2
                ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Container(
                      height: 50,
                      width: 200,
                      margin: const EdgeInsets.only(bottom: 40),
                      decoration: BoxDecoration(
                        color: Color(0xff434C6D),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Text(  "Get Started", style: TextStyle(color: Colors.white),
                      ),
                    ),
                  
                ))
                : GestureDetector(
                    onTap: () {
                      if (currentPage < 2) {
                        pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      } else {
                        // Navigate to another screen or perform an action
                      }
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      margin: const EdgeInsets.only(bottom: 40),
                      decoration: BoxDecoration(
                        color: Color(0xff434C6D),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Image(image: AssetImage(Assets.assetsImagesForward)),
                      ),
                    ),
                  ),
                  50.ph,
          ],
        ),
      ),
    );
  }
}
