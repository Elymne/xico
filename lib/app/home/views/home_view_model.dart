import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  String _title = "Home View";
  String get title => _title;

  int _counter = 0;
  int get counter => _counter;

  void updateCounter() {
    _counter++;

    // A chaque fois que cette fonction est appelé, on notifie la vue lié au modèle que les données ont changées.
    notifyListeners();
  }
}
