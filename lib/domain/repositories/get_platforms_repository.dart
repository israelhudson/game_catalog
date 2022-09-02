import '../entities/platform_entity.dart';

abstract class GetPlatformsRepository {
  Future<List<PlatformEntity>> call();
}
