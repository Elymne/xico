import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:stacked/stacked.dart';
import 'package:xico/core/meanings/infrastructures/meaning_repository.dart';
import 'package:xico/core/meanings/models/meaning.dart';
import 'package:xico/src/definitions/widgets/definition_card/definition_card.dart';
import 'dart:developer';

class DefinitionPageWidgetViewModel extends BaseViewModel {
  DefinitionRepository definitionRepository =
      Injector.getInjector().get<DefinitionRepository>();

  List<Meaning> _meanings = [];
  List<Meaning> get meanings => _meanings;

  void onDefinitionSearchFieldUpdated(String text) {
    definitionRepository.fetchDefinitions(text).then((data) {
      _updateMeanings(data);
    }).catchError((onError) {
      log('data: $onError');
    });
  }

  void _updateMeanings(List<Meaning> meanings) {
    _meanings = meanings;
    notifyListeners();
  }
}
