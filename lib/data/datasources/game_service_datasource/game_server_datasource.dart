import 'package:game_catalog/data/dtos/game_dto.dart';

abstract class GameServerDatasource {
  Future<List<GameDto>> getGamesByPlatform({required int idPlatform});
}
