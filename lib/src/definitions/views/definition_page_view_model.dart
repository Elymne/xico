import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:stacked/stacked.dart';
import 'package:xico/core/meanings/infrastructures/meaning_repository.dart';
import 'package:xico/core/meanings/models/meaning.dart';
import 'dart:developer';

class DefinitionPageViewModel extends BaseViewModel {
  DefinitionRepository definitionRepository =
      Injector.getInjector().get<DefinitionRepository>();

  static const int NO_SEARCHING = 0;
  static const int SEARCHING = 1;
  static const int FOUNDED = 2;
  static const int NOT_FOUNDED = 3;

  List<Meaning> _meanings = [];
  List<Meaning> get meanings => _meanings;

  int _state = 0;
  int get state => _state;

  String _text = "";

  void onDefinitionSearchFieldUpdated(String text) {
    if (text == "") {
      _noSearching();
    }

    if (text != "") {
      log("searching for : $text");
      _searching();

      definitionRepository.fetchDefinitions(text).then((data) {
        if (_text == text) {
          log("data founded for : $text");
          _updateData(data);
        }
      }).catchError((onError) {
        if (_text == text) {
          log('error catch : $onError');
          _resetData();
        }
      });
    }

    this._text = text;
  }

  void _searching() {
    log("Searching");
    this._state = SEARCHING;
    notifyListeners();
  }

  void _noSearching() {
    log("no searching");
    this._state = NO_SEARCHING;
    notifyListeners();
  }

  void _updateData(List<Meaning> meanings) {
    this._meanings = meanings;
    this._state = FOUNDED;
    notifyListeners();
  }

  void _resetData() {
    this._meanings = [];
    this._state = NOT_FOUNDED;
    notifyListeners();
  }
}
