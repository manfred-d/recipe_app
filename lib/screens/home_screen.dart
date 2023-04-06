import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/components/categ_widget.dart';
import 'package:recipe_app/components/text_widget.dart';
import 'package:recipe_app/services/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    Size size = utils.getScreenSize;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Hello, ',
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'You name',
                            style: const TextStyle(
                              color: Colors.green,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // print('my name');
                              },
                          ),
                        ],
                      ),
                    ),

                    const Spacer(),
                    InkWell(
                      onTap: () {
                        print('name');
                      },
                      child: const CircleAvatar(
                        backgroundColor: Colors.green,
                        radius: 32,
                        child: CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(
                              'https://picsum.photos/id/237/200/300'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),

              Row(
                children: [
                  TextWidget(
                    color: Colors.blue,
                    textSize: 23,
                    text: 'What would you like \n to cook Today ? ',
                    isTitle: true,
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              // categories

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      color: Colors.grey,
                      textSize: 20,
                      text: 'Categories',
                      isTitle: true,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: TextWidget(
                        color: Colors.blue,
                        textSize: 16,
                        text: "view all",
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              // categories boxes
              Row(
                children: [
                  Flexible(
                    child: SizedBox(
                      height: size.height * 0.12,
                      child: ListView.builder(
                        itemCount: 4,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return const CatScreen();
                        },
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 15,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      color: Colors.black54,
                      textSize: 20,
                      text: 'Recommendation',
                      isTitle: true,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: TextWidget(
                        color: Colors.grey.shade500,
                        textSize: 16,
                        text: "see all",
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ),
              // recommended cards
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey,
                      child: InkWell(
                        onTap: () {},
                        child: Column(
                          children: [
                            FancyShimmerImage(
                              imageUrl: '',
                              height: size.width * 0.4,
                              width: size.width * 0.4,
                              boxFit: BoxFit.cover,
                              alignment: Alignment.topLeft,
                              boxDecoration: const BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.
                                
                              ),
                              errorWidget: Image.asset(
                                  'assets/images/ui/sliced.jpeg'),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical:5.0),
                              child: TextWidget(
                                color: Colors.black,
                                textSize: 18,
                                text: 'Macaron',
                                isTitle: true,
                              ),
                            ),
                            const SizedBox(height: 5,)
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}