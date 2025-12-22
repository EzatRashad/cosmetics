import 'package:cosmetics/core/style/app_colors.dart';
import 'package:cosmetics/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart'; 

class HomeSearchField extends StatelessWidget {
  const HomeSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 9,
            offset: Offset(0, 2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hint: Text("Search",style:Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 12,fontWeight: FontWeight.w500)),
          suffixIcon: SizedBox(
            width: 20,
            child: Center(child: SvgPicture.asset(Assets.assetsIconsSearch)),
          ),
          hintStyle: Theme.of(context).textTheme.titleSmall,
          filled: true,
          fillColor: AppColors.background,
          border: buildBorder(),
          enabledBorder: buildBorder(),
          focusedBorder: buildBorder(),
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(width: 1, color: Color(0xffB3B3C1)),
    );
  }
}
