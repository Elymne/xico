import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:xico/core/module_container.dart';
import 'package:xico/core/router.dart';

void main() {
  // Init Injector.
  ModuleContainer().initialise(Injector.getInjector());

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
