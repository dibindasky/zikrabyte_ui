import 'package:zikrabyte_ui/application/presentation/screens/cart/cart_screen.dart';
import 'package:zikrabyte_ui/application/presentation/screens/splash/splash.dart';
import 'package:flutter/material.dart';

import 'routes.dart';

class RouteGenerator {
  Route onGenerateRoute(RouteSettings settings) {
    //final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.initial:
        return MaterialPageRoute(builder: (ctx) => const ScreenSplash());
      case Routes.cart:
        return MaterialPageRoute(builder: (ctx) => const ScreenCart());
      default:
        return _errorScreen();
    }
  }

  static Route<dynamic> _errorScreen() {
    return MaterialPageRoute(builder: (ctx) {
      return Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: const Center(child: Text('Error while navigating')),
      );
    });
  }
}
