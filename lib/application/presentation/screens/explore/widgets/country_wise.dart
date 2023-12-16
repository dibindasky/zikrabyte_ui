import 'package:zikrabyte_ui/application/presentation/screens/explore/widgets/foods_list_country.dart';
import 'package:zikrabyte_ui/application/presentation/utils/colors.dart';
import 'package:zikrabyte_ui/application/presentation/utils/constants.dart';
import 'package:zikrabyte_ui/application/presentation/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class ScreenCountryWiseList extends StatelessWidget {
  const ScreenCountryWiseList({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          appbarMaker(title: title, icon: Iconsax.search_normal, normal: true),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              childAspectRatio: 2 / 1.5),
          itemCount: imagesList.length,
          itemBuilder: (context, index) => InkWell(onTap: (){
             pushNewScreen(context, screen: ScreenFoodCatogery(title: catogeryFood[index]));
          },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(kRadius10),
                image: DecorationImage(
                    image: AssetImage(imagesList[index]), fit: BoxFit.cover),
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
                    Text(
                      catogeryFood[index],
                      style: cabin(color: kWhite, fontSize: 0.055),
                    ),
                    Text(
                      '12,356 Recipes',
                      style: montserrat(color: kWhite, fontSize: 0.03),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
