import 'package:flutter/material.dart';

class Definition {
  final String definition;
  final String example;
  final List<dynamic> synonyms;
  final List<dynamic> antonyms;

  Definition({@required this.definition, @required this.synonyms, @required this.example, @required this.antonyms});

  factory Definition.fromJson(Map<String, dynamic> json) {
    return Definition(
      definition: json["definition"],
      example: json["example"],
      synonyms: json["synonyms"],
      antonyms: json["antonyms"],
    );
  }
}
