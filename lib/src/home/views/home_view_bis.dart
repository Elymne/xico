import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:xico/src/home/views/home_view_model.dart';
import 'package:xico/src/home/widgets/book_page/book_page_widget.dart';
import 'package:xico/src/home/widgets/definition_page/definition_page_widget.dart';

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
            DefinitionPageWidget(),
            BookPageWidget(),
          ],
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
