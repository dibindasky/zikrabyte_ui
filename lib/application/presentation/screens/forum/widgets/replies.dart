import 'package:zikrabyte_ui/application/presentation/utils/colors.dart';
import 'package:zikrabyte_ui/application/presentation/utils/constants.dart';
import 'package:zikrabyte_ui/application/presentation/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ScreenReplies extends StatelessWidget {
  const ScreenReplies({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarMaker(title: 'Replies', icon: Iconsax.search_normal),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          foregroundColor: kWhite,
                          backgroundColor: kGreen,
                          elevation: 0),
                      child: const Text('Top'),
                    ),
                  ),
                  kWidth10,
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          foregroundColor: kBlack,
                          backgroundColor: kWhite,
                          side: const BorderSide(color: kGreyDark),
                          elevation: 0),
                      child: const Text('Newest'),
                    ),
                  ),
                  kWidth10,
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          foregroundColor: kBlack,
                          side: const BorderSide(color: kGreyDark),
                          backgroundColor: kWhite,
                          elevation: 0),
                      child: const Text('Oldest'),
                    ),
                  ),
                ],
              ),
              const ReplaysList(),
            ],
          ),
        ),
      ),
    );
  }
}

class ReplaysList extends StatelessWidget {
  const ReplaysList({
    super.key,this.physics = false
  });

  final bool physics;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: physics?const NeverScrollableScrollPhysics():null,
        shrinkWrap: true,
        itemCount: imagesList.length,
        itemBuilder: (context, index) => Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: CircleAvatar(
                  backgroundImage: AssetImage(imagesList[index]),
                )),
                kWidth10,
                Expanded(
                    flex: 9,
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Devon',
                                style: cabin(
                                    fontSize: 0.05,
                                    fontWeight: FontWeight.w500),
                              ),
                              kWidth5,
                              Text(
                                '@devonfood',
                                style: montserrat(
                                    fontSize: 0.035,
                                    fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                          Text(
                            """🥞💖 Can't wait to try this recipe! Fluffy pancakes are my weakness! 😍 Thanks for sharing""",
                            style: montserrat(
                                fontSize: 0.045,
                                fontWeight: FontWeight.w400),
                          ),
                          kHeight10,
                          Row(
                            children: [
                              const Icon(Iconsax.lovely),
                              kWidth5,
                              Text(
                                '80 Likes',
                                style: montserrat(),
                              ),
                              const Spacer(),
                              const Icon(Iconsax.message),
                              kWidth5,
                              Text(
                                '10 replies',
                                style: montserrat(),
                              ),
                              const Spacer(),
                              const Icon(Iconsax.eye),
                              kWidth5,
                              Text(
                                '250 views',
                                style: montserrat(),
                              )
                            ],
                          )
                        ],
                      ),
                    )),
              ],
            ));
  }
}
