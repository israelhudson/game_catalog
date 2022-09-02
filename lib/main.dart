import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:game_catalog/home_page.dart';
import 'package:game_catalog/model.dart';
import 'package:game_catalog/shared/config/auth/custom/custom_dio.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gameModel = GameModel();
    final dio = Dio();
    final customDio = CustomDio(dio);

    return MultiProvider(
      providers: [
        Provider<GameModel>(create: (_) => gameModel),
        Provider<Dio>(create: (_) => dio),
        Provider<CustomDio>(create: (_) => customDio),
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
