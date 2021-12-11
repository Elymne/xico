import 'package:fluro/fluro.dart' as Fluro;
import 'package:flutter/material.dart';
import 'package:xico/application/home/home.dart';
import 'package:xico/application/splashscreen/splashscreen.dart';

class RouterFluro {
  static Fluro.Router router = Fluro.Router();

  static Fluro.Handler splashscreenHandler = Fluro.Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) => Splashscreen());
  static Fluro.Handler homeHandler = Fluro.Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) => Home());

  static void defineRoutes() {
    router.define("splashscreen", handler: splashscreenHandler);
    router.define("home", handler: homeHandler);
  }
}
