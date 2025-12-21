import 'package:cosmetics/core/style/app_colors.dart';
import 'package:flutter/material.dart';

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
      padding: const EdgeInsets.symmetric(horizontal: 8),
      value: selectedCode,
      alignment: Alignment.center,
      style: Theme.of(context).textTheme.titleSmall!.copyWith(
        fontSize: 12,
      ),
      icon: Transform.rotate(
        angle: 300,
        child: Icon(
          Icons.arrow_back_ios_new,
          size: 13,
          color: AppColors.hint_text,
        ),
      ),

      decoration: InputDecoration(
        isDense: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.borderColor, width: 0.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),

          borderSide: BorderSide(color: AppColors.borderColor, width: 1),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(width: .5),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 14),
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
