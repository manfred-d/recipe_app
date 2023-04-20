class SingleRecipeModel {
  SingleRecipeModel({
    required this.image,
    required this.title,
    required this.ingredients,
    required this.instruction,
    required this.id,
    required this.desc,
    required this.mins,
    required this.score,
    required this.serves,
  });

  String image;
  String title;
  String desc;
  int mins;
  int score;
  int serves;
  int id;
  List<String> ingredients;
  String instruction;

  // factory SingleRecipeModel.fromMap(Map<String, dynamic> parseJson) {
  //   final ingredients = List<String>.from(parseJson['extendedIngredients']
  //       .map((ingredient) => ingredient['originalString']));
  //   final instruction = parseJson['instructions'];
  //   return SingleRecipeModel(
  //       image: parseJson['image'],
  //       title: parseJson['title'],
  //       ingredients: ingredients,
  //       instruction: instruction,
  //       id: parseJson['id'],
  //       desc: parseJson['sourceName'],
  //       mins: parseJson['readyInMinutes'],
  //       score: parseJson['healthScore'],
  //       serves: parseJson['servings']);
  // }
}
