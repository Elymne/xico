import 'package:stacked/stacked.dart';
import 'package:xico/src/definitions/infrastructures/defintion_repository.dart';
import 'dart:developer';

class DefinitionPageWidgetViewModel extends BaseViewModel {
  String _title = "Home View";
  String get title => _title;

//todo Peut-être faire de l'injection de dépendance ici.
  DefinitionRepository definitionRepository = DefinitionRepository();

  void onTextFieldUpdated(String text) {
    definitionRepository.fetchDogDefinitions().then((value) {
      log('data: ${value[0].definition}');
    }).catchError((onError) {
      log('data: $onError');
    });
  }
}
