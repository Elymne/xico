import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:xico/src/definitions/views/definition_page_view_model.dart';
import 'package:xico/src/definitions/widgets/definition_card/definition_card.dart';

class DefinitionPage extends StatefulWidget {
  @override
  _DefinitionPageState createState() => _DefinitionPageState();
}

class _DefinitionPageState extends State<DefinitionPage> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DefinitionPageViewModel>.reactive(
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
      viewModelBuilder: () => DefinitionPageViewModel(),
    );
  }
}
