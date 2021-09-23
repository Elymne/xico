import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:xico/application/home/widgets/definition/definition_page_view_model.dart';
import 'package:xico/application/home/widgets/definition/widgets/definition_card/definition_card.dart';
import 'package:xico/application/home/widgets/definition/widgets/definition_card_no_data/definition_card_no_data.dart';
import 'package:xico/domain/definitions/entities/word.dart';

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
          Expanded(child: _displayDefinitions(model.currentMeanings, model.currentState)),
        ],
      ),
      viewModelBuilder: () => DefinitionPageViewModel(),
    );
  }

  /// create a widget from data recovered from ViewModel.
  Widget _displayDefinitions(List<Word> words, DefinitionPageState state) {
    switch (state) {
      case DefinitionPageState.NO_SEARCHING:
        return DefinitionCardNoData(message: "Cherchez une définition");
      case DefinitionPageState.SEARCHING:
        return Center(child: CircularProgressIndicator());
      case DefinitionPageState.FOUNDED:
        return ListView.builder(
          itemCount: words.length,
          itemBuilder: (context, index) {
            return DefinitionCard(word: words[index]);
          },
        );
      case DefinitionPageState.NOT_FOUNDED:
        return DefinitionCardNoData(message: "Définition non trouvé");
      default:
        return DefinitionCardNoData(message: "Undefined state");
    }
  }
}
