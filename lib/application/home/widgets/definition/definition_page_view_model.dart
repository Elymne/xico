import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:stacked/stacked.dart';
import 'package:xico/domain/definitions/entities/word.dart';
import 'dart:developer';
import 'package:xico/domain/definitions/usecases/word_usecases.dart';

class DefinitionPageViewModel extends BaseViewModel {
  final WordUsecases wordUsecases = Injector.getInjector().get<WordUsecases>();

  List<Word> _currentWords = [];
  List<Word> get currentMeanings => _currentWords;

  DefinitionPageState _currentState = DefinitionPageState.NO_SEARCHING;
  DefinitionPageState get currentState => _currentState;

  String _currentText = "";

  void onDefinitionSearchFieldUpdated(String text) {
    if (text == "") _noSearching();

    if (text != "") {
      log("searching for : $text");
      _searching();

      wordUsecases.getWords(text).then((data) {
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

  void _updateData(List<Word> words) {
    this._currentWords = words;
    this._currentState = DefinitionPageState.FOUNDED;
    notifyListeners();
  }

  void _resetData() {
    this._currentWords = [];
    this._currentState = DefinitionPageState.NOT_FOUNDED;
    notifyListeners();
  }
}

enum DefinitionPageState { NO_SEARCHING, SEARCHING, FOUNDED, NOT_FOUNDED }
