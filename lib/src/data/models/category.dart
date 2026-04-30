final List<String> categorylist = [
  "Burgers",
  "Pizza",
  "Cakes",
  "Drinks",
  "Breads",
  "Biryani",
  "Noodles",
];

class FoodCateogory {
  final String name, image;
  final int weight, calories;
  FoodCateogory({
    required this.calories,
    required this.name,
    required this.weight,
    required this.image,
  });
}
