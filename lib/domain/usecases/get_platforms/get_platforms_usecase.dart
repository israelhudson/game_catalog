import 'package:game_catalog/domain/entities/platform_entity.dart';

abstract class GetPlatformsUseCase {
  Future<List<PlatformEntity>> call();
}
