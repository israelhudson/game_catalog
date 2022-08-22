class PlatformEntity {
  final int id;
  final String alternativeName;
  final int category;
  final int createdAt;
  final String name;
  final int platformLogo;

  PlatformEntity(
      {required this.id,
      required this.alternativeName,
      required this.category,
      required this.createdAt,
      required this.name,
      required this.platformLogo});
}
