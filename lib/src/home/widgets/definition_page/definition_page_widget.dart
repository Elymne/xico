import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:xico/src/home/widgets/definition_card/definition_card.dart';
import 'package:xico/src/home/widgets/definition_page/definition_page_widget_view_model.dart';

class DefinitionPageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DefinitionPageWidgetViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.all(20),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Cherchez une définition'),
                onChanged: (text) {
                  model.onTextFieldUpdated(text);
                },
              ),
            ),
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  DefinitionCard(),
                  DefinitionCard(),
                  DefinitionCard(),
                ],
              ),
            ),
          ],
        ),
      ),
      viewModelBuilder: () => DefinitionPageWidgetViewModel(),
    );
  }
}
