import 'package:cosmetics/core/utils/utils.dart';
import 'package:cosmetics/view_model/checkout/checkout_cubit.dart';
import 'package:cosmetics/view_model/checkout/checkout_state.dart';
import 'package:cosmetics/views/layout/pages/cart/pin_locatin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cosmetics/core/widgets/app_button.dart';
import 'package:cosmetics/core/widgets/app_image.dart';
import 'package:cosmetics/core/utils/navigate.dart';

class AddressPayment extends StatelessWidget {
  const AddressPayment({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return BlocBuilder<CheckoutCubit, CheckoutState>(
      builder: (context, state) {
        String address = "";
        double lat = 0;
        double lon = 0;

        if (state is CheckoutLoaded) {
          address = state.address;
          lat = state.lat;
          lon = state.lon;
        }

        return Column(
          children: [
            10.ph,
            Text(
              'Delivery to',
              style: theme.titleMedium!.copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            15.ph,
            Container(
              padding: EdgeInsets.all(13.r),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.r),
                border: Border.all(color: const Color(0xff73B9BB), width: 2.w),
              ),
              child: (address.isEmpty)
                  ? GestureDetector(
                      onTap: () => context.nextScreen(const PinLocatinView()),
                      child: Center(
                        child: Text(
                          "No Address Selected, select now",
                          style: theme.titleMedium!.copyWith(fontSize: 12.sp),
                        ),
                      ),
                    )
                  : ListTile(
                      leading: GestureDetector(
                        onTap: () => context.nextScreen(const PinLocatinView()),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.r),
                          child: SizedBox(
                            width: 97.w,
                            height: 60.h,
                            child: AbsorbPointer(
                              child: GoogleMap(
                                initialCameraPosition: CameraPosition(
                                  target: LatLng(lat, lon),
                                  zoom: 10,
                                ),
                                markers: {
                                  Marker(
                                    markerId: const MarkerId('loc'),
                                    position: LatLng(lat, lon),
                                  ),
                                },
                                liteModeEnabled: true,
                                myLocationButtonEnabled: false,
                                mapToolbarEnabled: false,
                              ),
                            ),
                          ),
                        ),
                      ),
                      title: Text(
                        'Home',
                        style: theme.titleMedium!.copyWith(fontSize: 12.sp),
                      ),
                      subtitle: Text(
                        address,
                        maxLines: 2,
                        style: theme.titleSmall!.copyWith(fontSize: 10.sp),
                      ),
                      trailing: AppImage(
                        imageName: "check_out_arrow.svg",
                        width: 22.w,
                      ),
                    ),
            ),

            30.ph,
            Text(
              'Payment Method',
              style: theme.titleMedium!.copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            14.ph,
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
            10.ph,

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
      },
    );
  }
}
