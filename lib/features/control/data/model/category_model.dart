class CategoryModel {
  final String categoryName;
  final String description;
  final String image;

  CategoryModel({
    required this.categoryName,
    required this.description,
    required this.image,
  });
  factory CategoryModel.fromeFirebase(Map<String, dynamic> json) {
    return CategoryModel(
      categoryName: json['name'],
      description: json['des'],
      image: json['image'],
    );
  }
}
