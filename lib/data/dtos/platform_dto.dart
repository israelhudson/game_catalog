import 'dart:convert';

import '../../domain/entities/platform_entity.dart';

class PlatformDto extends PlatformEntity {
  late int idPlatform;
  late String namePlatform;
  PlatformDto({
    required int idPlatform,
    required String namePlatform,
  }) : super(id: idPlatform, name: namePlatform);

  PlatformDto copyWith({
    int? idPlatform,
    String? namePlatform,
  }) {
    return PlatformDto(
      idPlatform: idPlatform ?? this.idPlatform,
      namePlatform: namePlatform ?? this.namePlatform,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'idPlatform': idPlatform,
      'namePlatform': namePlatform,
    };
  }

  factory PlatformDto.fromMap(Map<String, dynamic> map) {
    return PlatformDto(
      idPlatform: map['idPlatform']?.toInt() ?? 0,
      namePlatform: map['namePlatform'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PlatformDto.fromJson(String source) =>
      PlatformDto.fromMap(json.decode(source));

  @override
  String toString() =>
      'PlatformDto(idPlatform: $idPlatform, namePlatform: $namePlatform)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PlatformDto &&
        other.idPlatform == idPlatform &&
        other.namePlatform == namePlatform;
  }

  @override
  int get hashCode => idPlatform.hashCode ^ namePlatform.hashCode;
}
