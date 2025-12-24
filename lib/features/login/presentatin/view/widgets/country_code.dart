import 'package:cosmetics/core/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CountryCodeDropdown extends StatefulWidget {
  const CountryCodeDropdown({super.key});

  @override
  State<CountryCodeDropdown> createState() => CountryCodeDropdownState();
}

class CountryCodeDropdownState extends State<CountryCodeDropdown> {
  String selectedCode = '+20';

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      value: selectedCode,
      alignment: Alignment.center,
      style: Theme.of(context).textTheme.titleSmall!.copyWith(
        fontSize: 12.sp,
      ),
      icon: Transform.rotate(
        angle: 300,
        child: Icon(
          Icons.arrow_back_ios_new,
          size: 13.sp,
          color: AppColors.hint_text,
        ),
      ),

      decoration: InputDecoration(
        isDense: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: AppColors.borderColor, width: 1.5.w),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: AppColors.borderColor, width: 1.5.w),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(width: .5.w),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
      ),
      items: const [
        DropdownMenuItem(value: '+20', child: Text('+20')),
        DropdownMenuItem(value: '+966', child: Text('+966')),
        DropdownMenuItem(value: '+971', child: Text('+971')),
      ],
      onChanged: (value) {
        setState(() {
          selectedCode = value!;
        });
      },
    );
  }
}
