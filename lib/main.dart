import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:xico/core/di/module_container.dart';
import 'package:xico/core/router.dart';
import 'package:xico/app.dart';

void main() {
  // Init Injector.
  ModuleContainer().initialise(Injector.getInjector());
  // Defines all routes on init.
  RouterFluro.defineRoutes();
  // LaunchApp
  runApp(App());
}
