class RecommendModel {
  RecommendModel({required this.id, required this.image, required this.title});

  String image;
  String title;
  int id;

  factory RecommendModel.fromMap(Map<String, dynamic> parseJson) {
    return RecommendModel(
        id: parseJson['id'],
        image: parseJson['image'],
        title: parseJson['title']);
  }
}
