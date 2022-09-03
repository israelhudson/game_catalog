import 'package:game_catalog/data/datasources/game_service_datasource/game_server_datasource_imp.dart';
import 'package:game_catalog/data/dtos/game_dto.dart';

import '../../domain/repositories/get_games_repository.dart';

class GetGamesRepositoryImp implements GetGamesRepository {
  final GameServerDatasourceImp gameServerDataSource;

  GetGamesRepositoryImp(this.gameServerDataSource);

  @override
  Future<List<GameDto>> getGamesByPlatform({required int idPlatform}) {
    return gameServerDataSource.getGamesByPlatform(idPlatform: idPlatform);
  }
}
