import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:xico/core/meanings/models/meaning.dart';
import 'package:xico/src/definitions/views/definition_page_view_model.dart';
import 'package:xico/src/definitions/widgets/definition_card/definition_card.dart';
import 'package:xico/src/definitions/widgets/definition_card_no_data/definition_card_no_data.dart';

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
                hintText: 'Cherchez une définition',
              ),
              onChanged: (text) {
                setState(() {
                  model.onDefinitionSearchFieldUpdated(text);
                });
              },
            ),
          ),
          Expanded(child: _displayDefinitions(model.meanings, model.state)),
        ],
      ),
      viewModelBuilder: () => DefinitionPageViewModel(),
    );
  }

  /// create a widget from data recovered from ViewModel.
  Widget _displayDefinitions(List<Meaning> meanings, int state) {
    switch (state) {
      case DefinitionPageViewModel.NO_SEARCHING:
        return DefinitionCardNoData(message: "Cherchez une définition");
      case DefinitionPageViewModel.SEARCHING:
        return Center(child: CircularProgressIndicator());
      case DefinitionPageViewModel.FOUNDED:
        return ListView.builder(
          itemCount: meanings.length,
          itemBuilder: (context, index) {
            return DefinitionCard(meaning: meanings[index]);
          },
        );
      case DefinitionPageViewModel.NOT_FOUNDED:
        return DefinitionCardNoData(message: "Définition non trouvé");
      default:
        return DefinitionCardNoData(message: "Undefined state");
    }
  }
}
