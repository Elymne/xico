import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:stacked/stacked.dart';
import 'package:xico/domain/definitions/entities/meaning.dart';
import 'dart:developer';

import 'package:xico/infrastructure/definitions/repositories/remote/meaning_repository.dart';

class DefinitionPageViewModel extends BaseViewModel {
  DefinitionRepository definitionRepository = Injector.getInjector().get<DefinitionRepository>();

  List<Meaning> _currentMeanings = [];
  List<Meaning> get currentMeanings => _currentMeanings;

  DefinitionPageState _currentState = DefinitionPageState.NO_SEARCHING;
  DefinitionPageState get currentState => _currentState;

  String _currentText = "";

  void onDefinitionSearchFieldUpdated(String text) {
    if (text == "") _noSearching();

    if (text != "") {
      log("searching for : $text");
      _searching();

      definitionRepository.fetchDefinitions(text).then((data) {
        if (_currentText == text) {
          log("data founded for : $text");
          _updateData(data);
        }
      }).catchError((onError) {
        if (_currentText == text) {
          log('error catch : $onError');
          _resetData();
        }
      });
    }

    this._currentText = text;
  }

  void _searching() {
    log("Searching");
    this._currentState = DefinitionPageState.SEARCHING;
    notifyListeners();
  }

  void _noSearching() {
    log("no searching");
    this._currentState = DefinitionPageState.NO_SEARCHING;
    notifyListeners();
  }

  void _updateData(List<Meaning> meanings) {
    this._currentMeanings = meanings;
    this._currentState = DefinitionPageState.FOUNDED;
    notifyListeners();
  }

  void _resetData() {
    this._currentMeanings = [];
    this._currentState = DefinitionPageState.NOT_FOUNDED;
    notifyListeners();
  }
}

enum DefinitionPageState { NO_SEARCHING, SEARCHING, FOUNDED, NOT_FOUNDED }
