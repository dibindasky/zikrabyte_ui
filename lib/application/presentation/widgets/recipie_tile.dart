import 'package:zikrabyte_ui/application/presentation/screens/recipe_detail/recipe_detail.dart';
import 'package:zikrabyte_ui/application/presentation/utils/colors.dart';
import 'package:zikrabyte_ui/application/presentation/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class HomeRecipeTile extends StatelessWidget {
  const HomeRecipeTile({required this.image, super.key, this.isFav = false});
  final String image;
  final bool isFav;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        pushNewScreen(context,
            screen: const ScreenRecipeDetail(title: 'Paella (Pan-seared rice)'),
            withNavBar: false);
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(kRadius10),
            color: kBlack,
            image:
                DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
        height: sWidth * 0.4,
        child: Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                        colors: [kBlack, kBlack],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter)
                    .scale(0.6),
                borderRadius: const BorderRadius.all(kRadius10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(kRadius10),
                    child: ColoredBox(
                      color: isFav
                          ? kRed.withOpacity(0.7)
                          : kWhite.withOpacity(0.5),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Icon(
                          isFav ? Icons.favorite : Icons.favorite_border,
                          color: kWhite,
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Text(
                  'SPAIN',
                  style: montserrat(
                      color: kWhite,
                      fontWeight: FontWeight.w300,
                      fontSize: 0.04),
                ),
                Text(
                  'Paella (Pan-seared rice)',
                  style: cabin(fontSize: 0.04, color: kWhite),
                ),
                Row(
                  children: [
                    Text(
                      'Lunch | 60m',
                      style: montserrat(
                          color: kWhite,
                          fontWeight: FontWeight.w300,
                          fontSize: 0.04),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.star_rate_rounded,
                      color: kYellow,
                    ),
                    Text(
                      '4.9',
                      style: montserrat(color: kYellow, fontSize: 0.045),
                    )
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
