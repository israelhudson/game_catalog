import 'package:game_catalog/domain/entities/game_entity.dart';

import '../../domain/repositories/get_games_repository.dart';

class GetGamesRepositoryImp implements GetGamesRepository {
  @override
  Future<List<GameEntity>> getGamesByPlatform({required int idPlatform}) {
    // TODO: implement getGamesByPlatform
    throw UnimplementedError();
  }
}
