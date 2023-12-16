import 'package:zikrabyte_ui/application/presentation/utils/colors.dart';
import 'package:flutter/material.dart';
class CircleImageTile extends StatelessWidget {
  const CircleImageTile({
    super.key,required this.image,this.radius=38
  });
  final String image;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(radius: radius,backgroundColor: kGrey,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: CircleAvatar(
          radius: double.infinity,
          backgroundImage:
              AssetImage(image),
        ),
      ),
    );
  }
}
