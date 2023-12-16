import 'package:zikrabyte_ui/application/presentation/screens/recipe_detail/widgets/tab_details.dart';
import 'package:zikrabyte_ui/application/presentation/utils/colors.dart';
import 'package:zikrabyte_ui/application/presentation/utils/constants.dart';
import 'package:flutter/material.dart';

class ScreenRecipeDetail extends StatelessWidget {
  const ScreenRecipeDetail({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: sWidth * 0.90,
              width: sWidth,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/Pasta1.jpg'),
                    fit: BoxFit.cover),
              ),
              child: ColoredBox(
                color: kBlack.withOpacity(0.4),
                child: Padding(
                  padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                          borderRadius: const BorderRadius.all(kRadius50),
                          child: ColoredBox(
                              color: kWhite.withOpacity(0.3),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Icon(
                                    Icons.arrow_back,
                                    color: kWhite,
                                  ),
                                ),
                              ))),
                      ClipRRect(
                        borderRadius: const BorderRadius.all(kRadius50),
                        child: ColoredBox(
                          color: kWhite.withOpacity(0.3),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: RotatedBox(
                                quarterTurns: 45,
                                child: Icon(
                                  Icons.expand,
                                  color: kWhite,
                                )),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          style: cabin(
                              fontSize: 0.06, fontWeight: FontWeight.w600),
                        ),
                        const CircleAvatar(
                            backgroundColor: kGrey,
                            child: Icon(Icons.share_outlined))
                      ],
                    ),
                    kHeight10,
                    Row(
                      children: [
                        const CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/person.jpeg'),
                        ),
                        kWidth10,
                        Column(
                          children: [
                            Text(
                              'Andrew jun',
                              style: cabin(
                                  fontSize: 0.05, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              '@andrewjun',
                              style: montserrat(),
                            )
                          ],
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.favorite,
                          color: kRed,
                        ),
                        kWidth5,
                        Text(
                          '273 Likes',
                          style: cabin(
                              fontSize: 0.04, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
                width: sWidth, height: sWidth, child: const TabViewRecipe())
          ],
        ),
      ),
    );
  }
}

