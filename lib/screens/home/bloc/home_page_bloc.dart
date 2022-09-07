import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_catalog/data/repositories/get_games_repository_imp.dart';
import 'package:game_catalog/screens/home/bloc/home_page_event.dart';
import 'package:game_catalog/screens/home/bloc/home_page_state.dart';

class GamePageBloc extends Bloc<GameEvent, HomePageState> {
  final GetGamesRepositoryImp _getGamesRepositoryImp;
  String currentGame = '-';

  GamePageBloc(this._getGamesRepositoryImp) : super(HomePageInitialState()) {
    on<HomePageEvent>((event, emit) async {
      emit(HomePageLoadingState());

      try {
        final listGamesbyPlatform = await _getGamesRepositoryImp
            .getGamesByPlatform(idPlatform: event.idPlatform);
        emit(
          HomePageLoadedState(
            list: listGamesbyPlatform,
          ),
        );
        currentGame = event.idPlatform.toString();
      } on Exception catch (e) {
        emit(HomePageError(message: e.toString()));
      }
    });
  }
}
