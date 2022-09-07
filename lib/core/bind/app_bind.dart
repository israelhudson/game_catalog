import 'package:dio/dio.dart';
import 'package:game_catalog/core/config/auth/custom/custom_dio.dart';
import 'package:game_catalog/data/repositories/get_games_repository_imp.dart';
import 'package:game_catalog/data/repositories/get_platforms_repository_imp.dart';
import 'package:game_catalog/domain/usecases/get_games/get_games_usecase_imp.dart';
import 'package:game_catalog/domain/usecases/get_platforms/get_platforms_usecase_imp.dart';
import 'package:game_catalog/screens/home/bloc/home_controller.dart';
import 'package:game_catalog/screens/home/bloc/home_page_bloc.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../data/datasources/game_service_datasource/game_server_datasource_imp.dart';
import '../../data/datasources/platform_service_datasource/platform_server_datasource_imp.dart';

class AppBinds {
  static List<SingleChildWidget> get providers {
    return [
      ...bindConfigService,
      ...bindDataSources,
      ...bindRepositories,
      ...bindBlocs,
      ...bindUseCases,
    ];
  }

  static List<SingleChildWidget> get bindDataSources {
    return [
      Provider<GameServerDatasourceImp>(
          create: (ctx) =>
              GameServerDatasourceImp(client: ctx.read<CustomDio>())),
      Provider<PlatformServerDataSourceImp>(
          create: (ctx) =>
              PlatformServerDataSourceImp(client: ctx.read<CustomDio>())),
    ];
  }

  static List<SingleChildWidget> get bindBlocs {
    return [
      Provider<HomeController>(
          create: (ctx) => HomeController(ctx.read<GetGamesRepositoryImp>(),
              ctx.read<GetPlatformsRepositoryImp>())),
      Provider<GamePageBloc>(
          create: (ctx) => GamePageBloc(ctx.read<GetGamesRepositoryImp>())),
    ];
  }

  static List<SingleChildWidget> get bindRepositories {
    return [
      Provider<GetGamesRepositoryImp>(
          create: (ctx) =>
              GetGamesRepositoryImp(ctx.read<GameServerDatasourceImp>())),
      Provider<GetPlatformsRepositoryImp>(
          create: (ctx) => GetPlatformsRepositoryImp(
              ctx.read<PlatformServerDataSourceImp>())),
    ];
  }

  static List<SingleChildWidget> get bindConfigService {
    final dio = Dio();
    final customDio = CustomDio(dio);
    return [
      Provider<CustomDio>(create: (ctx) => customDio),
    ];
  }

  static List<SingleChildWidget> get bindUseCases {
    return [
      Provider<GetGamesUseCaseImp>(
          create: (ctx) =>
              GetGamesUseCaseImp(ctx.read<GetGamesRepositoryImp>())),
      Provider<GetPlatformsUseCaseImp>(
          create: (ctx) =>
              GetPlatformsUseCaseImp(ctx.read<GetPlatformsRepositoryImp>())),
    ];
  }
}
