import 'package:flutter/material.dart';
import 'package:recipe_hunter/src/core/constants/app_colors.dart';
import 'package:recipe_hunter/src/core/constants/app_style.dart';

class HomePageHero extends StatelessWidget {
  const HomePageHero({super.key, required this.title, required this.subtitle});
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: AppTextStyles.h3.copyWith(
            fontFamily: 'poppins',
            fontWeight: FontWeight.w700,
            color: AppColors.white,
          ),
        ),
        Text(
          subtitle,
          style: AppTextStyles.bodySmall.copyWith(
            fontFamily: 'manrope',
            color: AppColors.white,
          ),
        ),
      ],
    );
  }
}
