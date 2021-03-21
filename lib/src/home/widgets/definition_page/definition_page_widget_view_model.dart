import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:stacked/stacked.dart';
import 'package:xico/src/meanings/infrastructures/meaning_repository.dart';
import 'dart:developer';

import 'package:xico/src/meanings/models/meaning.dart';

class DefinitionPageWidgetViewModel extends BaseViewModel {
  List<Meaning> _meanings;
  List<Meaning> get meanings => _meanings;

  DefinitionRepository definitionRepository =
      Injector.getInjector().get<DefinitionRepository>();

  void onDefinitionSearchFieldUpdated(String text) {
    definitionRepository.fetchDefinitions(text).then((data) {
      log(data[0].definitions[0].definition);

      _meanings = data;
      notifyListeners();
    }).catchError((onError) {
      log('data: $onError');
    });
  }
}
