import 'package:zikrabyte_ui/application/presentation/screens/forum/widgets/challenges_tab.dart';
import 'package:zikrabyte_ui/application/presentation/screens/profile/widgets/my_recipies.dart';
import 'package:zikrabyte_ui/application/presentation/utils/colors.dart';
import 'package:zikrabyte_ui/application/presentation/utils/constants.dart';
import 'package:zikrabyte_ui/application/presentation/widgets/custom_appbar.dart';
import 'package:zikrabyte_ui/application/presentation/widgets/horizontal_view_recipie.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ScreenProfile extends StatelessWidget {
  const ScreenProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarMaker(title: 'Explore Recipes', icon: Iconsax.setting),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/person.jpeg'),
                  ),
                  kWidth20,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'DeAndre Walters',
                        style:
                            cabin(fontWeight: FontWeight.w600, fontSize: 0.07),
                      ),
                      Text(
                        'deandrewalters.me@gmail.com',
                        style: montserrat(
                            fontWeight: FontWeight.w500,
                            fontSize: 0.04,
                            color: kBlack.withOpacity(0.8)),
                      ),
                      kHeight10,
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(kRadius20),
                            border: Border.all()),
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          'Edit Profile',
                          style: montserrat(
                              fontWeight: FontWeight.w600,
                              fontSize: 0.04,
                              color: kBlack),
                        ),
                      )
                    ],
                  )
                ],
              ),
              kHeight20,
              const MyRecipesList(title: 'My Recipes'),
              kHeight20,
              const HorizontalViewRecipiePage(
                  title: 'Saved Recipes', isFav: true),
              kHeight20,
              Row(
                children: [
                  Text(
                    'Saved Challenges',
                    style: cabin(fontSize: 0.06),
                  ),
                  const Spacer(),
                  Text(
                    'View All',
                    style: cabin(fontSize: 0.04, color: kGreen),
                  )
                ],
              ),
              ListView.builder(physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                shrinkWrap: true,
                itemBuilder: (context, index) => Challenges(index: index),
              )
            ],
          ),
        ),
      ),
    );
  }
}
