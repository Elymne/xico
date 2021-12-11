import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:xico/application/splashscreen/splashscreen_viewmodel.dart';
import 'package:xico/core/resources/lang/translation.dart';

class Splashscreen extends ViewModelBuilderWidget<SplashscreenViewmodel> {
  @override
  Widget builder(BuildContext context, SplashscreenViewmodel model, Widget child) {
    model.startAnimation(context);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('app_name'.tr),
        ),
      ),
    );
  }

  @override
  SplashscreenViewmodel viewModelBuilder(BuildContext context) => SplashscreenViewmodel();
}
