class StringData {
  static final StringData _stringData = StringData._internal();
  Lang _lang;
  Map<String, String> data;

  factory StringData() => _stringData;

  StringData._internal();

  void setLang(Lang lang) {
    this._lang = lang;
    switch (this._lang) {
      case Lang.FR:
        this._setFrStringData();
        break;
      case Lang.EN:
        this._setEnStringData();
        break;
      default:
        this._setEnStringData();
        break;
    }
  }

  Lang getLang() => this._lang;

  /// FR data string.
  void _setFrStringData() => this.data = {"title": "Xico"};

  /// EN data string.
  void _setEnStringData() => this.data = {"title": "Xico"};
}

enum Lang { EN, FR }
