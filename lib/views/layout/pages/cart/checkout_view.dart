import 'package:cosmetics/core/utils/utils.dart';
import 'package:cosmetics/view_model/checkout/checkout_cubit.dart';
import 'package:cosmetics/view_model/checkout/checkout_state.dart';
import 'package:cosmetics/views/layout/pages/cart/widgets/address_payment.dart';
import 'package:cosmetics/views/layout/pages/cart/widgets/payment_sammary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cosmetics/core/widgets/app_button.dart';
import 'package:cosmetics/core/widgets/app_image.dart';
import 'package:cosmetics/core/style/app_colors.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 13.w),
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
                color: const Color(0xff29D3DA).withOpacity(0.2),
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
                    const AddressPayment(),
                    PaymentSammary(),
                    20.ph,
                    BlocBuilder<CheckoutCubit, CheckoutState>(
                      builder: (context, state) {
                        bool isEnabled = false;
                        if (state is CheckoutLoaded) {
                          isEnabled = state.isOrderEnabled;
                        }

                        return AbsorbPointer(
                          absorbing: !isEnabled,
                          child: AppButton(
                            width: 268.w,
                            height: 65.h,
                            radius: 30.r,
                            buttonColor: isEnabled
                                ? AppColors.primary
                                : AppColors.primary.withValues(alpha: 0.6),
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
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
