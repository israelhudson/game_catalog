import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:game_catalog/data/datasources/game_service_datasource/game_server_datasource_imp.dart';
import 'package:game_catalog/data/datasources/platform_service_datasource/platform_server_datasource_imp.dart';
import 'package:game_catalog/data/repositories/get_games_repository_imp.dart';
import 'package:game_catalog/home_controller.dart';
import 'package:game_catalog/home_page.dart';
import 'package:game_catalog/shared/config/auth/custom/custom_dio.dart';
import 'package:provider/provider.dart';

import 'data/repositories/get_platforms_repository_imp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dio = Dio();
    final customDio = CustomDio(dio);
    final gameServerDatasourceImp = GameServerDatasourceImp(client: customDio);
    final platformServerDatasourceImp =
        PlatformServerDataSource(client: customDio);
    final getGamesRepositoryImp =
        GetGamesRepositoryImp(gameServerDatasourceImp);
    final getPlatformsRepositoryImp =
        GetPlatformsRepositoryImp(platformServerDatasourceImp);
    final homeController =
        HomeController(getGamesRepositoryImp, getPlatformsRepositoryImp);
    return MultiProvider(
      providers: [
        Provider<CustomDio>(create: (_) => customDio),
        Provider<GameServerDatasourceImp>(
            create: (_) => gameServerDatasourceImp),
        Provider<PlatformServerDataSource>(
            create: (_) => platformServerDatasourceImp),
        Provider<GetGamesRepositoryImp>(create: (_) => getGamesRepositoryImp),
        Provider<GetPlatformsRepositoryImp>(
            create: (_) => getPlatformsRepositoryImp),
        Provider<HomeController>(create: (_) => homeController),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
