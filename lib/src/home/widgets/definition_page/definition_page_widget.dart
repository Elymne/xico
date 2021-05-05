import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:xico/src/home/widgets/definition_page/definition_page_widget_view_model.dart';

class DefinitionPageWidget extends StatefulWidget {
  @override
  _DefinitionPageWidgetState createState() => _DefinitionPageWidgetState();
}

class _DefinitionPageWidgetState extends State<DefinitionPageWidget> {
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
            child: model.definitionCards.isEmpty
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: model.definitionCards.length,
                    itemBuilder: (context, index) {
                      return model.definitionCards[index];
                    },
                    //scrollDirection: Axis.vertical,
                    //children: model.definitionCards,
                  ),
          ),
        ],
      ),
      viewModelBuilder: () => DefinitionPageWidgetViewModel(),
    );
  }
}
