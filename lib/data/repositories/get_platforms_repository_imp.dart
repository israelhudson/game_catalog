import 'package:game_catalog/domain/entities/platform_entity.dart';
import 'package:game_catalog/domain/repositories/get_platforms_repository.dart';

class GetPlatformsRepositoryImp implements GetPlatformsRepository {
  @override
  PlatformEntity call() {
    return PlatformEntity(
      id: 1,
      name: '',
    );
  }
}
