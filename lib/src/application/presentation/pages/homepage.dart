import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:iconsax/iconsax.dart';
import 'package:recipe_hunter/src/application/presentation/pages/details_page.dart';
import 'package:recipe_hunter/src/application/presentation/pages/no_internet_page.dart';
import 'package:recipe_hunter/src/application/presentation/widgets/home_page_category.dart';
import 'package:recipe_hunter/src/application/presentation/widgets/home_page_hero.dart';
import 'package:recipe_hunter/src/core/constants/app_colors.dart';
import 'package:recipe_hunter/src/core/constants/app_sizes.dart';
import 'package:recipe_hunter/src/core/constants/app_style.dart';
import 'package:recipe_hunter/src/data/models/data.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int tracker = 0;
  @override
  Widget build(BuildContext context) {
    final items = data[tracker].item;
    final media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                width: media.width,
                height: media.height * .35,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(data[tracker].image),
                  ),
                ),
              ),
              Positioned(
                top: media.height * .13,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  height: 120,
                  width: media.width,
                  decoration: BoxDecoration(gradient: AppColors.fade),
                ),
              ),
              Positioned(
                top: 50,
                left: 20,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xfffefae0),
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Iconsax.arrow_left,
                        color: AppColors.appblack,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 50,
                right: 20,
                child: GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NoInternetPage(),
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xfffefae0),
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Iconsax.shop, color: AppColors.appblack),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 150,
                left: 20,
                child: HomePageHero(
                  subtitle: data[tracker].subtitle,
                  title: data[tracker].title,
                ),
              ),
              Positioned(
                top: 230,
                left: 0,
                right: 0,
                child: HomePageCategory(
                  oncategoryselcted: (index) {
                    setState(() {
                      tracker = index;
                    });
                  },
                ),
              ),
            ],
          ),
          Expanded(
            child: MasonryGridView.count(
              physics: BouncingScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: AppSizes.kspace10,
              crossAxisSpacing: AppSizes.kspace10,
              itemCount: items.length,
              itemBuilder: (context, index) {
                final z = items[index];
                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DetailsPage(),
                    ),
                  ),
                  child: Container(
                    height: media.height * .4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppSizes.kradiusXl),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(z.image),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(AppSizes.kspace8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  shape: BoxShape.circle,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 5,
                            bottom: AppSizes.kspace10,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                z.name,
                                overflow: TextOverflow.ellipsis,
                                style: AppTextStyles.bodyMedium.copyWith(
                                  fontFamily: 'poppins',
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.white,
                                ),
                              ),
                              Text(
                                "1 Peice | ${z.calories}Kcl",
                                style: AppTextStyles.bodySmall.copyWith(
                                  fontFamily: 'manrope',
                                  color: AppColors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
