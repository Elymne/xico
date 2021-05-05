import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:stacked/stacked.dart';
import 'package:xico/src/home/widgets/definition_card/definition_card.dart';
import 'package:xico/src/meanings/infrastructures/meaning_repository.dart';
import 'package:xico/src/meanings/models/meaning.dart';
import 'dart:developer';

class DefinitionPageWidgetViewModel extends BaseViewModel {
  List<DefinitionCard> _definitionCards = [];
  List<DefinitionCard> get definitionCards => _definitionCards = [];

  DefinitionRepository definitionRepository =
      Injector.getInjector().get<DefinitionRepository>();

  void onDefinitionSearchFieldUpdated(String text) {
    definitionRepository.fetchDefinitions(text).then((data) {
      _updateDefinitionCards(data);
    }).catchError((onError) {
      log('data: $onError');
    });
  }

  void _updateDefinitionCards(List<Meaning> meanings) {
    _definitionCards.clear();
    meanings.forEach((element) {
      _definitionCards.add(
        DefinitionCard(definitions: element.definitions),
      );
    });
    notifyListeners();
  }
}
