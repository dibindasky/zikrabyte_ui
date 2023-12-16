import 'package:zikrabyte_ui/application/presentation/utils/colors.dart';
import 'package:zikrabyte_ui/application/presentation/utils/constants.dart';
import 'package:zikrabyte_ui/application/presentation/widgets/circle_image_view.dart';
import 'package:flutter/material.dart';

class ChallengesForum extends StatelessWidget {
  const ChallengesForum({
    super.key,required this.title
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              title,
              style: cabin(fontSize: 0.06),
            ),
            const Spacer(),
            const Icon(Icons.sort)
          ],
        ),
        kHeight10,
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            shrinkWrap: true,
            itemBuilder: (context, index) => Challenges(index: index),
          ),
        ),
      ],
    );
  }
}

class Challenges extends StatelessWidget {
  const Challenges({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
          color: kWhite,
          borderRadius: const BorderRadius.all(kRadius10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 5.0,
              offset: const Offset(3.0, 3.0),
              spreadRadius: -2.0,
            )
          ]),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          kHeight5,
          SizedBox(
            height: sWidth * 0.48,
            child: Stack(
              children: [
                Container(
                  height: sWidth * 0.4,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: kRadius10, topRight: kRadius10),
                    image: DecorationImage(
                        image: AssetImage(index % 2 == 0
                            ? 'assets/images/food1.jpeg'
                            : 'assets/images/food2.jpeg'),
                        fit: BoxFit.cover),
                  ),
                ),
                Positioned(
                  left: 20,
                  bottom: 15,
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(kRadius10),
                        color: kWhite),
                    child: Column(
                      children: [
                        Text(
                          '18',
                          style: cabin(fontSize: 0.07, color: kRed),
                        ),
                        Text(
                          'Oct',
                          style: cabin(fontSize: 0.04, color: kBlack),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          kHeight5,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ingredient Restriction Challenge',
                  style: cabin(
                    fontSize: 0.05,
                  ),
                ),
                kHeight5,
                Text(
                  """Choose a specific ingredient (e.g., avocado, lemon, chickpeas) and challenge yourself to create multiple dishes using only that ingredient.""",
                  style: montserrat(),
                ),
                kHeight10,
                Row(
                  children: [
                    SizedBox(
                      width: sWidth * 0.2,
                      child: Stack(
                        children:const [
                          Positioned(
                              left: 30,
                              child: CircleImageTile(
                                image: 'assets/images/person.jpeg',
                                radius: 20,
                              )),
                          Positioned(
                              left: 15,
                              child: CircleImageTile(
                                image: 'assets/images/person.jpeg',
                                radius: 20,
                              )),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: CircleImageTile(
                                image: 'assets/images/person.jpeg',
                                radius: 20,
                              )),
                        ],
                      ),
                    ),
                    Text(
                      'and 10 others',
                      style: montserrat(),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: kGreen, foregroundColor: kWhite),
                      child: const Text('Join Now'),
                    ),
                    kWidth5,
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
