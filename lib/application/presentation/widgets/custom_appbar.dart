import 'package:zikrabyte_ui/application/presentation/utils/colors.dart';
import 'package:zikrabyte_ui/application/presentation/utils/constants.dart';
import 'package:flutter/material.dart';

AppBar appbarMaker(
    {required String title, IconData? icon, bool normal = true}) {
  return AppBar(
    title: Text(
      title,
      style: cabin(fontSize: 0.08, fontWeight: FontWeight.bold),
    ),
    actions: [
      normal
          ? Icon(icon)
          : icon != null
              ? Container(
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(kRadius50),
                      border: Border.all(color: kGreen)),
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        icon,
                        color: kGreen,
                      )))
              : kEmpty,
      normal ? kWidth30 : kWidth20
    ],
  );
}
