import 'package:cosmetics/core/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CountryCodeDropdown extends StatefulWidget {
  const CountryCodeDropdown({
    super.key,
    required this.codes,
    required this.onChanged,
    required this.initialValue,
  });
  final List<String> codes;
  final String initialValue;
  final ValueChanged<String?> onChanged;

  @override
  State<CountryCodeDropdown> createState() => CountryCodeDropdownState();
}

class CountryCodeDropdownState extends State<CountryCodeDropdown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      initialValue: widget.initialValue,
      padding: EdgeInsets.symmetric(vertical: 4.5.h),
      alignment: Alignment.center,
      style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 12.sp),
      icon: Transform.rotate(
        angle: 300,
        child: Icon(
          Icons.arrow_back_ios_new,
          size: 16.sp,
          color: AppColors.hintText,
        ),
      ),

      decoration: InputDecoration(
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
      items: widget.codes.map((code) {
        return DropdownMenuItem(value: code, child: Text(code));
      }).toList(),
      onChanged: widget.onChanged,
    );
  }
}
