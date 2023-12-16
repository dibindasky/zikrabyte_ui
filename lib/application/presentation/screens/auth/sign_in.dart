import 'package:zikrabyte_ui/application/presentation/screens/home/bottom_bar.dart';
import 'package:zikrabyte_ui/application/presentation/utils/colors.dart';
import 'package:zikrabyte_ui/application/presentation/utils/constants.dart';
import 'package:flutter/material.dart';

TextEditingController nameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class ScreenLogin extends StatelessWidget {
  const ScreenLogin({super.key, required this.signup});

  final bool signup;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 100,
              ),
              Text(
                signup
                    ? 'Welcome to Recipe\nPassport App'
                    : 'Welcome Back! 😊🤗🤗',
                style: cabin(fontSize: 0.1, fontWeight: FontWeight.w500),
              ),
              kHeight10,
              Text(
                'Please enter your account details below!',
                style: montserrat(fontSize: 0.05),
              ),
              kHeight50,
              signup
                  ? CustomTextFormField(
                      controller: nameController,
                      prefixIcon: Icons.person_outlined,
                      hintText: 'Full Name',
                    )
                  : kEmpty,
              kHeight20,
              CustomTextFormField(
                controller: emailController,
                prefixIcon: Icons.mail_outline_rounded,
                hintText: 'Email Address',
              ),
              kHeight20,
              CustomTextFormField(
                controller: passwordController,
                prefixIcon: Icons.lock_outlined,
                sufixIcon: Icons.remove_red_eye_outlined,
                hintText: 'Password',
              ),
              kHeight20,
              signup
                  ? Row(
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              border: Border.all(color: kGreen),
                              borderRadius: const BorderRadius.all(kRadius5)),
                        ),
                        kWidth10,
                        Text(
                          'Accept terms & Condition',
                          style: montserrat(
                              color: kGreen,
                              fontSize: 0.045,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    )
                  : Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Forgot Password?',
                        style: montserrat(
                            color: kGreen,
                            fontSize: 0.045,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
              kHeight20,
              ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                      (route) => false);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kGreen,
                  minimumSize: Size(sWidth, 45),
                ),
                child: Text(
                  'Continue',
                  style: cabin(
                      color: kWhite,
                      fontSize: 0.05,
                      fontWeight: FontWeight.w400),
                ),
              ),
              kHeight30,
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Or continue with',
                  style: montserrat(fontSize: 0.04, color: kGreen),
                ),
              ),
              kHeight30,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  ImageContainerGoogle(),
                  ImageContainerSignUp(image: 'assets/images/facebook.jpeg'),
                  ImageContainerSignUp(image: 'assets/images/twitter.png'),
                  ImageContainerSignUp(image: 'assets/images/apple.png'),
                ],
              ),
              kHeight30,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    signup
                        ? 'Already have account with us?'
                        : 'Dont have an account ? ',
                    style: montserrat(fontSize: 0.04),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ScreenLogin(signup: !signup)));
                    },
                    child: Text(
                      signup ? ' Sign in' : 'Sign Up',
                      style: montserrat(color: kGreen, fontSize: 0.04),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ImageContainerSignUp extends StatelessWidget {
  const ImageContainerSignUp({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color: kGreyDark),
          borderRadius: const BorderRadius.all(kRadius50)),
      child: SizedBox(
        height: 30,
        width: 30,
        child: Image.asset(
          image,
        ),
      ),
    );
  }
}

class ImageContainerGoogle extends StatelessWidget {
  const ImageContainerGoogle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color: kGreyDark),
          borderRadius: const BorderRadius.all(kRadius50)),
      child: Row(
        children: [
          SizedBox(
            height: 30,
            width: 30,
            child: Image.asset(
              'assets/images/google-logo-6278331_1280.png',
            ),
          ),
          kWidth10,
          Text(
            'Google',
            style: montserrat(fontSize: 0.04, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.prefixIcon,
    this.sufixIcon,
    required this.controller,
    required this.hintText,
  });

  final IconData prefixIcon;
  final IconData? sufixIcon;
  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: const BoxDecoration(
        border: Border(
            bottom: BorderSide(),
            top: BorderSide(),
            left: BorderSide(),
            right: BorderSide()),
        borderRadius: BorderRadius.all(kRadius50),
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: montserrat(fontSize: 0.05, color: kGreenDark),
            border: InputBorder.none,
            suffixIcon: IconButton(
                onPressed: () {}, icon: Icon(sufixIcon, color: kGreenDark)),
            prefixIcon: IconButton(
                onPressed: () {}, icon: Icon(prefixIcon, color: kGreenDark))),
      ),
    );
  }
}
