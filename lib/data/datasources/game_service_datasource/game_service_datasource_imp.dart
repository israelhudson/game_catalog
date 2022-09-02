import 'package:game_catalog/data/dtos/game_dto.dart';
import 'package:game_catalog/shared/config/auth/custom/custom_dio.dart';

import 'game_service_datasource.dart';

class GameServiceDatasourceImp implements GameServiceDatasource {
  final CustomDio _client;

  GameServiceDatasourceImp({required CustomDio client}) : _client = client;

  @override
  Future<List<GameDto>> getGamesByPlatform({required int idPlatform}) async {
    try {
      final response = await _client.i.post(
        'games',
        data: '''
              fields id, name, platforms, summary, screenshots.url, genres.name, platforms.name;
              where platforms = $idPlatform;
              limit 500;
              ''',
      );

      final data = response.data as List<dynamic>;

      return data
          .map<GameDto>((map) => GameDto.fromJson(response.data))
          .toList();
    } catch (e) {
      throw Exception(e);
    }
  }
}
