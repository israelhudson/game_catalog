import 'package:equatable/equatable.dart';

class GameEntity extends Equatable {
  const GameEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.genres,
    required this.platforms,
  });

  final int id;
  final String name;
  final String? imageUrl;
  final String? description;
  final List<String?>? genres;
  final List<String?> platforms;

  @override
  List<Object?> get props =>
      [id, name, description, imageUrl, genres, platforms];
}
