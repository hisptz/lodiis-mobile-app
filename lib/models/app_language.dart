class AppLanguage {
  String? id;
  String? name;
  String? translatedName;
  bool? isDefault;
  String? image;

  AppLanguage({
    required this.id,
    required this.name,
    required this.image,
    this.isDefault,
    this.translatedName,
  }) {
    isDefault = isDefault ?? false;
  }

  static List<AppLanguage> getSupportedLanguage() {
    return [
      AppLanguage(
          id: 'lesotho',
          name: 'Sesotho',
          isDefault: true,
          image: 'assets/logos/lesotho-flag.png'),
      AppLanguage(
        id: 'english',
        name: 'English',
        translatedName: 'Sekhooa',
        image: 'assets/logos/lesotho-flag.png',
      ),
    ];
  }

  @override
  String toString() {
    return 'Language < $id $name >';
  }
}
