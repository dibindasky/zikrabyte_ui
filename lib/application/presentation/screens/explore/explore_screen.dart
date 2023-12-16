import 'package:zikrabyte_ui/application/presentation/screens/explore/widgets/country_wise.dart';
import 'package:zikrabyte_ui/application/presentation/utils/colors.dart';
import 'package:zikrabyte_ui/application/presentation/utils/constants.dart';
import 'package:zikrabyte_ui/application/presentation/widgets/custom_appbar.dart';
import 'package:zikrabyte_ui/application/presentation/widgets/custom_search_widget.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class ScreenExplore extends StatelessWidget {
  const ScreenExplore({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarMaker(title: 'Search'),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const CustomSearchWidget(),
            kHeight10,
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Categories',
                style: cabin(
                  fontWeight: FontWeight.w600,
                  fontSize: 0.055,
                ),
              ),
            ),
            Expanded(
                child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 2 / 1.2,
                  crossAxisCount: 2),
              itemCount: country.length,
              itemBuilder: (context, index) => InkWell(onTap: (){
                pushNewScreen(
                      context,
                      screen: ScreenCountryWiseList(title:country[index] ),
                      withNavBar: false,
                      pageTransitionAnimation:
                          PageTransitionAnimation.cupertino,
                    );
              },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(kRadius10),
                      color: kBlack,
                      image: DecorationImage(
                          image: AssetImage(imagesList[index]),
                          fit: BoxFit.cover)),
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
                    child: Center(
                      child: Text(
                        country[index],
                        style: cabin(
                            color: kWhite,
                            fontSize: 0.05,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
