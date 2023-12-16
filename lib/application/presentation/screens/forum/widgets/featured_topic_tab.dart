import 'package:zikrabyte_ui/application/presentation/screens/forum/widgets/replies.dart';
import 'package:flutter/material.dart';
import 'package:zikrabyte_ui/application/presentation/utils/colors.dart';
import 'package:zikrabyte_ui/application/presentation/utils/constants.dart';
import 'package:iconsax/iconsax.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class FeaturedTopic extends StatelessWidget {
  const FeaturedTopic({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      shrinkWrap: true,
      itemBuilder: (context, index) => PostRecipe(index: index),
    );
  }
}

class PostRecipe extends StatelessWidget {
  const PostRecipe({
    required this.index,
    super.key,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Expanded(
            child: Padding(
          padding: EdgeInsets.only(top: 10),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/images/person.jpeg'),
          ),
        )),
        kWidth10,
        Expanded(
          flex: 9,
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Bellington',
                      style: cabin(fontSize: 0.04, fontWeight: FontWeight.w400),
                    ),
                    kWidth5,
                    Text(
                      '@bellingCook',
                      style: cabin(
                          fontSize: 0.035,
                          fontWeight: FontWeight.w300,
                          color: kGreyDark),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(kRadius10),
                          color: kGrey),
                      child: const Icon(
                        Icons.favorite_border,
                        color: kBlack,
                      ),
                    )
                  ],
                ),
                const Text('1h ago'),
                Text(
                  """Rise and shine, pancake lovers! 🌞🥞 Today, I'm sharing a recipe that'll turn your breakfast into a scrumptious delight! Behold, the Fluffy Pancakes that are sure to make your taste buds dance with joy! 💃🕺""",
                  style: montserrat(),
                ),
                kHeight5,
                Container(
                  height: sWidth * 0.4,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(kRadius10),
                    image: DecorationImage(
                        image: AssetImage(index % 2 == 0
                            ? 'assets/images/category9.jpeg'
                            : 'assets/images/category7.jpeg'),
                        fit: BoxFit.cover),
                  ),
                ),
                kHeight5,
                Row(
                  children: [
                    const Icon(Iconsax.lovely),
                    kWidth5,
                    Text(
                      '180 Likes',
                      style: montserrat(),
                    ),
                    const Spacer(),
                    InkWell(
                        onTap: () {
                          pushNewScreen(context, screen: const ScreenReplies(),withNavBar: false);
                        },
                        child: const Icon(Iconsax.message)),
                    kWidth5,
                    InkWell(
                      onTap: () {
                        pushNewScreen(context, screen: const ScreenReplies(),withNavBar: false);
                      },
                      child: Text(
                        '100 replies',
                        style: montserrat(),
                      ),
                    ),
                    const Spacer(),
                    const Icon(Iconsax.eye),
                    kWidth5,
                    Text(
                      '350 views',
                      style: montserrat(),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
