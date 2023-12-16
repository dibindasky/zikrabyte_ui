import 'package:zikrabyte_ui/application/presentation/screens/explore/explore_screen.dart';
import 'package:zikrabyte_ui/application/presentation/screens/forum/forum_screen.dart';
import 'package:zikrabyte_ui/application/presentation/screens/grocery/grocery_screen.dart';
import 'package:zikrabyte_ui/application/presentation/screens/profile/profile_screen.dart';
import 'package:zikrabyte_ui/application/presentation/screens/recipes/recipe_screen.dart';
import 'package:zikrabyte_ui/application/presentation/utils/colors.dart';
import 'package:zikrabyte_ui/application/presentation/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    sizeFinder(context);
    return Scaffold(
        body: PersistentTabView(
      context,
      itemAnimationProperties: const ItemAnimationProperties(),
      navBarStyle: NavBarStyle.style15,
      screens: const [
        ScreenRecipies(),
        ScreenGrocery(),
        ScreenExplore(),
        ScreenForum(),
        ScreenProfile()
      ],
      items: [
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.local_dining_outlined),
          title: "Recipie",
          activeColorPrimary: kGreen,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.format_list_bulleted),
          title: ("Grocery"),
          activeColorPrimary: kGreen,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(
            Iconsax.search_normal,
            color: kWhite,
          ),
          title: ("Explore"),
          activeColorPrimary: kGreen,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Iconsax.message),
          title: ("Forum"),
          activeColorPrimary: kGreen,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Iconsax.profile_tick),
          title: ("Profile"),
          activeColorPrimary: kGreen,
          inactiveColorPrimary: Colors.grey,
        ),
      ],
    ));
  }
}
