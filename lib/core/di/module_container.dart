import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:xico/core/resources/lang/strings.dart';
import 'package:xico/infrastructure/definitions/repositories/remote/meaning_repository.dart';

class ModuleContainer {
  Injector initialise(Injector injector) {
    // app text implementation.
    injector.map<Strings>((injector) => Strings());
    // Repository implementation.
    injector.map<DefinitionRepository>((injector) => DefinitionRepository());
    return injector;
  }
}
