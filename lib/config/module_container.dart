import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:xico/src/meanings/infrastructures/meaning_repository.dart';

class ModuleContainer {
  Injector initialise(Injector injector) {
    injector.map<DefinitionRepository>((injector) => DefinitionRepository());
    return injector;
  }
}
