import 'package:flutter/cupertino.dart';
import 'package:game_catalog/data/repositories/get_games_repository_imp.dart';
import 'package:game_catalog/domain/entities/game_entity.dart';

import '../../../data/dtos/game_dto.dart';
import '../../../data/repositories/get_platforms_repository_imp.dart';
import '../../../domain/entities/platform_entity.dart';

class HomeController extends ChangeNotifier {
  final GetGamesRepositoryImp _getGamesRepositoryImp;
  final GetPlatformsRepositoryImp _getPlatformsRepositoryImp;
  List<PlatformEntity> platforms = [];
  List<List<GameEntity>> games = [];
  List<GameEntity> currentGames = [];
  int currentPlatform = PlatformEnum.values.first.idPlatform;

  HomeController(this._getGamesRepositoryImp, this._getPlatformsRepositoryImp);

  Future<List<GameDto>> getGamesByPlatform({required int idPlatform}) async {
    return await _getGamesRepositoryImp.getGamesByPlatform(
        idPlatform: idPlatform);
  }

  Future<List<PlatformEntity>> getPlatforms() async {
    return await _getPlatformsRepositoryImp.getPlatforms();
  }

  Future<void> getGames() async {
    PlatformEnum.values.forEach((element) async {
      currentGames
          .addAll(await getGamesByPlatform(idPlatform: element.idPlatform));
      notifyListeners();
    });
  }

  setGame({required List<GameEntity> games}) {
    currentGames = games;

    notifyListeners();
  }

  setPlatform({required int idPlatform}) {
    currentPlatform = idPlatform;
    notifyListeners();
  }
}

enum PlatformEnum {
  nintendo64(4),
  playstation(48),
  xbox(49),
  android(34),
  ios(39);

  final int idPlatform;

  const PlatformEnum(this.idPlatform);

  String get displayName {
    switch (this) {
      case PlatformEnum.nintendo64:
        return 'Nintendo 64';
      case PlatformEnum.playstation:
        return 'Playstation';
      case PlatformEnum.xbox:
        return 'Xbox';
      case PlatformEnum.android:
        return 'Android';
      case PlatformEnum.ios:
        return 'iOS';
      default:
        return 'Unknown';
    }
  }
}
