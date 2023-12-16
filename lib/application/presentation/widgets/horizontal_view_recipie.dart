import 'package:zikrabyte_ui/application/presentation/widgets/recipie_tile.dart';
import 'package:zikrabyte_ui/application/presentation/utils/colors.dart';
import 'package:zikrabyte_ui/application/presentation/utils/constants.dart';
import 'package:flutter/material.dart';

class HorizontalViewRecipiePage extends StatelessWidget {
  const HorizontalViewRecipiePage({super.key, required this.title,this.isFav=false});
  final String title;
  final bool isFav;

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
          children: [
            Expanded(
                child: HomeRecipeTile(
              image: 'assets/images/pialla_steam_rice.jpeg',isFav: isFav,
            )),
            kWidth10,
            Expanded(child: HomeRecipeTile(image: 'assets/images/sushi.jpeg',isFav: isFav,))
          ],
        ),
      ],
    );
  }
}
