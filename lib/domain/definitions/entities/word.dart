import 'package:flutter/material.dart';
import 'package:xico/domain/definitions/entities/definition.dart';

class Word {
  final String word;
  final String genre;
  final List<Definition> definitions;

  Word({@required this.word, @required this.genre, @required this.definitions});
}
