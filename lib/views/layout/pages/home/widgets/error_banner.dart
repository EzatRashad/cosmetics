import 'package:cosmetics/core/style/app_colors.dart';
import 'package:cosmetics/core/widgets/app_button.dart';
import 'package:cosmetics/view_model/home_cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ErrorBanner extends StatelessWidget {
  const ErrorBanner({super.key, required this.message, required this.onRetry});
  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320.h,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.wifi_off_rounded, size: 48, color: AppColors.primary),
          SizedBox(height: 12.h),
          Text(
            "Something went wrong",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(height: 6.h),
          Text(
            message,
            textAlign: TextAlign.center,
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: Colors.grey),
          ),
          SizedBox(height: 14.h),
          AppButton(
            title: "Retry",
            onTap: () {
              context.read<HomeCubit>().getHomeData();
            },
          ),
        ],
      ),
    );
  }
}
