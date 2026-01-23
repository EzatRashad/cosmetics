import 'package:cosmetics/core/style/app_colors.dart';
import 'package:cosmetics/core/utils/utils.dart';
import 'package:cosmetics/core/widgets/app_button.dart';
import 'package:cosmetics/core/widgets/App_image.dart';
import 'package:cosmetics/views/layout/pages/cart/widgets/address_payment.dart';
import 'package:cosmetics/views/layout/pages/cart/widgets/payment_sammary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 13.w),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: CircleAvatar(
                      backgroundColor: const Color(0xff101010).withOpacity(0.1),
                      child: AppImage(imageName: "arrow_back.svg"),
                    ),
                  ),
                  16.pw,
                  Expanded(
                    child: Text(
                      'Checkout',
                      style: theme.titleLarge,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  40.pw,
                ],
              ),
            ),
            Expanded(
              child: Container(
                height: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xff29D3DA).withValues(alpha: 0.2),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24.r),
                    topRight: Radius.circular(24.r),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 27.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      AddressPayment(),

                      PaymentSammary(),

                      AppButton(
                        width: 268.w,
                        height: 65.h,
                        radius: 30.r,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppImage(imageName: "checkout.svg"),
                            2.pw,
                            Text(
                              'ORDER',
                              style: theme.titleMedium!.copyWith(
                                fontSize: 14.sp,
                                color: AppColors.white,
                              ),
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
