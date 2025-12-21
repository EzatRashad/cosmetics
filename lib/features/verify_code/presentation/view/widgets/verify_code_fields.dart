import 'package:cosmetics/core/style/app_colors.dart';
import 'package:flutter/material.dart';

class VerifyCodeFields extends StatelessWidget {
  final List<TextEditingController> controllers;
  final List<FocusNode> focusNodes;
  final void Function(String value, int index) onCodeChanged;

  const VerifyCodeFields({
    super.key,
    required this.controllers,
    required this.focusNodes,
    required this.onCodeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        4,
        (index) => SizedBox(
          width: 45,
          height: 45,
          child: TextFormField(
            controller: controllers[index],
            focusNode: focusNodes[index],
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            maxLength: 1,
            cursorColor: AppColors.dark_gray,
            onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
            onChanged: (value) => onCodeChanged(value, index),
            style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 16),
            decoration: InputDecoration(
              counterText: '',
              hintText: "_",
              
              hintStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.hint_text

              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: AppColors.primary,
                  width: 1.5,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  width: 1.5,
                  color: controllers[index].text.isNotEmpty
                      ? AppColors.primary
                      : Color(0xff898992).withValues(alpha: .5),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
