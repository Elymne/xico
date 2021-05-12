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
        {
          this.setFrStringData();
        }
        break;

      default:
        {
          this.setFrStringData();
        }
        break;
    }
  }

  String getLang() {
    return this._lang;
  }

  void setFrStringData() {
    this.data = {"title": "Xico"};
  }
}
