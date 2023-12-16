import 'package:zikrabyte_ui/application/presentation/utils/colors.dart';
import 'package:zikrabyte_ui/application/presentation/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ScreenGroupDetail extends StatelessWidget {
  const ScreenGroupDetail({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: sWidth,
        leading: Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back)),
            const CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/images/category2.jpeg'),
            ),
            kWidth5,
            Text(
              title,
              style: cabin(fontSize: 0.06, fontWeight: FontWeight.w500),
            ),
            const Spacer(),
            const Icon(Iconsax.search_normal),
            kWidth10,
            const Icon(Iconsax.more),
            kWidth10
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
            itemCount: imagesList.length,
            itemBuilder: (context, index) => Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                        child: CircleAvatar(
                      backgroundImage: AssetImage(imagesList[index]),
                    )),
                    kWidth10,
                    Expanded(
                        flex: 9,
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(kRadius10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  blurRadius: 5.0,
                                  offset: const Offset(3.0, 3.0),
                                  spreadRadius: -2.0,
                                )
                              ],
                              color: kWhite),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Devon',
                                    style: cabin(
                                        fontSize: 0.05,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  kWidth5,
                                  Text(
                                    '12m ago',
                                    style: montserrat(
                                        fontSize: 0.035,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ],
                              ),
                              Text(
                                """Yummy h @winterbear I love making steamed pork and cabbage dumplings. The combination of flavors is just perfect. I can share the recipe if you're interested?""",
                                style: montserrat(
                                    fontSize: 0.045,
                                    fontWeight: FontWeight.w400),
                              ),
                              kHeight10,
                              Row(
                                children: [
                                  const Icon(
                                    Icons.favorite,
                                    color: kRed,
                                  ),
                                  kWidth5,
                                  Text(
                                    '180 Likes',
                                    style: montserrat(),
                                  ),
                                  kWidth20,
                                  const Icon(Iconsax.message),
                                  kWidth5,
                                  Text(
                                    'Replies',
                                    style: montserrat(),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )),
                  ],
                )),
      ),
      bottomNavigationBar: ListTile(
        leading: const CircleAvatar(
          backgroundImage: AssetImage('assets/images/person.jpeg'),
        ),
        title: SizedBox(
            width: sWidth * 0.80,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(kRadius50),
              child: ColoredBox(
                color: kGrey,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          suffixIcon: const Icon(
                            Iconsax.send1,
                            color: kGreen,
                          ),
                          hintText: 'Discuss here',
                          hintStyle: montserrat(
                              fontWeight: FontWeight.w500,
                              fontSize: 0.04,
                              color: kGreyDark))),
                ),
              ),
            )),
      ),
    );
  }
}
