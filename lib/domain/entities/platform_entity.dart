class PlatformEntity {
  final int id;
  late String alternativeName;
  final int category;
  final int createdAt;
  late String name;
  final int platformLogo;

  PlatformEntity(
      {required this.id,
      required this.alternativeName,
      required this.category,
      required this.createdAt,
      required this.name,
      required this.platformLogo});

  setLogica() {
    if (name.toLowerCase() == "Xbox".toLowerCase()) {
      alternativeName = "microsoft";
    }
  }
}
