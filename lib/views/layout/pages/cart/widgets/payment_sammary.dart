import 'package:cosmetics/core/style/app_colors.dart';
import 'package:cosmetics/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentSammary extends StatelessWidget {
  const PaymentSammary({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        31.ph,
        Row(
          children: List.generate(
            30,
            (index) => Expanded(
              child: Container(
                height: 1,
                color: index % 2 == 0 ? Colors.grey : Colors.transparent,
              ),
            ),
          ),
        ),
        31.ph,
        Text(
          '- REVIEW PAYMENT',
          style: theme.titleSmall!.copyWith(
            fontSize: 12.sp,
            color: AppColors.secondary,
          ),
        ),
        Text(
          'PAYMENT SUMMARY',
          style: theme.titleSmall!.copyWith(
            fontSize: 20.sp,
            color: AppColors.secondary,
          ),
        ),
        25.ph,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Subtotal',
              style: theme.titleSmall!.copyWith(
                fontSize: 12.sp,
                color: AppColors.secondary,
              ),
            ),
            Text(
              '16.100 EGP',
              style: theme.titleSmall!.copyWith(
                fontSize: 12.sp,
                color: AppColors.secondary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        10.ph,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'SHIPPING FEES',
              style: theme.titleSmall!.copyWith(
                fontSize: 12.sp,
                color: AppColors.secondary,
              ),
            ),
            Text(
              'TO BE CALCULATED',
              style: theme.titleSmall!.copyWith(
                fontSize: 12.sp,
                color: AppColors.secondary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        Divider(thickness: 1.h, height: 30.h, color: Color(0xff73B9BB)),
      ],
    );
  }
}
