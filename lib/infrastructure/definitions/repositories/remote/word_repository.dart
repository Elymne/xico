import 'dart:convert';
import 'dart:developer';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:http/http.dart' as http;
import 'package:xico/core/abstract_repository.dart';
import 'package:xico/core/resources/uri/api_uri.dart';
import 'package:xico/domain/definitions/entities/word.dart';
import 'package:xico/infrastructure/definitions/factories/word_factory.dart';

class WordRepository implements AbstractRepository<Word, String> {
  final WordFactory definitionRepository = Injector.getInjector().get<WordFactory>();

  @override
  Future<List<Word>> read(String keyword) async {
    try {
      final response = await http.get('https://api.dictionaryapi.dev/api/v2/entries/fr/$keyword');
      if (response.statusCode == 200)
        return json.decode(response.body).map((meanings) => definitionRepository.createWords(meanings)).toList();
      else {
        log('response : ${response.statusCode}');
        throw Exception('Failed to load Words');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<Word>> delete(String keyword) => throw UnimplementedError();

  @override
  Future<List<Word>> update(String keyword) => throw UnimplementedError();

  @override
  Future<Word> write(Word keyword) => throw UnimplementedError();
}
