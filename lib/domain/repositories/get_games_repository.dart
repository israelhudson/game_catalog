import '../entities/game_entity.dart';

abstract class GetGamesRepository {
  Future<List<GameEntity>> getGamesByPlatform({required int idPlatform});
}
