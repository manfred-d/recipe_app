class RecipeModel {
  RecipeModel({
    required this.image,
    required this.label,
    required this.desc,
    required this.url,
  });

  String image;
  String label;
  String desc;
  int url;

  factory RecipeModel.fromMap(Map<String, dynamic> parseJson) {
    return RecipeModel(
      image: parseJson['image'],
      label: parseJson['title'],
      desc: parseJson['imageType'],
      url: parseJson['id'],
    );
  }
}
