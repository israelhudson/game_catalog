import 'package:game_catalog/data/dtos/platform_dto.dart';
import 'package:game_catalog/shared/config/auth/custom/custom_dio.dart';

class PlatformServiceDataSource {
  final CustomDio _client;

  PlatformServiceDataSource({required CustomDio client}) : _client = client;

  Future<List<PlatformDto>> getPlatforms() async {
    final response = await _client.i.post('platforms', data: '''
      fields id, name;
      limit 500;
    ''');

    final data = response.data as List<dynamic>;

    return data
        .map<PlatformDto>((map) => PlatformDto.fromJson(response.data))
        .toList();
  }
}
