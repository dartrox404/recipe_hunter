final List<String> indgreditenstab = ["Newest", "Collection"];

class Ingredientsdata {
  final String title, subtile, image;
  final int rating;
  final double value;
  Ingredientsdata({
    required this.rating,
    required this.subtile,
    required this.image,
    required this.title,
    required this.value,
  });
}

List<Ingredientsdata> ingredientsitem = [
  Ingredientsdata(
    image: 'assets/indi/brocli.webp',
    rating: 2,
    subtile: "Product info goes to here",
    title: 'Broecoli USA',
    value: 25.0,
  ),
  Ingredientsdata(
    image: 'assets/indi/ginger.webp',
    rating: 5,
    subtile: "Product info goes to here",
    title: 'Ginger Blush',
    value: 55.0,
  ),
  Ingredientsdata(
    image: 'assets/indi/potato.webp',
    rating: 4,
    subtile: "Product info goes to here",
    title: 'Potato',
    value: 40.0,
  ),
  Ingredientsdata(
    image: 'assets/indi/bbb7f3bb0fe59ee186ea8b5b579c84be-removebg-preview.webp',
    rating: 4,
    subtile: "Product info goes to here",
    title: 'Special Carrot',
    value: 45.0,
  ),
  Ingredientsdata(
    image: 'assets/indi/ac2f3df923e0082bae363e9531a56559-removebg-preview.webp',
    rating: 3,
    subtile: "Product info goes to here",
    title: 'American Bread',
    value: 25.0,
  ),
];
