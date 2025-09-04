import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

InputDecoration CurrencyInputDecoration() {
  return InputDecoration(
    filled: true,
    isDense: true,
    contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
    fillColor: AppColors.inputColor,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: const BorderSide(color: AppColors.inputColor),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: const BorderSide(color: AppColors.inputColor),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: const BorderSide(color: AppColors.inputColor),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: const BorderSide(color: AppColors.inputColor),
    ),
  );
}
