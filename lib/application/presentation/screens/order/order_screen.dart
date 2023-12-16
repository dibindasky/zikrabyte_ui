import 'package:zikrabyte_ui/application/presentation/screens/order/razorpay.dart';
import 'package:zikrabyte_ui/application/presentation/utils/colors.dart';
import 'package:zikrabyte_ui/application/presentation/utils/constants.dart';
import 'package:zikrabyte_ui/application/presentation/widgets/custom_appbar.dart';
import 'package:zikrabyte_ui/data/service/cart.dart';
import 'package:flutter/material.dart';

final List<String> methods = ['Cash On delivery', 'Razorpay'];

class ScreenOrder extends StatefulWidget {
  const ScreenOrder({super.key});

  @override
  State<ScreenOrder> createState() => _ScreenOrderState();
}

class _ScreenOrderState extends State<ScreenOrder> {
  String? selectedPaymnet;
  String email = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarMaker(title: 'Comfirm'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Items in this order',
                  style: montserrat(fontSize: 0.05),
                ),
                kHeight10,
                SizedBox(
                  child: ValueListenableBuilder(
                    valueListenable: cartNotifier,
                    builder: (context, value, child) {
                      return GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3),
                        itemCount: value.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final data = value[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  backgroundImage: AssetImage(data.item.image),
                                  radius: 30,
                                ),
                                kHeight5,
                                Text(data.item.name, style: cabin())
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                Text(
                  'Choose Payment method for ₹${totalNotifier.value}',
                  style: montserrat(),
                ),
                Wrap(
                  children: List.generate(
                    methods.length,
                    (int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: ChoiceChip(
                          padding: const EdgeInsets.all(8),
                          label: Text(methods[index]),
                          selectedColor: kGreen,
                          selected: selectedPaymnet == methods[index],
                          onSelected: (bool selected) {
                            setState(() {
                              selectedPaymnet = methods[index];
                            });
                          },
                        ),
                      );
                    },
                  ).toList(),
                ),
                kHeight20,
                ClipRRect(
                    borderRadius: BorderRadius.all(kRadius20),
                    child: ColoredBox(
                        color: kGrey,
                        child: TextField(
                            onChanged: (value) {
                              setState(() {
                                email = value;
                              });
                            },
                            decoration:
                                InputDecoration(border: InputBorder.none)))),
                kHeight10,
                Text('Provided Email Address', style: montserrat()),
                Text(email, style: cabin()),
                PlaceOrderWithRazorpay(email: email,
                  paymentMethod: selectedPaymnet,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
