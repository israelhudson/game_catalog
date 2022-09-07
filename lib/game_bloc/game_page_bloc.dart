import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_catalog/data/repositories/get_games_repository_imp.dart';
import 'package:game_catalog/game_bloc/game_event.dart';
import 'package:game_catalog/game_bloc/game_state.dart';

class GamePageBloc extends Bloc<GameEvent, GameState> {
  final GetGamesRepositoryImp _getGamesRepositoryImp;
  String currentGame = '-';

  GamePageBloc(this._getGamesRepositoryImp) : super(GameInitialState()) {
    on<ListGamesEvent>((event, emit) async {
      emit(LoadingState());

      final listGamesbyPlatform = await _getGamesRepositoryImp
          .getGamesByPlatform(idPlatform: event.idPlatform);
      emit(
        LoadedState(
          list: listGamesbyPlatform,
        ),
      );
      currentGame = event.idPlatform.toString();
    });
  }
}
