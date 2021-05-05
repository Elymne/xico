import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:xico/src/home/widgets/definition_card/definition_card_view_model.dart';
import 'package:xico/src/meanings/models/definition.dart';

class DefinitionCard extends StatelessWidget {
  final List<Definition> definitions;

  DefinitionCard({
    @required this.definitions,
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

    this.definitions.forEach((element) {
      result.add(ListTile(
        leading: Icon(Icons.album),
        title: Text(element.definition),
        subtitle: Text(element.example),
      ));
    });

    return result;
  }
}
