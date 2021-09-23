import 'package:xico/core/resources/lang/lang.dart';
import 'package:xico/core/resources/lang/lang_en.dart';
import 'package:xico/core/resources/lang/lang_fr.dart';

class Strings {
  static final Strings _string = Strings._internal();
  Strings._internal();
  factory Strings() => _string;

  Language _language;
  Language get selectedLanguage => _language;

  Lang _lang;
  Lang get r => _lang;

  void setLanguage(Language lang) {
    _language = lang;
    switch (_language) {
      case Language.FR:
        _lang = LangFr();
        break;
      case Language.EN:
        _lang = LangEn();
        break;
      default:
        _lang = Lang();
        break;
    }
  }
}

enum Language { EN, FR }
