import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:xico/core/abstract_repository.dart';
import 'package:xico/core/meanings/models/meaning.dart';

class DefinitionRepository extends AbstractRepository<Meaning> {
  Future<List<Meaning>> fetchDefinitions(String text) async {
    final response =
        await http.get('https://api.dictionaryapi.dev/api/v2/entries/fr/$text');

    if (response.statusCode == 200)
      return json
          .decode(response.body)
          .map<Meaning>((elem) => Meaning.fromJson(elem))
          .toList();
    else
      throw Exception('Failed to load meanings');
  }

  @override
  Future<List<Meaning>> delete(String keyword) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<Meaning>> read(String keyword) {
    // TODO: implement read
    throw UnimplementedError();
  }

  @override
  Future<List<Meaning>> update(String keyword) {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  Future<Meaning> write(Meaning keyword) {
    // TODO: implement write
    throw UnimplementedError();
  }
}
