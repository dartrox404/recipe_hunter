import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:recipe_hunter/src/core/constants/app_colors.dart';
import 'package:recipe_hunter/src/core/constants/app_sizes.dart';
import 'package:recipe_hunter/src/core/constants/app_style.dart';
import 'package:recipe_hunter/src/data/services/no_internet_service.dart';

class NoInternetPage extends StatefulWidget {
  const NoInternetPage({super.key});

  @override
  State<NoInternetPage> createState() => _NoInternetPageState();
}

class _NoInternetPageState extends State<NoInternetPage> {
  bool isconnected = false;
  Future<bool> _refresh() async {
    setState(() {
      isconnected = true;
    });
    final x = await NoInternetService().refreshinternet();
    if (!mounted) return false;
    if (x) {
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('NO internet'),
          duration: const Duration(seconds: 1),
        ),
      );
    }
    return x;
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.kspace16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset('assets/indi/no.png'),
              SizedBox(
                height: media.height * .3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Oops!',
                      style: AppTextStyles.h1.copyWith(fontFamily: 'poppins'),
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      'It seems that your device is not connected to internet',
                      style: AppTextStyles.bodyMedium.copyWith(
                        fontFamily: 'manrope',
                      ),
                    ),
                    Column(
                      children: [
                        SizedBox(
                          width: media.width,
                          child: ElevatedButton.icon(
                            style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all(
                                AppColors.black,
                              ),
                              shape: WidgetStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    AppSizes.kradiusMd,
                                  ),
                                ),
                              ),
                            ),
                            icon: isconnected
                                ? SizedBox(
                                    height: AppSizes.kspace20,
                                    width: AppSizes.kspace20,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                    ),
                                  )
                                : Icon(
                                    Iconsax.refresh,
                                    size: AppSizes.kiconLg,
                                    color: AppColors.white,
                                  ),
                            onPressed: isconnected ? null : _refresh,
                            label: isconnected
                                ? Text(
                                    "Checking.....",
                                    style: AppTextStyles.bodyLarge.copyWith(
                                      fontFamily: 'poppins',
                                      color: AppColors.white,
                                    ),
                                  )
                                : Text(
                                    'Refresh...',
                                    style: AppTextStyles.bodyLarge.copyWith(
                                      fontFamily: 'poppins',
                                      color: AppColors.white,
                                    ),
                                  ),
                          ),
                        ),
                        SizedBox(
                          width: media.width,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all(
                                AppColors.black,
                              ),
                              shape: WidgetStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    AppSizes.kradiusMd,
                                  ),
                                ),
                              ),
                            ),
                            onPressed: () => SystemNavigator.pop(),
                            child: Text(
                              'exit',
                              style: AppTextStyles.bodyLarge.copyWith(
                                fontFamily: 'mons',
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
