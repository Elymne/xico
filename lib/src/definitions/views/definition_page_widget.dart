import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:xico/src/definitions/views/definition_page_widget_view_model.dart';
import 'package:xico/src/definitions/widgets/definition_card/definition_card.dart';

class DefinitionPageView extends StatefulWidget {
  @override
  _DefinitionPageViewState createState() => _DefinitionPageViewState();
}

class _DefinitionPageViewState extends State<DefinitionPageView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DefinitionPageWidgetViewModel>.reactive(
      builder: (context, model, child) => Column(
        children: [
          Container(
            margin: EdgeInsets.all(20),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Cherchez une définition'),
              onChanged: (text) {
                setState(() {
                  model.onDefinitionSearchFieldUpdated(text);
                });
              },
            ),
          ),
          Expanded(
            child: model.meanings.isEmpty
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: model.meanings.length,
                    itemBuilder: (context, index) {
                      return DefinitionCard(meaning: model.meanings[index]);
                    },
                  ),
          ),
        ],
      ),
      viewModelBuilder: () => DefinitionPageWidgetViewModel(),
    );
  }
}
