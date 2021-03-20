import 'package:flutter/material.dart';

class Definition {
  final String definition;
  final List<String> synonyms;
  final String example;

  Definition(
      {@required this.definition,
      @required this.synonyms,
      @required this.example});

  factory Definition.fromJson(Map<String, dynamic> json) {
    return Definition(
      definition: json["definition"],
      synonyms: json["synonyms"],
      example: json["example"],
    );
  }
}
