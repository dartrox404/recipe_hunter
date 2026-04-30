import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:recipe_hunter/src/application/presentation/pages/homepage.dart';
import 'package:recipe_hunter/src/core/constants/app_colors.dart';
import 'package:recipe_hunter/src/core/constants/app_sizes.dart';
import 'package:recipe_hunter/src/core/constants/app_style.dart';

class Onboardingpage extends StatelessWidget {
  const Onboardingpage({super.key});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Stack(
        children: [
          Container(
            height: media.height * .5,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/intro.webp'),
              ),
            ),
          ),
          Align(
            alignment: AlignmentGeometry.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.kspace16,
                vertical: AppSizes.kspace20,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Cooking a Delicious Food Easily!',
                    style: AppTextStyles.h1.copyWith(
                      fontFamily: 'poppins',
                      color: AppColors.white,
                    ),
                  ),
                  Gap(AppSizes.kspace20),
                  Text(
                    'Discover more than 1200+ recipes in your hand and cooking it easily',
                    style: AppTextStyles.bodyMedium.copyWith(
                      fontFamily: 'manrope',
                      color: AppColors.grey,
                    ),
                  ),
                  Gap(AppSizes.kspace20),
                  SizedBox(
                    width: media.width * .9,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(
                          AppColors.blue,
                        ),
                        shape: WidgetStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              AppSizes.kradiusLg,
                            ),
                          ),
                        ),
                      ),
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Homepage(),
                        ),
                      ),
                      child: Text(
                        'Login',
                        style: AppTextStyles.bodyLarge.copyWith(
                          fontFamily: 'poppins',
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                  Gap(AppSizes.kspace8),
                  SizedBox(
                    width: media.width * .9,
                    child: OutlinedButton(
                      style: ButtonStyle(
                        side: WidgetStateProperty.all(
                          BorderSide(color: AppColors.grey),
                        ),
                        shape: WidgetStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              AppSizes.kradiusLg,
                            ),
                          ),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Register',
                        style: AppTextStyles.bodyLarge.copyWith(
                          fontFamily: 'poppins',
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
