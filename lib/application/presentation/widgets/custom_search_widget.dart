import 'package:zikrabyte_ui/application/presentation/utils/colors.dart';
import 'package:zikrabyte_ui/application/presentation/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CustomSearchWidget extends StatelessWidget {
  const CustomSearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(kRadius50),
        child: ColoredBox(
          color: kGrey,
          child: TextField(
            decoration: InputDecoration(
                suffixIcon: const Icon(Iconsax.sort),
                prefixIcon: IconButton(
                  icon: const Icon(Iconsax.search_normal),
                  onPressed: () {},
                ),
                border: InputBorder.none,
                hintText: 'Search ingredients... ',
                hintStyle: montserrat(fontSize: 0.04)),
          ),
        ),
      ),
    );
  }
}
