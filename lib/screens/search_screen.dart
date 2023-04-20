import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:recipe_app/components/error_widget.dart';
import 'package:recipe_app/components/text_widget.dart';
import 'package:recipe_app/models/recipe_model.dart';
import 'package:recipe_app/screens/innerScreens/recipe_screen.dart';
import 'package:http/http.dart' as http;

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<RecipeModel> recipes = <RecipeModel>[];

  TextEditingController searchController = TextEditingController();
  // String apiKey = dotenv.env['API_RECIPE_KEY']!;

  getSearchedRecipes(String query) async {
    String url =
        "https://api.spoonacular.com/recipes/complexSearch?apiKey=9a500d49ff474847b99f5b7c86265fb1&query=$query";
    // "https://api.edamam.com/search?q=$query&app_id=$appId&app_key=$appKey";

    var response = await http.get(Uri.parse(url));

    Map<String, dynamic> jsonData = jsonDecode(response.body);

    jsonData["results"].forEach((item) {
      // print(item.toString());

      RecipeModel recipeModel = RecipeModel.fromMap(item);
      recipes.add(recipeModel);
    });
    // setState(() {});
    @override
    void initState() {
      super.initState();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff213A50),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 60,
              ),
              TextWidget(
                text: "What will you cook today?",
                textSize: 20,
                color: Colors.white,
                isTitle: true,
              ),
              const SizedBox(
                height: 20,
              ),
              TextWidget(
                color: Colors.white,
                textSize: 20,
                isTitle: true,
                text:
                    'Enter the Ingredients you have and we will show the Recipes for you',
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: searchController,
                        style:
                            const TextStyle(fontSize: 16, color: Colors.white),
                        decoration: InputDecoration(
                          hintText: "Enter Ingredients",
                          hintStyle: TextStyle(
                            fontSize: 16,
                            color: Colors.white.withOpacity(0.5),
                          ),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue.shade600),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        if (searchController.text.isNotEmpty) {
                          setState(() {});
                          getSearchedRecipes(searchController.text);
                        } else {
                          myErrorMessage(context, 'Field is required');
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.green.shade300,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.search_outlined,
                            size: 26,
                            color: Colors.amber.shade100,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: GridView(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    mainAxisSpacing: 35.0,
                    maxCrossAxisExtent: 200,
                  ),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: const ClampingScrollPhysics(),
                  children: List.generate(recipes.length, (index) {
                    return GridTile(
                      child: RecipeTile(
                        title: recipes[index].label,
                        imageUrl: recipes[index].image,
                        descr: recipes[index].desc,
                        url: recipes[index].url,
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RecipeTile extends StatefulWidget {
  const RecipeTile({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.descr,
    required this.url,
  });

  final String imageUrl, title, descr;
  final int url;

  @override
  State<RecipeTile> createState() => _RecipeTileState();
}

class _RecipeTileState extends State<RecipeTile> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        GestureDetector(
          onTap: () {
            print(widget.url);
            // GlobalMethods.navigateTo(
            //   ctx: context,
            //   routeName: RecipeScreen.routeName,
            // );
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RecipeScreen(
                  postUrl: widget.url,
                ),
              ),
            );
          },
          child: Container(
            margin: const EdgeInsets.all(4),
            child: Stack(
              children: <Widget>[
                Image.network(
                  widget.imageUrl,
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                Container(
                  width: 200,
                  alignment: Alignment.bottomLeft,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                        Colors.white30,
                        Colors.white.withOpacity(0.7)
                      ],
                          begin: FractionalOffset.centerRight,
                          end: FractionalOffset.centerLeft)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TextWidget(
                            color: Colors.black54,
                            textSize: 16,
                            text: widget.title),
                        TextWidget(
                            color: Colors.black54,
                            textSize: 12,
                            text: widget.descr),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
