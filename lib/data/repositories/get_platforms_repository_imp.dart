import 'package:game_catalog/data/datasources/platform_service_datasource/platform_server_datasource_imp.dart';
import 'package:game_catalog/domain/entities/platform_entity.dart';
import 'package:game_catalog/domain/repositories/get_platforms_repository.dart';

class GetPlatformsRepositoryImp implements GetPlatformsRepository {
  final PlatformServerDataSourceImp platformServerDataSource;

  GetPlatformsRepositoryImp(this.platformServerDataSource);

  @override
  Future<List<PlatformEntity>> getPlatforms() async {
    return await platformServerDataSource.getPlatforms();
  }
}
