import 'package:cosmetics/core/utils/utils.dart';
import 'package:cosmetics/core/widgets/app_button.dart';
import 'package:cosmetics/core/widgets/App_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddressPayment extends StatelessWidget {
  const AddressPayment({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Column(
      children: [
        20.ph,
        Text(
          'Delivery to',
          style: theme.titleMedium!.copyWith(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        18.ph,
        Container(
          padding: EdgeInsets.all(13.r),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.r),
            border: Border.all(color: const Color(0xff73B9BB), width: 2.w),
          ),
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: AppImage(
              imageName: "map.png",
              width: 97.w,
              height: 60.h,
              fit: BoxFit.cover,
            ),
            title: Text(
              'Home',
              style: theme.titleMedium!.copyWith(fontSize: 12.sp),
            ),
            subtitle: Text(
              'Mansoura, 14 Porsaid St',
              style: theme.titleSmall!.copyWith(fontSize: 10.sp),
            ),
            trailing: AppImage(imageName: "check_out_arrow.svg", width: 22.w),
          ),
        ),
        40.ph,
        Text(
          'Payment Method',
          style: theme.titleMedium!.copyWith(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        16.ph,
        Container(
          padding: EdgeInsets.symmetric(vertical: 19.h, horizontal: 12.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.r),
            border: Border.all(color: const Color(0xff73B9BB), width: 2.w),
          ),
          child: Row(
            children: [
              AppImage(imageName: "misa.svg", width: 30.w),
              10.pw,
              Text(
                '**** **** **** 1234',
                style: theme.titleMedium!.copyWith(fontSize: 12.sp),
              ),
              const Spacer(),
              AppImage(imageName: "check_out_arrow.svg", width: 22.w),
            ],
          ),
        ),
        12.ph,

        Container(
          padding: EdgeInsets.all(12.r),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.r),
            border: Border.all(color: const Color(0xff73B9BB), width: 2.w),
          ),
          child: Row(
            children: [
              AppImage(imageName: "discount.svg", width: 30.w),
              10.pw,
              Text(
                'Add vaucher',
                style: theme.titleMedium!.copyWith(fontSize: 12.sp),
              ),
              const Spacer(),
              AppButton(
                width: 77.w,
                height: 33.h,
                radius: 20.r,
                title: "Next",
                onTap: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
