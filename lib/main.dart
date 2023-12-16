import 'package:zikrabyte_ui/application/presentation/routes/route_generator.dart';
import 'package:zikrabyte_ui/application/presentation/routes/routes.dart';
import 'package:zikrabyte_ui/application/presentation/utils/constants.dart';
import 'package:flutter/material.dart';

void main() {
  createItems();
  runApp(const RecipesApp());
}

class RecipesApp extends StatelessWidget {
  const RecipesApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: RouteGenerator().onGenerateRoute,
      initialRoute: Routes.initial,
    );
  }
}
