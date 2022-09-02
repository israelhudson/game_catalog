import 'package:game_catalog/domain/entities/platform_entity.dart';
import 'package:game_catalog/domain/repositories/get_platforms_repository.dart';
import 'package:game_catalog/domain/usecases/get_platforms/get_platforms_usecase.dart';

class GetPlatformsUseCaseImp implements GetPlatformsUseCase {
  final GetPlatformsRepository _getPlatformsRepository;

  GetPlatformsUseCaseImp(this._getPlatformsRepository);

  @override
  PlatformEntity call() {
    final repository = _getPlatformsRepository();
    if (repository.name == '') {
      repository.name = 'Unknown';
      return repository;
    }
    return _getPlatformsRepository();
  }
}
