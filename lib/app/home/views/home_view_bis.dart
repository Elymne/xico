import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:xico/app/books/views/book_page_widget.dart';
import 'package:xico/app/definitions/views/definition_page.dart';
import 'package:xico/app/home/views/home_view_model.dart';

class HomeViewBis extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
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
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
