import 'package:cosmetics/core/constants/consts.dart';
import 'package:cosmetics/core/services/cashe_helper.dart';
import 'package:cosmetics/core/style/app_colors.dart';
import 'package:cosmetics/core/utils/navigate.dart';
import 'package:cosmetics/core/utils/utils.dart';
import 'package:cosmetics/core/widgets/app_image.dart';
import 'package:cosmetics/view_model/profile_cubit/profile_cubit.dart';
import 'package:cosmetics/view_model/profile_cubit/profile_state.dart';
import 'package:cosmetics/views/auth/login/login_view.dart';
import 'package:cosmetics/views/layout/pages/home/widgets/error_banner.dart';
import 'package:cosmetics/views/layout/pages/update_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => ProfileCubit()..getProfile(),
          child: BlocConsumer<ProfileCubit, ProfileState>(
            listener: (context, state) {
              if (state is LogoutSuccess || state is LogoutError) {
                token = "";
                CasheHelper.saveData(key: logedK, value: false);

                CasheHelper.saveData(key: tokenK, value: "");
                context.nextScreen(LoginView(), remove: true);
                context.showSnackBar(message: "Logged out successfully.");
              }
            },
            builder: (context, state) {
              if (state is GetProfileLoading) {
                return Center(child: Lottie.asset(loadingImage, width: 180));
              }

              if (state is GetProfileError) {
                return ErrorBanner(
                  message: state.error,
                  onRetry: () => context.read<ProfileCubit>().getProfile(),
                );
              }

              if (state is GetProfileSuccess) {
                final profile = state.profileModel;

                return Column(
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
                                const Color(0xFF434C6D).withValues(alpha: .83),
                              ],
                            ),
                          ),
                        ),

                        Positioned(
                          bottom: -60.h,
                          left: 0,
                          right: 0,
                          child: Center(
                            child: CircleAvatar(
                              radius: 60.r,
                              backgroundColor: Colors.grey.shade200,
                              backgroundImage: NetworkImage(
                                profile.profilePhotoUrl ?? "",
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    65.ph,

                    Text(profile.username, style: theme.titleMedium),

                    40.ph,

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 13.w),
                      child: Column(
                        children: [
                          InfoWidget(
                            onTap: () {
                              context.nextScreen(
                                EditProfileView(profileModel: profile),
                              );
                            },
                            title: 'Edit Info',
                            imageName: 'edit_info.svg',
                          ),
                          34.ph,
                          InfoWidget(
                            title: 'Order History',
                            imageName: 'order_history.svg',
                          ),
                          34.ph,
                          InfoWidget(title: 'Wallet', imageName: 'wallet.svg'),
                          34.ph,
                          InfoWidget(
                            title: 'Settings',
                            imageName: 'settings.svg',
                          ),
                          34.ph,
                          InfoWidget(
                            title: 'Voucher',
                            imageName: 'voucher.svg',
                          ),
                          34.ph,

                          GestureDetector(
                            onTap: () {
                              context.read<ProfileCubit>().logout();
                            },
                            child: Row(
                              children: [
                                AppImage(imageName: "logout.svg"),
                                8.pw,
                                Text(
                                  "Logout",
                                  style: theme.titleMedium?.copyWith(
                                    fontSize: 14.sp,
                                    color: AppColors.red,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }

              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}

class InfoWidget extends StatelessWidget {
  const InfoWidget({
    super.key,
    required this.title,
    required this.imageName,
    this.onTap,
  });

  final String title;
  final String imageName;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
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
      ),
    );
  }
}
