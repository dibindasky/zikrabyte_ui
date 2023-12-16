import 'package:zikrabyte_ui/application/presentation/screens/recipe_detail/recipe_detail.dart';
import 'package:zikrabyte_ui/application/presentation/utils/colors.dart';
import 'package:zikrabyte_ui/application/presentation/utils/constants.dart';
import 'package:zikrabyte_ui/application/presentation/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class ScreenFoodCatogery extends StatelessWidget {
  const ScreenFoodCatogery({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          appbarMaker(title: title, icon: Iconsax.search_normal, normal: true),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(kRadius10),
                    color: kBlack,
                    image: DecorationImage(
                        image: AssetImage('assets/images/pialla_steam_rice.jpeg'),
                        fit: BoxFit.cover)),
                height: sWidth * 0.43,
                width: sWidth,
                child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                                colors: [kBlack, kBlack.withOpacity(0.8)],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter)
                            .scale(0.6),
                        borderRadius: const BorderRadius.all(kRadius10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: cabin(fontSize: 0.07, color: kWhite),
                        ),
                       Text(
                          '18,265 Recipes',
                          style: montserrat(
                              color: kWhite,
                              fontWeight: FontWeight.w300,
                              fontSize: 0.035),
                        )
                      ],
                    )),
              ),
              kHeight20,
              Row(
                children: [
                  Text(
                    'Sort by',
                    style: cabin(fontSize: 0.06),
                  ),
                  const Spacer(),
                  Text(
                    'Most Popular',
                    style: cabin(fontSize: 0.05, color: kGreen),
                  ),kWidth5,
                  const RotatedBox(
                      quarterTurns: 45,
                      child: Icon(
                        Icons.compare_arrows_outlined,
                        color: kGreen,
                      ))
                ],
              ),
              kHeight10,
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    childAspectRatio: 2 / 1.5),
                itemCount: imagesList.length,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    pushNewScreen(context, screen: ScreenRecipeDetail(title: itemsFoodCatogery[index]));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(kRadius10),
                      image: DecorationImage(
                          image: AssetImage(imagesList[index]),
                          fit: BoxFit.cover),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                                  colors: [kBlack, kBlack],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter)
                              .scale(0.6),
                          borderRadius: const BorderRadius.all(kRadius10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(kRadius10),
                              child: ColoredBox(
                                color: kWhite.withOpacity(0.5),
                                child: const Padding(
                                  padding: EdgeInsets.all(6.0),
                                  child: Icon(
                                    Icons.favorite_border,size: 18,
                                    color: kWhite,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Spacer(),
                          Text(
                            itemsFoodCatogery[index],
                            style: cabin(color: kWhite, fontSize: 0.055),
                          ),
                          Row(
                            children: [
                              Text(
                                'By Andrew Jun',
                                style:
                                    montserrat(color: kWhite, fontSize: 0.03),
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.star_rate_rounded,
                                color: kYellow,
                              ),
                              Text(
                                '4.9',
                                style:
                                    montserrat(color: kYellow, fontSize: 0.045),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
