import 'package:zikrabyte_ui/application/presentation/screens/order/order_screen.dart';
import 'package:zikrabyte_ui/application/presentation/utils/colors.dart';
import 'package:zikrabyte_ui/application/presentation/utils/constants.dart';
import 'package:zikrabyte_ui/application/presentation/widgets/custom_appbar.dart';
import 'package:zikrabyte_ui/data/service/cart.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ScreenCart extends StatelessWidget {
  const ScreenCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarMaker(title: 'Cart'),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ValueListenableBuilder(
          valueListenable: cartNotifier,
          builder: (context, value, child) {
            if(value.isEmpty)return const Center(child: Text('nothing in cart'),);
            return ListView.builder(
                itemCount: value.length,
                itemBuilder: (context, index) {
                  final data = value[index];
                  return Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 5.0,
                              offset: const Offset(3.0, 3.0),
                              spreadRadius: -2.0,
                            )
                          ],
                          color: kGreen,
                          borderRadius: const BorderRadius.all(kRadius10)),
                      child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: AssetImage(data.item.image),
                          ),
                          title: Text(
                            data.item.name,
                            style: cabin(color: kWhite),
                          ),
                          trailing: SizedBox(
                            width: sWidth * 0.3,
                            child: Row(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      CartDB.decQuantity(item: data);
                                    },
                                    icon: const Icon(Iconsax.minus)),
                                Text(
                                  data.quantity.toString(),
                                  style: cabin(color: kWhite, fontSize: 0.05),
                                ),
                                IconButton(
                                    onPressed: () {
                                      CartDB.addQuantity(item: data);
                                    },
                                    icon: const Icon(Iconsax.add)),
                              ],
                            ),
                          )));
                });
          },
        ),
      ),
      bottomNavigationBar: ValueListenableBuilder(
          valueListenable: totalNotifier,
          builder: (context, total, _) {
            if (total == 0) return kEmpty;
            return Container(
              margin: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(kRadius10), color: kGrey),
              height: sWidth * 0.3,
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Cart total ',
                        style: cabin(fontSize: 0.04),
                      ),
                      const Spacer(),
                      Text(
                        '₹ ${total.toString()}',
                        style: cabin(fontSize: 0.04),
                      )
                    ],
                  ),
                  kHeight10,
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ScreenOrder()));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                          color: kGreen,
                          borderRadius: BorderRadius.all(kRadius10)),
                      child: Center(
                        child: Text(
                          'Proceed To Payment',
                          style: cabin(color: kWhite, fontSize: 0.04),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
