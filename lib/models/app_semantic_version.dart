class AppSemanticVersion {
  int? major;
  int? minor;
  int? patch;

  AppSemanticVersion({
    this.major,
    this.minor,
    this.patch,
  });

  @override
  String toString() {
    return "<$major $minor $patch>";
  }
}
