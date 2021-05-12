import 'package:flutter/material.dart';
import 'package:xico/core/meanings/models/definition.dart';

class Meaning {
  final String genre;
  final List<Definition> definitions;

  Meaning({@required this.genre, @required this.definitions});

  factory Meaning.fromJson(Map<String, dynamic> json) {
    return Meaning(
      genre: json["meanings"][0]["partOfSpeech"],
      definitions: json["meanings"][0]["definitions"]
          .map<Definition>((elem) => Definition.fromJson(elem))
          .toList(),
    );
  }
}
