import 'package:flutter/material.dart';
import 'package:game_catalog/model.dart';
import 'package:game_catalog/shared/config/auth/custom/custom_dio.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<GameModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final game = GameModel();
          debugPrint('Inject ${model.hashCode}');
          debugPrint('Local ${game.hashCode}');

          try {
            final customDio = Provider.of<CustomDio>(context, listen: false);
            //customDio.i.
            var response = await customDio.i.post('companies',
                data:
                    '''-d 'fields change_date,change_date_category,changed_company_id,checksum,country,created_at,description,developed,logo,name,parent,published,slug,start_date,start_date_category,updated_at,url,websites;' \
''');
            print(response);
          } catch (e) {
            print(e);
          }
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
