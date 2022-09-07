import 'package:game_catalog/core/config/auth/custom/custom_dio.dart';
import 'package:game_catalog/data/datasources/platform_service_datasource/platform_server_datasource.dart';
import 'package:game_catalog/data/dtos/platform_dto.dart';

class PlatformServerDataSourceImp implements PlatformServerDatasource {
  final CustomDio _client;

  PlatformServerDataSourceImp({required CustomDio client}) : _client = client;

  @override
  Future<List<PlatformDto>> getPlatforms() async {
    final response = await _client.i.post('platforms', data: '''
      fields id, name;
      limit 5;
    ''');

    final data = response.data as List<dynamic>;

    return data
        .map<PlatformDto>(
            (map) => PlatformDto.fromMap(map as Map<String, dynamic>))
        .toList();
  }
}
