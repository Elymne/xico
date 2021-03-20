import 'package:sqflite/sqflite.dart';

class DbProvider {
  DbProvider._();
  static Database _database;
  static final DbProvider db = DbProvider._();

  // todo : On peut optimiser ceci surement.
  Future<Database> get database async {
    if (_database != null) return _database;

    //_database = await initDB();
    return _database;
  }
}
