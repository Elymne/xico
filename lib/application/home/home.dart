import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:xico/application/home/home_viewmodel.dart';
import 'package:xico/application/home/widgets/menu_item.dart';

class Home extends ViewModelBuilderWidget<HomeViewModel> {
  @override
  Widget builder(BuildContext context, HomeViewModel model, Widget child) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(color: Colors.teal),
            Align(
              alignment: Alignment(-1, -0.6),
              child: Column(
                children: [
                  MenuItem(
                    title: 'Mots',
                    description: 'Cherchez un mot',
                    onTap: () {},
                  ),
                  MenuItem(
                    title: 'Mots',
                    description: 'Cherchez un mot',
                    onTap: () {},
                  ),
                  MenuItem(
                    title: 'Mots',
                    description: 'Cherchez un mot',
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}
