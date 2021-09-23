import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:xico/application/home/home_page_view_model.dart';
import 'package:xico/application/home/widgets/book/book_page_widget.dart';
import 'package:xico/application/home/widgets/definition/definition_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomePageViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('home page'),
        ),
        body: PageView(
          children: <Widget>[
            DefinitionPage(),
            BookPageView(),
          ],
        ),
      ),
      viewModelBuilder: () => HomePageViewModel(),
    );
  }
}
