import 'package:game_catalog/data/dtos/game_dto.dart';

abstract class GameState {}

class GameInitialState extends GameState {}

class LoadingState extends GameState {}

class LoadedState extends GameState {
  LoadedState({required this.list});

  final List<GameDto> list;
}

class EmptyState extends GameState {}

// class Error extends GameState {
//   const Error({
//     required this.message,
//   });
//   final String message;
// }
