import 'package:zikrabyte_ui/application/presentation/utils/colors.dart';
import 'package:zikrabyte_ui/application/presentation/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class MyRecipesList extends StatelessWidget {
  const MyRecipesList({super.key, required this.title});
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
            Text(
              'View All',
              style: cabin(fontSize: 0.04, color: kGreen),
            )
          ],
        ),
        kHeight10,
         Row(
          children:const [
            Expanded(
                child: MyRecipieTile(image: 'assets/images/category6.jpeg')),
            kWidth10,
            Expanded(child: MyRecipieTile(image: 'assets/images/round1.jpeg'))
          ],
        ),
      ],
    );
  }
}

class MyRecipieTile extends StatelessWidget {
  const MyRecipieTile({required this.image, super.key, this.isFav = false});
  final String image;
  final bool isFav;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(kRadius10),
          color: kBlack,
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
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
            const Spacer(),
            Text(
              'Chocolate melting fluffy cake',
              style: cabin(fontSize: 0.04, color: kWhite),
            ),
            Row(
              children: [
                Icon(
                  Iconsax.clock,
                  color: kWhite,
                  size: sWidth * 0.035,
                ),
                Text(
                  ' 27 min',
                  style: montserrat(
                      color: kWhite,
                      fontWeight: FontWeight.w300,
                      fontSize: 0.04),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
