import 'package:flutter/material.dart';

class Definition {
  final String definition;
  final String example;
  final List<dynamic> synonyms;
  final List<dynamic> antonyms;

  Definition({@required this.definition, @required this.synonyms, @required this.example, @required this.antonyms});
}
