import '../../entities/game_entity.dart';

abstract class GetGamesUseCase {
  Future<List<GameEntity>> call({required int idPlatform});
}
