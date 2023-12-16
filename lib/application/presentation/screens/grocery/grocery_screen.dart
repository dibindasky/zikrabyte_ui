import 'package:zikrabyte_ui/application/presentation/screens/cart/cart_screen.dart';
import 'package:zikrabyte_ui/application/presentation/utils/colors.dart';
import 'package:zikrabyte_ui/application/presentation/utils/constants.dart';
import 'package:zikrabyte_ui/application/presentation/utils/snackshow/snack_bar.dart';
import 'package:zikrabyte_ui/application/presentation/widgets/custom_search_widget.dart';
import 'package:zikrabyte_ui/data/service/cart.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class ScreenGrocery extends StatelessWidget {
  const ScreenGrocery({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Grocery',
          style: cabin(fontSize: 0.08, fontWeight: FontWeight.bold),
        ),
        actions: [
          Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(kRadius50),
                  border: Border.all(color: kGreen)),
              child: IconButton(
                  onPressed: () {
                    pushNewScreen(
                      context,
                      screen: const ScreenCart(),
                      withNavBar: false,
                      pageTransitionAnimation:
                          PageTransitionAnimation.cupertino,
                    );
                  },
                  icon: const Icon(
                    Iconsax.shopping_bag,
                    color: kGreen,
                  ))),
          kWidth20
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const CustomSearchWidget(),
            kHeight10,
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final data = items[index];
                  return Container(
                    margin:
                        const EdgeInsets.only(bottom: 10, left: 10, right: 10),
                    height: sWidth * 0.20,
                    decoration: BoxDecoration(
                        color: kWhite,
                        borderRadius: const BorderRadius.all(kRadius10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            blurRadius: 5.0,
                            offset: const Offset(2.0, 2.0),
                            spreadRadius: -2.0,
                          )
                        ]),
                    child: Row(
                      children: [
                        Container(
                          width: sWidth * 0.25,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                            ),
                            color: kGreen,
                            image: DecorationImage(
                                image: AssetImage(data.image),
                                fit: BoxFit.cover),
                          ),
                        ),
                        kWidth10,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(data.name,
                                style: cabin(
                                    fontSize: 0.045,
                                    fontWeight: FontWeight.w500)),
                            kHeight5,
                            Text(data.ingredients,
                                style: montserrat(fontSize: 0.04)),
                            kHeight5,
                            Text('₹ ${data.price.toString()}',
                                style: montserrat(fontSize: 0.04))
                          ],
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {
                            CartDB.addToCart(item: data);
                            showSnack(
                                context: context,
                                message: '${data.name} added to cart',
                                color: kGreen);
                          },
                          icon: const Icon(
                            Iconsax.add_circle,
                            color: kGreen,
                          ),
                        ),
                        kWidth10
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
