import 'package:flutter/material.dart';
import 'package:xico/core/router.dart';

class App extends StatelessWidget {
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
