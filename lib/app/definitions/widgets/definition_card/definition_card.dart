import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:xico/app/definitions/widgets/definition_card/definition_card_view_model.dart';
import 'package:xico/core/meanings/models/meaning.dart';

class DefinitionCard extends StatelessWidget {
  final Meaning meaning;

  DefinitionCard({
    @required this.meaning,
  });

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DefinitionCardViewModel>.reactive(
      builder: (context, model, child) => Card(
        child: Column(
          children: this._createDefinitionElements(),
        ),
      ),
      viewModelBuilder: () => DefinitionCardViewModel(),
    );
  }

  List<ListTile> _createDefinitionElements() {
    List<ListTile> result = [];

    this.meaning.definitions.forEach((element) {
      result.add(ListTile(
        leading: Icon(Icons.album),
        title: Text(element.definition != null ? element.definition : "(données non trouvées)"),
        subtitle: Text(element.example != null ? "exemple : ${element.example}" : "(pas d'exemple)"),
      ));
    });

    return result;
  }
}
