import 'package:flutter_test/flutter_test.dart';
import 'package:game_catalog/domain/entities/platform_entity.dart';

main() {
  test('Espero que a entitdade não seja nula', () {
    PlatformEntity entity = PlatformEntity(
      id: 1,
      name: 'PSP',
    );
    expect(entity, isNotNull);
  });

  test('Espero que o valor seja Microsoft', () {
    PlatformEntity entity = PlatformEntity(id: 1, name: 'Xbox');

    var resultadoEsperado = 'microsoft';
    entity.setLogica();
    expect(entity.name, resultadoEsperado);
  });
}
