import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:xico/application/home/widgets/book/book_page_widget_view_model.dart';

class BookPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BookPageWidgetViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('home page'),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Voici un texte."),
            RaisedButton(
              color: Colors.blue,
              onPressed: () {
                print("Button pressed");
              },
            ),
          ],
        )),
      ),
      viewModelBuilder: () => BookPageWidgetViewModel(),
    );
  }
}
