import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:recipe_app/components/text_widget.dart';
import 'package:recipe_app/models/singlerecipe_model.dart';
import 'package:recipe_app/services/utils.dart';
import 'package:http/http.dart' as http;

class RecipeScreen extends StatefulWidget {
  static const routeName = '/RecipeScreen';
  const RecipeScreen({super.key, required this.postUrl});
  final int postUrl;

  @override
  State<RecipeScreen> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  late Future<SingleRecipeModel> _futureRecipe;

  @override
  void initState() {
    super.initState();
    _futureRecipe = getRecipe(widget.postUrl);
  }

  Future<SingleRecipeModel> getRecipe(int recipeId) async {
    String url =
        "https://api.spoonacular.com/recipes/782585/information?apiKey=9a500d49ff474847b99f5b7c86265fb1";

    var response = await http.get(Uri.parse(url), headers: {
      "Accept": "application/json",
      "Content-type": "application/json"
    });
    print(response);
    if (response.statusCode == 200) {
      print(json.decode(response.body));
    } else {
      print(response.statusCode);
    }
    // final result = jsonDecode(response.body);
    // final instruction = result['instructions'];
    // // print(result);
    // final ingredients = List<String>.from(result['extendedIngredients']
    //     .map((ingredient) => ingredient['originalString']));
    // print(result);
    // return SingleRecipeModel(
    //   image: result['image'],
    //   title: result['title'],
    //   ingredients: ingredients,
    //   instruction: instruction,
    //   id: result['id'],
    //   desc: result['sourceName'],
    //   mins: result['readyInMinutes'],
    //   score: result['healthScore'],
    //   serves: result['servings'],
    // );

    // } else {
    //   throw Exception("Failed to load recipe");
    // }
  }

  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    Size size = utils.getScreenSize;
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      // ),
      body: SingleChildScrollView(
        child: FutureBuilder<SingleRecipeModel>(
            future: _futureRecipe,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final recipe = snapshot.data!;
                return Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.4,
                      child: Container(
                        height: double.infinity,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(recipe.image),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              left: 30,
                              top: 60,
                              child: CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.white,
                                child: IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(
                                    Icons.arrow_back_outlined,
                                    color: Colors.blue,
                                    size: 25,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              right: 30,
                              top: 60,
                              child: CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.white,
                                child: IconButton(
                                  onPressed: () {
                                    print(widget.postUrl);
                                  },
                                  icon: Icon(
                                    Icons.bookmark_add_outlined,
                                    color: Colors.grey.shade700,
                                    size: 25,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                // mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextWidget(
                                    color: Colors.blueGrey,
                                    textSize: 22,
                                    text: "Spicy Ramen Chips",
                                    isTitle: true,
                                    maxLines: 10,
                                  ),
                                  const Text(
                                    'By Chloe',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: const [
                              InfoIcons(
                                icon: Icons.timer_outlined,
                                text: "10 mins",
                              ),
                              InfoIcons(
                                icon: Icons.energy_savings_leaf_outlined,
                                text: "500 kcl",
                              ),
                              InfoIcons(
                                icon: Icons.person_2_outlined,
                                text: "2 servings",
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20.0),
                                child: TextWidget(
                                  color: Colors.grey.shade500,
                                  textSize: 20,
                                  text: "Ingredients",
                                  isTitle: true,
                                ),
                              ),
                            ],
                          ),
                          MyListWidget(),
                          Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15.0),
                                child: TextWidget(
                                  color: Colors.grey.shade500,
                                  textSize: 20,
                                  text: "Recipe Preparation",
                                  isTitle: true,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 100,
                      ),
                      Text('${snapshot.error}'),
                    ],
                  ),
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }),
      ),
    );
  }
}

// recipe instruction
class MyListWidget extends StatelessWidget {
  MyListWidget({super.key});

  final List<String> items = ['Item 1', 'Item 2', 'Item 3'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              decoration: BoxDecoration(
                border: index != items.length - 1
                    ? const Border(bottom: BorderSide(color: Colors.grey))
                    : null,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundColor: const Color(0xff6ae792),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.network(
                        'https://spoonacular.com/cdn/ingredients_100x100/white-powder.jpg',
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  title: Text(
                    items[index],
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey.shade600,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

class InfoIcons extends StatelessWidget {
  const InfoIcons({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Material(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
        shadowColor: Colors.black,
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Icon(
                icon,
                size: 20,
                color: Colors.black54,
              ),
              const SizedBox(width: 5),
              Text(
                text,
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
