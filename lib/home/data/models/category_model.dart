import 'dart:ui';

class CategoryModel {
  final String id;
  final String title;
  final String imageName;
  final Color color;

  CategoryModel(
      {required this.id,
      required this.title,
      required this.imageName,
      required this.color});

  static List<CategoryModel> Categories = [
    CategoryModel(
      id: 'men\'s clothing',
      title: 'men\'s clothing',
      imageName: 'men_clothing.jpg',
      color: Color(0xFFCF7E48),
    ),
    CategoryModel(
      id: 'jewelery',
      title: 'jewelery',
      imageName: 'jewelery.jpg',
      color: Color(0xFF4882CF),
    ),
    CategoryModel(
      id: 'electronics',
      title: 'electronics',
      imageName: 'electronics.jpg',
      color: Color(0xFFC91C22),
    ),
    CategoryModel(
      id: 'women\'s clothing',
      title: 'women\'s clothing',
      imageName: 'women_clothing.jpg',
      color: Color(0xFFF2D352),
    ),

  ];
}
