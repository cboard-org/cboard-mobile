class LocaleModel {
  static List<String> localeList = [
    // Not sure if should hard-code or retrieve from API
    'One',
    'Two',
    'Three',
  ];

  static List<String> get locales => localeList;
}
