import 'package:flutter_test/flutter_test.dart';
import 'package:game_catalog/data/repositories/get_platforms_repository_imp.dart';
import 'package:game_catalog/domain/entities/platform_entity.dart';
import 'package:game_catalog/domain/repositories/get_platforms_repository.dart';
import 'package:game_catalog/domain/usecases/get_platforms/get_platforms_usecase.dart';
import 'package:game_catalog/domain/usecases/get_platforms/get_platforms_usecase_imp.dart';
import 'package:mocktail/mocktail.dart';

class MockGetPlatformsRepository extends Mock
    implements GetPlatformsRepository {}

class MockGetPlatformsUsecase extends Mock implements GetPlatformsUsecaseImp {}

main() {
  // late GetPlatformsRepository repository;
  // late GetPlatformsUsecase useCase;
  //
  // setUpAll(() {
  //   repository = MockGetPlatformsRepository();
  //   useCase = MockGetPlatformsUsecase();
  // });
  test('Deve retornar uma instancia de Platform', () {
    GetPlatformsRepository repository = GetPlatformsRepositoryImp();
    GetPlatformsUsecase useCase = GetPlatformsUsecaseImp(repository);
    var result = useCase();
    expect(result, isInstanceOf<PlatformEntity>());
  });

  test('Deve retornar uma Unknown name', () {
    GetPlatformsRepository repository = GetPlatformsRepositoryImp();
    GetPlatformsUsecase useCase = GetPlatformsUsecaseImp(repository);

    var result = useCase();
    expect(result.name, 'Unknown');
  });
}
