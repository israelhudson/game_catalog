import 'package:game_catalog/data/dtos/game_dto.dart';
import 'package:game_catalog/shared/config/auth/custom/custom_dio.dart';

import 'game_server_datasource.dart';

class GameServerDatasourceImp implements GameServerDatasource {
  final CustomDio _client;

  GameServerDatasourceImp({required CustomDio client}) : _client = client;

  @override
  Future<List<GameDto>> getGamesByPlatform({required int idPlatform}) async {
    try {
      final response = await _client.i.post(
        'games',
        data: '''
              fields id, name, platforms, summary, screenshots.url, genres.name, platforms.name;
              where platforms = $idPlatform;
              limit 5;
              ''',
      );

      final data = response.data as List<dynamic>;

      return data
          .map<GameDto>((map) => GameDto.fromMap(map as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception(e);
    }
  }
}
