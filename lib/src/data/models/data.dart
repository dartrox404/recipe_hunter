import 'package:recipe_hunter/src/data/models/category.dart';
import 'package:recipe_hunter/src/data/models/category_items.dart';

class Categorydata {
  String title, subtitle, image;
  final List<FoodCateogory> item;
  Categorydata({
    required this.image,
    required this.subtitle,
    required this.title,
    required this.item,
  });
}

final List<Categorydata> data = [
  Categorydata(
    image: 'assets/burgres/2.webp',
    subtitle: "All Collection of burger recipes for this weekend",
    title: "Best Burger Collection",
    item: burgerlist,
  ),
  Categorydata(
    image: 'assets/pizza/7.webp',
    subtitle: "All Collection of Pizza recipes for this weekend",
    title: "Best Pizza Collection",
    item: piizalist,
  ),
  Categorydata(
    image: 'assets/cakes/5.webp',
    subtitle: "All Collection of Cake recipes for this weekend",
    title: "Best Cake Collection",
    item: cakelist,
  ),
  Categorydata(
    image: 'assets/drinks/4.webp',
    subtitle: "All Collection of Drinks recipes for this weekend",
    title: "Best Drinks Collection",
    item: drinklist,
  ),
  Categorydata(
    image: 'assets/breads/5.webp',
    subtitle: "All Collection of Bread recipes for this weekend",
    title: "Best Bread Collection",
    item: breadlist,
  ),
  Categorydata(
    image: "assets/biryani/2.webp",
    subtitle: "All Collection of Biryani recipes for this weekend",
    title: "Best Biryani Collection",
    item: biryanilist,
  ),
  Categorydata(
    image: "assets/noodles/6.webp",
    subtitle: "All Collection of Noodles recipes for this weekend",
    title: "Best Noodles Collection",
    item: noodles,
  ),
];
