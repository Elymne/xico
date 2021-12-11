import 'dart:io';

import 'package:xico/core/resources/lang/en.dart';
import 'package:xico/core/resources/lang/fr.dart';
import 'package:xico/core/resources/lang/lang.dart';

extension Translation on String {
  String get tr {
    Lang lang;
    switch (Platform.localeName) {
      case 'en_US':
        lang = En();
        break;
      case 'en_EN':
        lang = En();
        break;
      case 'fr_FR':
        lang = Fr();
        break;
      default:
        lang = Fr();
    }

    return lang.getTr[this] ?? 'Unknow String';
  }
}
