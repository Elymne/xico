import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:xico/src/home/widgets/definition_card/definition_card_view_model.dart';

class DefinitionCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DefinitionCardViewModel>.reactive(
      builder: (context, model, child) => Card(
        child: ListTile(
          leading: Icon(Icons.album),
          title: Text('Chien'),
          subtitle: Text("Un chien, c'est juste un gros chien."),
        ),
      ),
      viewModelBuilder: () => DefinitionCardViewModel(),
    );
  }
}
