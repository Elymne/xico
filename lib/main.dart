import 'package:flutter/material.dart';
import 'package:xico/config/router.dart';

void main() {
  // Defines all routes on init.
  RouterFluro.defineRoutes();
  // Launch app.
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Xico',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: "home-bis",
      onGenerateRoute: RouterFluro.router.generator,
    );
  }
}
