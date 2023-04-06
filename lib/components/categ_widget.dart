import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/components/text_widget.dart';
import 'package:recipe_app/services/utils.dart';

class CatScreen extends StatelessWidget {
  const CatScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    Size size = utils.getScreenSize;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3.0),
      child: Material(
        color: Theme.of(context).cardColor.withOpacity(1),
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FancyShimmerImage(
                      imageUrl: 'https://i.ibb.co/F0s3FHQ/Apricots.png',
                      height: size.width * 0.13,
                      width: size.width * 0.18,
                      boxFit: BoxFit.cover,
                    ),
                  ],
                ),
                const SizedBox(height: 10,),
                TextWidget(
                  color: Colors.grey,
                  textSize: 16,
                  text: 'italian',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
