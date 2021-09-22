import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:xico/core/resources/string_data.dart';
import 'package:xico/home/infrastructure/definitions/repositories/remote/meaning_repository.dart';

class ModuleContainer {
  Injector initialise(Injector injector) {
    // app text implementation.
    injector.map<StringData>((injector) => StringData());
    // Repository implementation.
    injector.map<DefinitionRepository>((injector) => DefinitionRepository());
    return injector;
  }
}
