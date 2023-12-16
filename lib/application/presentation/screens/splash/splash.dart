import 'package:zikrabyte_ui/application/presentation/screens/auth/sign_in.dart';
import 'package:zikrabyte_ui/application/presentation/utils/colors.dart';
import 'package:zikrabyte_ui/application/presentation/utils/constants.dart';
import 'package:flutter/material.dart';

class ScreenSplash extends StatelessWidget {
  const ScreenSplash({super.key});

  @override
  Widget build(BuildContext context) {
    sizeFinder(context);
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image:
                  AssetImage('assets/images/pexels-dapur-melodi-1109197.jpg'),
              fit: BoxFit.cover),
        ),
        child: ColoredBox(
          color: kBlack.withOpacity(0.6),
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Recipie Passport',
                  style: cabin(
                      fontSize: 0.13,
                      color: kWhite,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  'Welcome to recipe passport where you\nvirtually travel the world through recipes.',
                  style: montserrat(fontSize: 0.04, color: kWhite),
                ),
                kHeight30,
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ScreenLogin(signup: false)));
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(sWidth, 50), backgroundColor: kGreen),
                  child: Text(
                    'Get Started',
                    style: cabin(fontSize: 0.05, color: kWhite),
                  ),
                ),
                kHeight50
              ],
            ),
          ),
        ),
      ),
    );
  }
}
