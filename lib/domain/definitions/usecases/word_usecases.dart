import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:xico/domain/definitions/entities/word.dart';
import 'package:xico/infrastructure/definitions/repositories/remote/word_repository.dart';

class WordUsecases {
  final WordRepository wordRepository = Injector.getInjector().get<WordRepository>();

  Future<List<Word>> getWords(String word) async => await wordRepository.read(word);

  Future<Word> getWord(String word) async => (await wordRepository.read(word)).first;
}
