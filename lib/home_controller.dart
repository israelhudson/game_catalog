import 'package:game_catalog/data/dtos/platform_dto.dart';
import 'package:game_catalog/data/repositories/get_games_repository_imp.dart';
import 'package:game_catalog/domain/entities/game_entity.dart';

import 'data/dtos/game_dto.dart';
import 'data/repositories/get_platforms_repository_imp.dart';
import 'domain/entities/platform_entity.dart';

class HomeController {
  final GetGamesRepositoryImp _getGamesRepositoryImp;
  final GetPlatformsRepositoryImp _getPlatformsRepositoryImp;
  List<PlatformDto> platforms = [];
  List<GameDto> games = [];

  HomeController(this._getGamesRepositoryImp, this._getPlatformsRepositoryImp);

  Future<List<GameEntity>> getGamesByPlatform({required int idPlatform}) async {
    return await _getGamesRepositoryImp.getGamesByPlatform(
        idPlatform: idPlatform);
  }

  Future<List<PlatformEntity>> getPlatforms() async {
    return await _getPlatformsRepositoryImp.getPlatforms();
  }
}
