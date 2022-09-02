import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:game_catalog/model.dart';
import 'package:game_catalog/shared/config/auth/custom/custom_dio.dart';
import 'package:provider/provider.dart';

import 'data/datasources/platform_service_datasource/platform_service_datasource.dart';
import 'data/dtos/platform_dto.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

Future<List<PlatformDto>> loadData(BuildContext context) async {
  List<PlatformDto> games = [];
  final customDio = Provider.of<CustomDio>(context, listen: false);
  try {
    final data = await customDio.i.post('companies',
        data:
            '''-d 'fields change_date,change_date_category,changed_company_id,checksum,country,created_at,description,developed,logo,name,parent,published,slug,start_date,start_date_category,updated_at,url,websites;' \
    ''');
    games = json
        .decode(data.data)
        .map<PlatformDto>((e) => PlatformDto.fromMap(e))
        .toList();
  } on Exception catch (e) {
    debugPrintStack(label: e.toString());
  }
  return games;
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<GameModel>(context);
    final customDio = Provider.of<CustomDio>(context, listen: false);
    Map<String, String> headersMap = {
      "Client-ID": "6s26alivw3doh75e5td9gtrhfg1kww",
      "Authorization": "Bearer rxd7d75ip2t1wu55xt3eo8b7yi8nr3",
      "Access-Control-Allow-Headers": "Access-Control-Allow-Origin, Accept",
      'method': 'GET'
    };
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            FutureBuilder<List<PlatformDto>>(
//           future: customDio.i.post('companies',
//               data:
//                   '''-d 'fields change_date,change_date_category,changed_company_id,checksum,country,created_at,description,developed,logo,name,parent,published,slug,start_date,start_date_category,updated_at,url,websites;' \
// '''),
              future: loadData(context),
              builder: (context, AsyncSnapshot<List<PlatformDto>> snapshot) {
                return snapshot.hasData
                    ? ListView.builder(
                        // render the list
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, index) => Card(
                          margin: const EdgeInsets.all(10),
                          // render list item
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(10),
                            title: Text(snapshot.data![index].name),
                          ),
                        ),
                      )
                    : const Center(
                        // render the loading indicator
                        child: CircularProgressIndicator(),
                      );
              },
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
//             //customDio.i.
// //             var response = await customDio.i.post('companies',
// //                 data:
// //                     '''-d 'fields change_date,change_date_category,changed_company_id,checksum,country,created_at,description,developed,logo,name,parent,published,slug,start_date,start_date_category,updated_at,url,websites;' \
// // ''');
//             var response = await customDio.i.post('game_engine_logos',
//                 data:
//                     '''fields alpha_channel,animated,checksum,height,image_id,url,width;' \
// ''');
//             GameServiceDatasourceImp gameServiceDatasourceImp =
//                 GameServiceDatasourceImp(client: customDio);
//
//             var response = await gameServiceDatasourceImp.getGamesByPlatform(
//                 idPlatform: 11);

            PlatformServiceDataSource platformServiceDataSource =
                PlatformServiceDataSource(client: customDio);

            var response2 = await platformServiceDataSource.getPlatforms();

            print(response2);
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
