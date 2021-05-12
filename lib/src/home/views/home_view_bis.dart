import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:xico/src/books/views/book_page_widget.dart';
import 'package:xico/src/definitions/views/definition_page.dart';
import 'package:xico/src/home/views/home_view_model.dart';

/**
 * Home view
 * The purpuse of this main home view is to provide a swipable page view with different component.
 */
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
