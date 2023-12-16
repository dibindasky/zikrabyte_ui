import 'package:zikrabyte_ui/application/presentation/screens/recipes/widgets/discovdry_tile.dart';
import 'package:zikrabyte_ui/application/presentation/widgets/horizontal_view_recipie.dart';
import 'package:zikrabyte_ui/application/presentation/screens/recipes/widgets/weekly_pick.dart';
import 'package:zikrabyte_ui/application/presentation/utils/constants.dart';
import 'package:zikrabyte_ui/application/presentation/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class ScreenRecipies extends StatelessWidget {
  const ScreenRecipies({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarMaker(title: 'Explore Recipes', icon: Icons.add,normal: false),
      body:   Padding(
        padding:const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children:const [
              WeeklyPick(image: 'assets/images/Pasta1.jpg'),
              kHeight10,
              HorizontalViewRecipiePage(title: 'Recent Recipes'),
              kHeight10,
              DiscoveryTileRecipe(),
              kHeight10,
              HorizontalViewRecipiePage(title: 'Recommended'),
            ],
          ),
        ),
      ),
    );
  }
}

