class AppLanguage {
  String id;
  String name;
  bool isDefault;
  String image;

  AppLanguage({this.id, this.name, this.image, this.isDefault}) {
    this.isDefault = this.isDefault ?? false;
  }

  static List<AppLanguage> getSupporttedLanguage() {
    return [
      AppLanguage(
          id: 'lesotho',
          name: 'Lesotho',
          isDefault: true,
          image: 'assets/logos/lesotho-flag.png'),
      AppLanguage(
        id: 'english',
        name: 'English',
        image: 'assets/logos/usa-flag.png',
      ),
    ];
  }

  @override
  String toString() {
    return 'Language < $id $name >';
  }
}
