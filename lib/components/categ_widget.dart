// import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/components/text_widget.dart';
import 'package:recipe_app/services/utils.dart';

class CatScreen extends StatefulWidget {
  const CatScreen({super.key});

  @override
  State<CatScreen> createState() => _CatScreenState();
}

class _CatScreenState extends State<CatScreen> {
  // lists
  final List<Map<String, dynamic>> _categInfo = [
    {
      'imgPath': 'assets/images/cat/breakfast.jpg',
      'cartTitle': 'Breakfast',
    },
    {
      'imgPath': 'assets/images/cat/dinner.jpeg',
      'cartTitle': 'Main Dish',
    },
    {
      'imgPath': 'assets/images/cat/dessert.jpeg',
      'cartTitle': 'Dessert',
    },
    {
      'imgPath': 'assets/images/cat/breakfast.jpg',
      'cartTitle': 'Soup',
    },
    {
      'imgPath': 'assets/images/cat/breakfast.jpg',
      'cartTitle': 'Salad',
    },
    {
      'imgPath': 'assets/images/cat/breakfast.jpg',
      'cartTitle': 'Drinks',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    Size size = utils.getScreenSize;
    return Row(
      children: [
        Flexible(
          child: SizedBox(
            height: size.height * 0.12,
            child: ListView.builder(
              itemCount: _categInfo.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return CatWidget(
                  imageUrl: _categInfo[index]['imgPath'],
                  catText: _categInfo[index]['cartTitle'],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class CatWidget extends StatelessWidget {
  const CatWidget({super.key, required this.imageUrl, required this.catText});

  final String imageUrl;
  final String catText;


  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    Size size = utils.getScreenSize;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Material(
        color: Colors.white70.withGreen(450),
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        imageUrl,
                        height: size.width * 0.15,
                        width: size.width * 0.18,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: TextWidget(
                    color: Colors.grey.shade900,
                    textSize: 14,
                    text: catText,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
