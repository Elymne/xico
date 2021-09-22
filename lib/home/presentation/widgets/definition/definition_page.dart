import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:xico/home/domain/definitions/entities/meaning.dart';
import 'package:xico/home/presentation/widgets/definition/definition_page_view_model.dart';
import 'package:xico/home/presentation/widgets/definition/widgets/definition_card/definition_card.dart';
import 'package:xico/home/presentation/widgets/definition/widgets/definition_card_no_data/definition_card_no_data.dart';

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
  Widget _displayDefinitions(List<Meaning> meanings, DefinitionPageState state) {
    switch (state) {
      case DefinitionPageState.NO_SEARCHING:
        return DefinitionCardNoData(message: "Cherchez une définition");
      case DefinitionPageState.SEARCHING:
        return Center(child: CircularProgressIndicator());
      case DefinitionPageState.FOUNDED:
        return ListView.builder(
          itemCount: meanings.length,
          itemBuilder: (context, index) {
            return DefinitionCard(meaning: meanings[index]);
          },
        );
      case DefinitionPageState.NOT_FOUNDED:
        return DefinitionCardNoData(message: "Définition non trouvé");
      default:
        return DefinitionCardNoData(message: "Undefined state");
    }
  }
}
