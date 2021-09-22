import 'package:fluro/fluro.dart' as Fluro;
import 'package:flutter/material.dart';
import 'package:xico/application/home/home_page.dart';

class RouterFluro {
  static Fluro.Router router = Fluro.Router();

  static Fluro.Handler homeHandler = Fluro.Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) => HomePage());

  static void defineRoutes() {
    router.define("home", handler: homeHandler);
  }
}
