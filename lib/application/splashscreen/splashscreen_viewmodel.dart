import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:xico/core/router.dart';

class SplashscreenViewmodel extends BaseViewModel {
  void startAnimation(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      RouterFluro.router.navigateTo(
        context,
        'home',
      );
    });
  }
}
