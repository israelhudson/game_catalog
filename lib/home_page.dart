import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_catalog/data/repositories/get_games_repository_imp.dart';
import 'package:game_catalog/game_bloc/game_event.dart';
import 'package:game_catalog/game_bloc/game_page_bloc.dart';
import 'package:game_catalog/game_bloc/game_state.dart';
import 'package:provider/provider.dart';

import 'home_controller.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late GamePageBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = GamePageBloc(context.read<GetGamesRepositoryImp>())
      ..add(ListGamesEvent(idPlatform: PlatformEnum.values.first.idPlatform));
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<HomeController>(context);
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<GamePageBloc, GameState>(
          bloc: bloc,
          builder: (context, state) {
            return Text('Games Catalog ${bloc.currentGame}');
          },
        ),
        //title: Text('Games Catalog'),
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
                          bloc.add(ListGamesEvent(
                              idPlatform:
                                  PlatformEnum.values[index].idPlatform));
                        });
                  },
                ),
              ),
              Expanded(
                flex: 10,
                child: BlocBuilder<GamePageBloc, GameState>(
                    bloc: bloc,
                    builder: (context, state) {
                      if (state is GameInitialState) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is LoadedState) {
                        final clientsList = state.list;
                        return GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 200,
                                    childAspectRatio: 3 / 3,
                                    crossAxisSpacing: 20,
                                    mainAxisSpacing: 20),
                            itemCount: clientsList.length,
                            itemBuilder: (BuildContext context, index) => Card(
                                  margin: const EdgeInsets.all(10),
                                  child: ListTile(
                                    contentPadding: const EdgeInsets.all(10),
                                    title: Image.network(
                                        'http:${clientsList[index].imageUrl!}'),
                                    subtitle: Text(clientsList[index].name),
                                  ),
                                ));
                      }
                      return Container();
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
