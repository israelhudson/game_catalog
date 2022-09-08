import 'package:flutter/material.dart';
import 'package:game_catalog/core/bind/app_bind.dart';
import 'package:game_catalog/core/config/theme/theme_config.dart';
import 'package:game_catalog/screens/home/presenter/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: AppBinds.providers,
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
        builder: (context, child) {
          final themeConfig = ThemeConfig.i;
          return AnimatedBuilder(
              animation: themeConfig,
              builder: (_, __) {
                return Theme(
                  data: themeConfig.isDarkTheme
                      ? ThemeData.dark()
                      : ThemeData(primarySwatch: Colors.yellow),
                  child: child!,
                );
              });
        },
      ),
    );
  }
}
