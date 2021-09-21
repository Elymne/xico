import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:xico/src/definitions/widgets/definition_card_no_data/definition_card_no_data_view_model.dart';

class DefinitionCardNoData extends StatelessWidget {
  final String message;

  DefinitionCardNoData({
    @required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DefinitionCardNoDataViewModel>.reactive(
      builder: (context, model, child) => Card(
        child: Column(
          children: [
            ListTile(
              title: Text(this.message),
              subtitle: Text(""),
            )
          ],
        ),
      ),
      viewModelBuilder: () => DefinitionCardNoDataViewModel(),
    );
  }
}
