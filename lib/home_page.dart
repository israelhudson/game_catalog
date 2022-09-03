import 'package:flutter/material.dart';
import 'package:game_catalog/data/dtos/game_dto.dart';
import 'package:provider/provider.dart';

import 'home_controller.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<HomeController>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: 600,
          height: 600,
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: PlatformEnum.values.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                        child:
                            Chip(label: Text(PlatformEnum.values[index].name)),
                        onTap: () {
                          controller.setPlatform(
                              idPlatform:
                                  PlatformEnum.values[index].idPlatform);
                        });
                  },
                ),
              ),
              Expanded(
                flex: 10,
                child: AnimatedBuilder(
                    animation: controller,
                    builder: (_, __) {
                      return FutureBuilder<List<GameDto>>(
                        future: controller.getGamesByPlatform(
                            idPlatform: controller.currentPlatform),
                        builder:
                            (context, AsyncSnapshot<List<GameDto>> snapshot) {
                          if (snapshot.error != null) {
                            return Text('Error: ${snapshot.error} ');
                          }

                          return snapshot.hasData
                              ? GridView.builder(
                                  gridDelegate:
                                      const SliverGridDelegateWithMaxCrossAxisExtent(
                                          maxCrossAxisExtent: 200,
                                          childAspectRatio: 3 / 3,
                                          crossAxisSpacing: 20,
                                          mainAxisSpacing: 20),
                                  itemCount: snapshot.data!.length,
                                  itemBuilder: (BuildContext context, index) =>
                                      Card(
                                    margin: const EdgeInsets.all(10),
                                    // render list item
                                    child: ListTile(
                                      contentPadding: const EdgeInsets.all(10),
                                      title: Image.network(
                                          'http:${snapshot.data![index].imageUrl!}'),
                                      subtitle:
                                          Text(snapshot.data![index].name),
                                    ),
                                  ),
                                )
                              : const Center(
                                  // render the loading indicator
                                  child: CircularProgressIndicator(),
                                );
                        },
                      );
                    }),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await controller.getGames();
        },
        tooltip: 'action',
        child: const Icon(Icons.add),
      ),
    );
  }
}
