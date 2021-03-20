import 'package:flutter/material.dart';
import 'package:xico/src/definitions/models/definition.dart';

class Meaning {
  final String genre;
  final List<Definition> definitions;

  Meaning({@required this.genre, @required this.definitions});

  factory Meaning.fromJson(Map<String, dynamic> json) {
    return Meaning(
      genre: json["partOfSpeech"],
      definitions: json["definitions"]
          .map<Definition>((elem) => Definition.fromJson(elem))
          .toList(),
    );
  }
}
