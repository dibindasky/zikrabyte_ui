import 'dart:developer';

import 'package:zikrabyte_ui/application/presentation/utils/colors.dart';
import 'package:zikrabyte_ui/application/presentation/utils/constants.dart';
import 'package:zikrabyte_ui/application/presentation/utils/snackshow/snack_bar.dart';
import 'package:zikrabyte_ui/data/service/cart.dart';
import 'package:zikrabyte_ui/data/service/mail.dart';
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PlaceOrderWithRazorpay extends StatefulWidget {
  const PlaceOrderWithRazorpay({super.key, required this.paymentMethod,required this.email});
  final String? paymentMethod;
  final String email;

  @override
  State<PlaceOrderWithRazorpay> createState() => _PlaceOrderWithRazorpayState();
}

class _PlaceOrderWithRazorpayState extends State<PlaceOrderWithRazorpay> {
  late Razorpay _razorpay;
  int paymentId = 0;

  @override
  void initState() {
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
            onTap: () async {
              if (widget.paymentMethod == null) {
                showSnack(context: context, message: 'choose a paymetn option');
              }else if(!widget.email.contains('@gmail.com')){
                showSnack(
                    context: context,
                    message: 'enter valid email id to continue',
                    color: kRed);
              }
               else if (widget.paymentMethod == 'Cash On delivery') {
                Mail.mail('eamil id');
                 CartDB.clearCart();
                showSnack(
                    context: context,
                    message: 'your order hase been placed',
                    color: kGreen);
                Navigator.pop(context);
                Navigator.pop(context);
              } else {
                var options = {
                  'method': {
                    'netbanking': true,
                    'card': true,
                    'upi': true,
                    'wallet': true,
                  },
                  'key': 'rzp_test_pfmFeCViv6CU5K',
                  'amount': 100 * 100, //in the smallest currency sub-unit.
                  'name': 'user',
                  'description': 'razorpay jerseyhub',
                  "entity": "order",
                  "currency": "INR",
                  "status": "created",
                  "notes": [],
                  'timeout': 60, // in seconds
                  'prefill': {
                    'contact': '9895123545',
                    'email': 'user@gmail.com'
                  }
                };
                _razorpay.open(options);
              }
            },
            child: Container(
              width: sWidth,
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                  color: kGreen, borderRadius: BorderRadius.all(kRadius10)),
              child: const Center(child: Text('Place oreder')),
            )));
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Mail.mail('email id');
    showSnack(context: context, message: 'payment success', color: kGreen);
    showSnack(
        context: context,
        message: 'your order hase been placed',
        color: kGreen);
      CartDB.clearCart();
    Navigator.pop(context);
    Navigator.pop(context);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    showSnack(context: context, message: 'paymetn failed', color: kRed);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    log('external handler');
  }
}
