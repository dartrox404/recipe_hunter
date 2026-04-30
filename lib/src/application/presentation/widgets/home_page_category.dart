import 'package:flutter/material.dart';
import 'package:recipe_hunter/src/core/constants/app_colors.dart';
import 'package:recipe_hunter/src/core/constants/app_sizes.dart';
import 'package:recipe_hunter/src/core/constants/app_style.dart';
import 'package:recipe_hunter/src/data/models/category.dart';

class HomePageCategory extends StatefulWidget {
  const HomePageCategory({super.key, required this.oncategoryselcted});
  final Function(int) oncategoryselcted;

  @override
  State<HomePageCategory> createState() => _HomePageCategoryState();
}

class _HomePageCategoryState extends State<HomePageCategory> {
  int tracker = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
          categorylist.length,
          (index) => GestureDetector(
            onTap: () {
              setState(() {
                tracker = index;
              });
              widget.oncategoryselcted(index);
            },
            child: Container(
              margin: const EdgeInsets.only(right: AppSizes.kspace10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSizes.kradiusXl),
                gradient: tracker == index ? AppColors.bg : AppColors.vg,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 6,
                  horizontal: AppSizes.kspace16,
                ),
                child: Text(
                  categorylist[index],
                  style: AppTextStyles.bodyMedium.copyWith(
                    fontFamily: 'mons',
                    fontWeight: tracker == index
                        ? FontWeight.bold
                        : FontWeight.normal,
                    color: tracker == index ? AppColors.white : AppColors.black,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
