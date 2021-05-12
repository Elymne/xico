import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:xico/src/definitions/widgets/definition_card_no_data/definition_card_no_data_view_model.dart';

class DefinitionCardNoData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DefinitionCardNoDataViewModel>.reactive(
      builder: (context, model, child) => Card(
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.dangerous),
              title: Text("Pas de définition"),
              subtitle: Text(""),
            )
          ],
        ),
      ),
      viewModelBuilder: () => DefinitionCardNoDataViewModel(),
    );
  }
}
