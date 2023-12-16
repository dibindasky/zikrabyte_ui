import 'package:zikrabyte_ui/application/presentation/screens/forum/widgets/replies.dart';
import 'package:zikrabyte_ui/application/presentation/utils/colors.dart';
import 'package:zikrabyte_ui/application/presentation/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TabViewRecipe extends StatefulWidget {
  const TabViewRecipe({super.key});

  @override
  State<TabViewRecipe> createState() => _TabViewRecipeState();
}

class _TabViewRecipeState extends State<TabViewRecipe> {
  int index = 0;
  setIndex(int n) {
    setState(() {
      index = n;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(kRadius50),
            child: ColoredBox(
              color: kGrey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  tabButton(0, 'Overview'),
                  tabButton(1, 'Ingredients'),
                  tabButton(2, 'Directions'),
                ],
              ),
            ),
          ),
        ),
        kHeight10,
        Container(
          padding: const EdgeInsets.all(20),
          width: double.infinity,
          height: sWidth * 0.8,
          child: tabs[index],
        )
      ],
    );
  }

  List<Widget> tabs = [
    Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Text(
        """Yangnyeom is crispy fried chicken coated in sweet and spicy sauce. It's accompanied by pickled radishes, sliced scallions, and a side of rice. Cold beer or soft drinks are popular pairings. Enjoy!""",
        style: montserrat(fontSize: 0.04),
      ),
      kHeight20,
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          getRedContainer(Iconsax.clock, '12 min', 'Cook time'),
          kWidth10,
          getRedContainer(Icons.fireplace, '245', 'Calories'),
          kWidth10,
          getRedContainer(Iconsax.location, 'Korea', 'Origin'),
        ],
      ),kHeight10,
      Text(
        'Reviews (209)',
        style: cabin(fontSize: 0.05, fontWeight: FontWeight.w500),
      ),kHeight10,
      const Expanded(child: ReplaysList())
    ]),
    Column(
      children: [
        Row(
          children: [
            Text(
              'Ingrediants',
              style: cabin(fontSize: 0.05),
            ),
            kWidth5,
            Text(
              '(12)',
              style: montserrat(
                  color: kRed, fontSize: 0.05, fontWeight: FontWeight.w500),
            ),
            const Spacer(),
            Text(
              '4 Servings',
              style: cabin(fontSize: 0.04, color: kGreyDark),
            ),
            kWidth5,
            const Icon(
              Iconsax.minus_cirlce,
              size: 20,
              color: kGreyDark,
            ),
            kWidth5,
            const Icon(
              Iconsax.add_circle,
              size: 20,
              color: kGreyDark,
            ),
          ],
        ),
        kHeight10,
        Expanded(
            child: ListView.builder(
          itemCount: 6,
          shrinkWrap: true,
          itemBuilder: (context, index) => ListTile(
            leading: Checkbox(
              value: index % 2 == 0,
              onChanged: (_) {},
              activeColor: kGreen,
              side: const BorderSide(color: kGreen),
            ),
            title: Text(
              'Chicken Wings',
              style: montserrat(fontSize: 0.04, fontWeight: FontWeight.w500),
            ),
            trailing: Text(
              '700g',
              style: montserrat(fontSize: 0.04, fontWeight: FontWeight.w500),
            ),
          ),
        ))
      ],
    ),
    Expanded(
      child: ListView(
        shrinkWrap: true,
        children: [
          directions(1),
          kHeight20,
          directions(2),
          kHeight20,
          directions(3),
        ],
      ),
    )
  ];

  ElevatedButton tabButton(int n, String title) {
    return ElevatedButton(
      onPressed: () => setIndex(n),
      style: ElevatedButton.styleFrom(
          foregroundColor: index == n ? kWhite : kGreyDark,
          backgroundColor: index == n ? kGreen : kNill,
          elevation: 0),
      child: Text(title),
    );
  }
}

Expanded getRedContainer(IconData icon, String title, String subTitle) {
  return Expanded(
    child: ClipRRect(
      borderRadius: const BorderRadius.all(kRadius10),
      child: ColoredBox(
        color: kRed.withOpacity(0.1),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(
                    icon,
                    color: kRed,
                  ),
                  kWidth5,
                  Text(
                    title,
                    style: montserrat(
                        color: kRed,
                        fontSize: 0.04,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
              kHeight5,
              Text(
                subTitle,
                style: montserrat(fontSize: 0.035, fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
      ),
    ),
  );
}

Row directions(int n) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
          child: CircleAvatar(
        backgroundColor: kGreen,
        child: Text(
          n.toString(),
          style: cabin(color: kWhite),
        ),
      )),
      kWidth10,
      Expanded(
          flex: 9,
          child: Column(
            children: [
              Text(
                """Heat 2 inches of oil in a large heavy frying pan over medium hight heat for about 10 to 12 minutes until the oil temperature reaches 330-350º. Combine all the ingredients and mix altogether.""",
                style: montserrat(fontSize: 0.04, fontWeight: FontWeight.w500),
              ),
              kHeight10,
              ClipRRect(
                borderRadius: const BorderRadius.all(kRadius10),
                child: SizedBox(
                    height: sWidth * 0.4,
                    width: sWidth * 0.6,
                    child: Image.asset(
                      'assets/images/category1.jpeg',
                      fit: BoxFit.cover,
                    )),
              )
            ],
          ))
    ],
  );
}
