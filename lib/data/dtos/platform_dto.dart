import '../../domain/entities/platform_entity.dart';

class PlatformDto extends PlatformEntity {
  late int idPlatform;
  late String alternativeNamePlatform;
  late int categoryPlatform;
  late int createdAtPlatform;
  late String namePlatform;
  late int platformLogoPlatform;

  PlatformDto(
      {required idPlatform,
      required alternativeNamePlatform,
      required categoryPlatform,
      required createdAtPlatform,
      required namePlatform,
      required platformLogoPlatform})
      : super(
            id: idPlatform,
            alternativeName: alternativeNamePlatform,
            category: categoryPlatform,
            createdAt: createdAtPlatform,
            name: namePlatform,
            platformLogo: platformLogoPlatform);

  toMap() {
    return {
      'id': id,
      'alternativeName': alternativeName,
      'category': category,
      'createdAt': createdAt,
      'name': name,
      'platformLogo': platformLogo,
    };
  }

  PlatformDto fromMap(Map<String, dynamic> map) {
    return PlatformDto(
      idPlatform: map['id'],
      alternativeNamePlatform: map['alternativeName'],
      categoryPlatform: map['category'],
      createdAtPlatform: map['createdAt'],
      namePlatform: map['name'],
      platformLogoPlatform: map['platformLogo'],
    );
  }
}
