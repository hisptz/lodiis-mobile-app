class AppSemanticVersion {
  int major;
  int minor;
  int patch;

  AppSemanticVersion({
    required this.major,
    required this.minor,
    required this.patch,
  });

  @override
  String toString() {
    return "<$major $minor $patch>";
  }
}
