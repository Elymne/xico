import 'package:xico/core/resources/language_const.dart';

class StringData {
  static final StringData _stringData = StringData._internal();
  String _lang;
  Map<String, String> data;

  factory StringData() {
    return _stringData;
  }

  StringData._internal();

  void setLang(String lang) {
    this._lang = lang;

    switch (this._lang) {
      case LanguageConst.FR:
        this._setFrStringData();
        break;
      case LanguageConst.EN:
        this._setEnStringData();
        break;
      default:
        this._setEnStringData();
        break;
    }
  }

  String getLang() {
    return this._lang;
  }

  /// FR data string.
  void _setFrStringData() {
    this.data = {"title": "Xico"};
  }

  /// EN data string.
  void _setEnStringData() {
    this.data = {"title": "Xico"};
  }
}
