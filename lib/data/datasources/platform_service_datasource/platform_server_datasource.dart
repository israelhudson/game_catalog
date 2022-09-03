import '../../dtos/platform_dto.dart';

abstract class PlatformServerDatasource {
  Future<List<PlatformDto>> getPlatforms();
}
