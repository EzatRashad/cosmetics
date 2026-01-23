import 'package:cosmetics/core/constants/api_constants.dart';
import 'package:cosmetics/core/services/cashe_helper.dart';
import 'package:cosmetics/core/utils/navigate.dart';
import 'package:cosmetics/core/utils/utils.dart';
import 'package:cosmetics/core/widgets/App_image.dart';
import 'package:cosmetics/views/auth/login/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  late PageController pageController;
  int currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "image": "on_borading_one.png",
      "title": "WELCOME",
      "subTitle":
          "Makeup has the power to transform your mood and empowers you to be a more confident person.",
    },
    {
      "image": "on_borading_two.png",
      "title": "SEARCH & PICK",
      "subTitle":
          "We have dedicated set of products and routines hand picked for every skin type.",
    },
    {
      "image": "on_borading_three.png",
      "title": "PUCH NOTIFICATIONS",
      "subTitle": "Allow notifications for new makeup & cosmetics offers.",
    },
  ];

  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page!.round();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 41.w),
          child: Column(
            children: [
              Align(
                alignment: AlignmentDirectional.topEnd,
                child: TextButton(
                  onPressed: () {
                    context.nextScreen(const LoginView(), replacment: true);
                    CasheHelper.saveData(key: skipOnboardingK, value: true);
                  },
                  child: Text("Skip", style: theme.titleMedium),
                ),
              ),

              Expanded(
                child: PageView.builder(
                  controller: pageController,
                  itemCount: onboardingData.length,
                  itemBuilder: (context, index) {
                    final item = onboardingData[index];
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppImage(imageName: item["image"]!, height: 250.h),
                        20.ph,
                        Text(
                          item["title"]!,
                          style: theme.titleLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        15.ph,
                        Text(
                          item["subTitle"]!,
                          style: theme.titleSmall,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    );
                  },
                ),
              ),

              GestureDetector(
                onTap: () {
                  if (currentPage == onboardingData.length - 1) {
                    context.nextScreen(const LoginView(), remove: true);
                  } else {
                    pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  }
                  CasheHelper.saveData(key: skipOnboardingK, value: true);
                },
                child: Container(
                  height: 50.h,
                  width: currentPage == onboardingData.length - 1
                      ? 200.w
                      : 50.w,
                  margin: EdgeInsets.only(bottom: 40.h),
                  decoration: BoxDecoration(
                    color: const Color(0xff434C6D),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Center(
                    child: currentPage == onboardingData.length - 1
                        ? const Text(
                            "Get Started",
                            style: TextStyle(color: Colors.white),
                          )
                        : const AppImage(imageName: "forward.png"),
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
