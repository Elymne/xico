import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:xico/core/resources/lang/strings.dart';
import 'package:xico/domain/definitions/usecases/word_usecases.dart';
import 'package:xico/infrastructure/definitions/factories/word_factory.dart';
import 'package:xico/infrastructure/definitions/repositories/remote/word_repository.dart';

class ModuleContainer {
  Injector initialise(Injector injector) {
    injector.map<Strings>((injector) => Strings());

    injector.map<WordFactory>((injector) => WordFactory());
    injector.map<WordRepository>((injector) => WordRepository());
    injector.map<WordUsecases>((injector) => WordUsecases());
    return injector;
  }
}
