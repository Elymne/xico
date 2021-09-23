import 'package:xico/domain/definitions/entities/definition.dart';
import 'package:xico/domain/definitions/entities/word.dart';

class WordFactory {
  List<Word> createWords(Map<String, dynamic> json) {
    return json["meanings"].map((meaning) {
      return Word(
        word: json["word"],
        genre: meaning["partOfSpeech"],
        definitions: meaning["definitions"].map((elem) => createDefinition(elem)).toList(),
      );
    }).toList();
  }

  Definition createDefinition(Map<String, dynamic> json) {
    return Definition(
      definition: json["definition"],
      example: json["example"],
      synonyms: json["synonyms"],
      antonyms: json["antonyms"],
    );
  }
}
