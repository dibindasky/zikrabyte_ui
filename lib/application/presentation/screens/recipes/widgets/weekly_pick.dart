import 'package:zikrabyte_ui/application/presentation/utils/colors.dart';
import 'package:zikrabyte_ui/application/presentation/utils/constants.dart';
import 'package:flutter/material.dart';

class WeeklyPick extends StatelessWidget {
  const WeeklyPick({
    super.key,required this.image
  });
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
          borderRadius: const BorderRadius.all(kRadius10),
          color: kBlack,
          image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover)),
      height: sWidth * 0.5,
      width: sWidth,
      child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              gradient: const LinearGradient(
                  colors: [kBlack, kNill],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter).scale(0.6),
              borderRadius: const BorderRadius.all(kRadius10)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Weekly Pick',
                    style: cabin(fontSize: 0.07, color: kWhite),
                  ),
                  Text(
                    'This Italian pasta and steak will\n warm up the faintest of hearts.',
                    style: montserrat(
                        color: kWhite,
                        fontWeight: FontWeight.w300,
                        fontSize: 0.05),
                  )
                ],
              ),
              const Spacer(),
              CircleAvatar(
                backgroundColor: kWhite,
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.play_arrow,
                      color: kBlack,
                    )),
              )
            ],
          )),
    );
  }
}
