import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:recipe_app/components/text_widget.dart';

import 'package:recipe_app/models/recommend_recipe.dart';
import 'package:recipe_app/screens/innerScreens/recipe_screen.dart';
import 'package:recipe_app/services/utils.dart';
import 'package:http/http.dart' as http;

class RecommendWidget extends StatefulWidget {
  const RecommendWidget({super.key});

  @override
  State<RecommendWidget> createState() => _RecommendWidgetState();
}

class _RecommendWidgetState extends State<RecommendWidget> {
  List<RecommendModel> recipes = <RecommendModel>[];
  String appKey = '9a500d49ff474847b99f5b7c86265fb1 ';

  getRecipes() async {
    String url =
        'https://api.spoonacular.com/recipes/complexSearch?apiKey=9a500d49ff474847b99f5b7c86265fb1&number=9';

    var response = await http.get(Uri.parse(url));

    Map<String, dynamic> jsonData = jsonDecode(response.body);

    jsonData["results"].forEach((item) {
      RecommendModel recipeModel = RecommendModel.fromMap(item);
      // recipeModel = RecommendModel.fromMap(item['results']);
      recipes.add(recipeModel);
      // print(recipes.toString());
    });
    // List<RecommendModel> recommendations = [];

    // for (var recommendationData in recommendationDataList) {
    //   RecommendModel recommendation =
    //       RecommendModel.fromMap(recommendationData);
    //   recommendations.add(recommendation);
    // }

    // List<RecommendModel> recipes = List.from(
    //     jsonData.map((parseJson) => RecommendModel.fromMap(parseJson)));

    setState(() {
      // getRecipes();
    });
  }

  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    Size size = utils.getScreenSize;
    getRecipes();

    return Row(
      children: [
        Flexible(
          child: SizedBox(
            height: size.height * .3,
            child: ListView.builder(
              itemCount: recipes.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return ReccomWidget(
                  imageUrl: recipes[index].image,
                  title: recipes[index].title,
                  url: recipes[index].id,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class ReccomWidget extends StatelessWidget {
  const ReccomWidget(
      {super.key,
      required this.url,
      required this.imageUrl,
      required this.title});

  final String title;
  final String imageUrl;
  final int url;

  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    Size size = utils.getScreenSize;
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(15),
            ),
            width: size.width * 0.4,
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => RecipeScreen(postUrl: url))));
              },
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      imageUrl,
                      height: size.height * 0.19,
                      width: size.width * 0.4,
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 6),
                    child: TextWidget(
                      color: Colors.black,
                      textSize: 18,
                      text: title,
                      isTitle: true,
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
