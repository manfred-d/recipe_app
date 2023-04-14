import 'package:flutter/material.dart';
import 'package:recipe_app/components/text_widget.dart';
import 'package:recipe_app/screens/innerScreens/recipe_screen.dart';
import 'package:recipe_app/services/global_methods.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController textEditingController = TextEditingController();
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
              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: textEditingController,
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
                      onTap: () {},
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
              GridView(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  mainAxisSpacing: 35.0,
                  maxCrossAxisExtent: 200,
                ),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const ClampingScrollPhysics(),
                children: List.generate(6, (index) {
                  return const GridTile(
                    child: RecipeTile(
                      title: 'Title',
                      imageUrl:
                          'https://edamam-product-images.s3.amazonaws.com/web-img/cf3/cf35e9533e63190fa9d4ace033b8ec2a.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjENb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJHMEUCIGm1%2BHc1sOJ4SRUNIlMpMiZk8wY9SYqveo1ELWf%2B%2BE2UAiEAy4kDz5DP3z%2FjTzJ1xMq3F3eOQEaq7hBRCWNkktjYtCUqwgUIv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgwxODcwMTcxNTA5ODYiDNXR8TC98LSmLVvN0yqWBev0Ku%2BM0H6r0bje6hI3DdAbINnaTgVFvziXslwTmfI1vT2RhsipyWqfI2JsDbY1v0OFa4sEhR1rDp3eOeQPTjlpSrRpX96slsj1t0JOTxIBnSR2OyUatRx9Whugi6fVjazmPKdtPALvd30uRCL21oMElYVHP0jSHuvqntVolCwqVLZyhZfUXlBuVJKh6lbsAGO%2FTx7zh1w8gUOGoHx9UT6EVAzE4QWa9FbqYRozuOxj4VXmm2Xirre6OZwZXYyJUvvd3ryt3X7TPqoIT%2Fhh8aqO3EqZPoufV9VJRtL%2Bf%2BA9TkwSJuMOSMWOyvpf%2FopyekH%2BTDFrvEpwWb0cJe5y0zGUOSkXtPCxaGK6f2eX1pzwI2o6vlzmE89lStvSsAGJdbbK%2ByW23w0f7T4ar5596lucsMEY2whd3pkce5j9HfaOITr%2FaQC%2F2nzWfQLMirv4CAxUKI%2BMo%2B756S0ZP3jD2Da4ksz%2FZdqTb%2BkC502A%2FfN%2BBr6NMXWdu%2Fq14RsoDbqtPSNzlAO9wWm9mv9t6SaU5J5O8GqKJUT%2B3h%2FkL%2F69fAj72%2BDjbtH73cadmYq232tCb%2Bfq1ylWf8TUPF50InZDEV6ilA9rduue%2FJFLl0UyhZ6s2%2FXUwoHdcPbI9eQ8halIIJUvM7ZBYO1F5CLhTuoPxyiU6etZUW1dlZxwQbeBhfDCeF2QKt%2BcAiAhu2kdN2qrKnVDXZKemNHhAZFu20YHRo90XT5WHkBk1Def4lCIUTrkTE%2FoGBwkLlNK08BPjM2xQT23bUKDHqeO%2B9DRLFUCvqNkNo%2BLWejNc5JMBZ%2FWdKR03hWd8af2Yjv%2Ffi7RjRWzBOZZH%2FU0TWeZH%2Fve3Yq6r2gx411ABtJGNxCVfZsuvRa6OKidw7l4MLbi2qEGOrEBNLNaTc0slb17zsFmrnRtyzEmGoDc39aBi6dIFE4yXZhR460%2BFC9Jsss5W9rwhXUGtbhh0eeNKVKDza4fp%2F9ogSdmAEGLVPqCy1rBJFReqaC%2BygAc7PHTdCgYhJBaD3jcf5f4sTAxB2IRS%2BRV3vvJngoqvN1cOIKzolL2GNZei3S%2Bj65W3SVHBv2tL14W2evgUYY6KRMWZ6uepMFNpPr7KZvgOugD%2FnGEXMa5DPPToirJ&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20230412T142652Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFJPJ4BFEA%2F20230412%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=c3450b3844dfed35dacd2da25c9d9ba349e4bc8fd1bb59055ebaf898c4782547',
                      descr: 'Description',
                    ),
                  );
                }),
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
  });

  final String imageUrl, title, descr;

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
            GlobalMethods.navigateTo(
                ctx: context, routeName: RecipeScreen.routeName);
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
