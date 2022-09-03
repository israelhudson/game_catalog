import 'dart:convert';

import 'package:game_catalog/domain/entities/game_entity.dart';
import 'package:game_catalog/shared/utils/utils.dart';

class GameDto extends GameEntity {
  const GameDto(
      {required super.id,
      required super.name,
      required super.description,
      required super.imageUrl,
      required super.genres,
      required super.platforms});

  GameDto copyWith({
    int? id,
    String? name,
    String? description,
    String? imageUrl,
    List<String?>? genres,
    List<String?>? platforms,
  }) {
    return GameDto(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      genres: genres ?? this.genres,
      platforms: platforms ?? this.platforms,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'imageUrl': imageUrl,
      'genres': genres,
      'platforms': platforms,
    };
  }

  factory GameDto.fromMap(Map<String, dynamic> map) {
    return GameDto(
      id: map['id'],
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      imageUrl: map['screenshots'] != null
          ? GameDtoUtils.getImage(map['screenshots'] as List<dynamic>)
          : '',
      genres: map['genres'] != null
          ? GameDtoUtils.getGenres(map['genres'] as List<dynamic>)
          : null,
      platforms: GameDtoUtils.getPlatforms(map['platforms'] as List<dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory GameDto.fromJson(String source) =>
      GameDto.fromMap(json.decode(source));

  @override
  String toString() {
    return 'GameDto(id: $id, name: $name, description: $description, imageUrl: $imageUrl, genres: $genres, platforms: $platforms)';
  }
}
