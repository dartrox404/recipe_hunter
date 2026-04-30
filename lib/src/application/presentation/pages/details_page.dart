import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:recipe_hunter/src/core/constants/app_colors.dart';
import 'package:recipe_hunter/src/core/constants/app_sizes.dart';
import 'package:recipe_hunter/src/core/constants/app_style.dart';
import 'package:recipe_hunter/src/data/models/ingredients.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int tracker = 0;
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppSizes.kspace10,
            horizontal: AppSizes.kspace16,
          ),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.grey,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Iconsax.arrow_left, color: AppColors.white),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.grey,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Iconsax.user, color: AppColors.white),
                      ),
                    ),
                  ],
                ),
                Gap(AppSizes.kspace24),
                Text(
                  'Browsing',
                  style: AppTextStyles.h1.copyWith(
                    fontFamily: 'mons',
                    color: AppColors.white,
                  ),
                ),
                Gap(AppSizes.kspace20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    indgreditenstab.length,
                    (index) => GestureDetector(
                      onTap: () {
                        setState(() {
                          tracker = index;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.grey.withValues(alpha: .3),
                          ),
                          color: tracker == index
                              ? AppColors.white.withValues(alpha: .2)
                              : AppColors.black,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: AppSizes.kspace10,
                            horizontal: AppSizes.kspace16,
                          ),
                          child: Text(
                            indgreditenstab[index],
                            style: AppTextStyles.bodyLarge.copyWith(
                              fontFamily: 'poppins',
                              color: AppColors.white,
                              fontWeight: tracker == index
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Gap(AppSizes.kspace32),
                Expanded(
                  child: ListView.builder(
                    itemCount: ingredientsitem.length,
                    itemBuilder: (BuildContext context, int index) {
                      final a = ingredientsitem[index];
                      return Container(
                        margin: const EdgeInsets.only(
                          bottom: AppSizes.kspace12,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            AppSizes.kradiusLg,
                          ),
                          color: AppColors.grey.withValues(alpha: .2),
                        ),
                        width: media.width * .8,
                        child: Row(
                          children: [
                            Image.asset(a.image, height: 80),
                            Gap(AppSizes.kspace20),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    a.title,
                                    style: AppTextStyles.bodyMedium.copyWith(
                                      fontFamily: 'poppins',
                                      color: AppColors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    a.subtile,
                                    style: AppTextStyles.bodySmall.copyWith(
                                      fontFamily: 'manrope',
                                      color: AppColors.grey,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '\$${a.value}',
                                        style: AppTextStyles.bodySmall.copyWith(
                                          fontFamily: 'manrope',
                                          color: AppColors.grey,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          right: AppSizes.kspace20,
                                        ),
                                        child: Text('⭐⭐⭐'),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
