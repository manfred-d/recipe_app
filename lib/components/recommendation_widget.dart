import 'package:flutter/material.dart';
import 'package:recipe_app/components/text_widget.dart';
import 'package:recipe_app/screens/innerScreens/recipe_screen.dart';
import 'package:recipe_app/services/global_methods.dart';
import 'package:recipe_app/services/utils.dart';

class RecommendWidget extends StatefulWidget {
  const RecommendWidget({super.key});

  @override
  State<RecommendWidget> createState() => _RecommendWidgetState();
}

class _RecommendWidgetState extends State<RecommendWidget> {
  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    Size size = utils.getScreenSize;
    return Row(
      children: [
        Flexible(
          child: SizedBox(
            height: size.height * .25,
            child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return const ReccomWidget();
              },
            ),
          ),
        ),
      ],
    );
  }
}

class ReccomWidget extends StatelessWidget {
  const ReccomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    Size size = utils.getScreenSize;
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Material(
            borderRadius: BorderRadius.circular(15),
            color: Colors.grey,
            child: InkWell(
              onTap: () {
                GlobalMethods.navigateTo(
                    ctx: context, routeName: RecipeScreen.routeName);
              },
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      'assets/images/ui/plate.jpg',
                      height: size.height * 0.19,
                      width: size.width * 0.4,
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: TextWidget(
                      color: Colors.black,
                      textSize: 18,
                      text: 'Macaron',
                      isTitle: true,
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
