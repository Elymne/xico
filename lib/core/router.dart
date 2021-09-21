import 'package:fluro/fluro.dart' as Fluro;
import 'package:flutter/material.dart';
import 'package:xico/app/home/views/home_view.dart';
import 'package:xico/app/home/views/home_view_bis.dart';

class RouterFluro {
  static Fluro.Router router = Fluro.Router();

  static Fluro.Handler homeHandler = Fluro.Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return HomeView();
  });

  static Fluro.Handler homeBisHandler = Fluro.Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return HomeViewBis();
  });

  static void defineRoutes() {
    router.define("home", handler: homeHandler);
    router.define("home-bis", handler: homeBisHandler);
  }
}
