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

  // This widget is the root of your application.
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
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
