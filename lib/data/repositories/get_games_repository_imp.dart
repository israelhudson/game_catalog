import 'package:game_catalog/domain/entities/game_entity.dart';

import '../../domain/repositories/get_games_repository.dart';
import '../datasources/game_service_datasource/game_server_datasource.dart';

class GetGamesRepositoryImp implements GetGamesRepository {
  final GameServerDatasource gameServerDataSource;

  GetGamesRepositoryImp(this.gameServerDataSource);

  @override
  Future<List<GameEntity>> getGamesByPlatform({required int idPlatform}) {
    // TODO: implement getGamesByPlatform
    throw UnimplementedError();
  }
}
