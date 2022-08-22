import 'package:game_catalog/domain/entities/platform_entity.dart';
import 'package:game_catalog/domain/repositories/get_platforms_repository.dart';
import 'package:game_catalog/domain/usecases/get_platforms/get_platforms_usecase.dart';

class GetPlatformsUsecaseImp implements GetPlatformsUsecase {
  final GetPlatformsRepository _getPlatformsRepository;

  GetPlatformsUsecaseImp(this._getPlatformsRepository);

  @override
  PlatformEntity call() {
    return _getPlatformsRepository();
  }
}
