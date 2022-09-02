import 'package:game_catalog/domain/entities/platform_entity.dart';
import 'package:game_catalog/domain/repositories/get_platforms_repository.dart';
import 'package:game_catalog/domain/usecases/get_platforms/get_platforms_usecase.dart';

class GetPlatformsUseCaseImp implements GetPlatformsUseCase {
  final GetPlatformsRepository _getPlatformsRepository;

  GetPlatformsUseCaseImp(this._getPlatformsRepository);

  @override
  Future<List<PlatformEntity>> call() async {
    final repository = await _getPlatformsRepository();
    if (repository.isEmpty) {
      return [];
    }
    return repository;
  }
}
