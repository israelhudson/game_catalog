import '../entities/game_entity.dart';

abstract class GetGamesRepository {
  Future<List<GameEntity>> call({required int idPlatform});
}
