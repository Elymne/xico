import 'package:xico/domain/definitions/entities/definition.dart';
import 'package:xico/domain/definitions/entities/word.dart';

class WordFactory {
  //TODO comprendre ???
  List<Word> createWords(Map<String, dynamic> json) {
    return json["meanings"].map((meaning) {
      return Word.fromJson(meaning, json["word"]);
    }).toList();
  }
}
