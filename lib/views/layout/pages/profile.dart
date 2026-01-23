import 'package:cosmetics/core/style/app_colors.dart';
import 'package:cosmetics/core/utils/utils.dart';
import 'package:cosmetics/core/widgets/App_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: double.infinity,
                  height: 152.h,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        const Color(0xffECA4C5),

                        Color(0xFF434C6D).withValues(alpha: .83),
                      ],
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 4,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: -60.h,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: CircleAvatar(
                      radius: 60.r,
                      backgroundImage: const NetworkImage(
                        'https://images.pexels.com/photos/2379005/pexels-photo-2379005.jpeg',
                      ),
                    ),
                  ),
                ),
              ],
            ),

            65.ph,

            Text('Sara Samer Talaat', style: theme.titleMedium),
            40.ph,

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 13.w),
              child: Column(
                children: [
                  InfoWidget(title: 'Edit Info', imageName: 'edit_info.svg'),
                  34.ph,
                  InfoWidget(
                    title: 'Order History',
                    imageName: 'order_history.svg',
                  ),
                  34.ph,
                  InfoWidget(title: 'Wallet', imageName: 'wallet.svg'),
                  34.ph,
                  InfoWidget(title: 'Settings', imageName: 'settings.svg'),
                  34.ph,
                  InfoWidget(title: 'Voucher', imageName: 'voucher.svg'),
                  34.ph,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      AppImage(imageName: "logout.svg"),
                      8.pw,
                      Text(
                        "Logout",
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(fontSize: 14.sp, color: AppColors.red),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoWidget extends StatelessWidget {
  const InfoWidget({super.key, required this.title, required this.imageName});

  final String title;
  final String imageName;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AppImage(imageName: imageName),
        8.pw,
        Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontSize: 14.sp),
        ),
        Spacer(),
        AppImage(imageName: "arrow.svg"),
      ],
    );
  }
}
