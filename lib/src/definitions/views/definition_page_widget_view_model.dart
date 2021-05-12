import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:stacked/stacked.dart';
import 'package:xico/core/meanings/infrastructures/meaning_repository.dart';
import 'package:xico/core/meanings/models/meaning.dart';
import 'dart:developer';

class DefinitionPageWidgetViewModel extends BaseViewModel {
  DefinitionRepository definitionRepository =
      Injector.getInjector().get<DefinitionRepository>();

  List<Meaning> _meanings = [];
  List<Meaning> get meanings => _meanings;

  void onDefinitionSearchFieldUpdated(String text) {
    definitionRepository.fetchDefinitions(text).then((data) {
      this._updateMeanings(data);
    }).catchError((onError) {
      log('data: $onError');
      this._clearMeanings();
    });
  }

  void _updateMeanings(List<Meaning> meanings) {
    this._meanings = meanings;
    notifyListeners();
  }

  void _clearMeanings() {
    this._meanings = [];
    notifyListeners();
  }
}
