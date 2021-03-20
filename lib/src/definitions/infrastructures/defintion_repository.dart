import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:xico/src/definitions/models/definition.dart';
import 'package:xico/src/definitions/models/meaning.dart';

class DefinitionRepository {
  Future<List<Meaning>> fetchDogDefinitions() async {
    final response =
        await http.get('https://api.dictionaryapi.dev/api/v2/entries/fr/chien');

    if (response.statusCode == 200)
      //return Definition.fromJson(jsonDecode(response.body));
      return json
          .decode(response.body)
          .map<Meaning>((elem) => Meaning.fromJson(elem))
          .toList();
    else
      throw Exception('Failed to load definition');
  }

  Future<Definition> fetchDefinitions(String word) async {
    final response =
        await http.get('https://api.dictionaryapi.dev/api/v2/entries/fr/chien');

    if (response.statusCode == 200)
      return Definition.fromJson(jsonDecode(response.body));
    else
      throw Exception('Failed to load album');
  }
}
