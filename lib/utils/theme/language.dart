abstract class Language {
  String get submit;

  String get appName;
}

class English extends Language {
  String get submit => "Submit";

  String get appName => "Have It";
}
