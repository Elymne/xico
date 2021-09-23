import 'package:flutter/material.dart';

class Definition {
  final String definition;
  final String example;
  final List<String> synonyms;
  final List<String> antonyms;

  Definition({@required this.definition, @required this.synonyms, @required this.example, @required this.antonyms});
}
