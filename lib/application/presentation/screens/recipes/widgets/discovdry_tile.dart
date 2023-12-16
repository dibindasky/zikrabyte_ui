import 'package:zikrabyte_ui/application/presentation/widgets/circle_image_view.dart';
import 'package:zikrabyte_ui/application/presentation/utils/colors.dart';
import 'package:zikrabyte_ui/application/presentation/utils/constants.dart';
import 'package:flutter/material.dart';

class DiscoveryTileRecipe extends StatelessWidget {
  const DiscoveryTileRecipe({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(kRadius10),
      child: ColoredBox(
        color: kGrey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
               Flexible(
                child: Stack(
                  children: const [
                    Positioned(left: 50,child: CircleImageTile(image: 'assets/images/food2.jpeg',)),
                    Positioned(left: 25,child: CircleImageTile(image: 'assets/images/food3.jpeg',)),
                    Align(alignment: Alignment.centerLeft,child: CircleImageTile(image: 'assets/images/food1.jpeg',)),
                  ],
                ),
              ),
              Text('Discover more dishes \nby exploring what’s new',style: montserrat(fontSize: 0.04),),kWidth5,
              const CircleAvatar(backgroundColor: kGreen,child: Icon(Icons.keyboard_arrow_right,color: kWhite,),)
            ],
          ),
        ),
      ),
    );
  }
}


