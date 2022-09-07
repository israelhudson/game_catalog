import 'package:game_catalog/data/dtos/game_dto.dart';

abstract class HomePageState {}

class HomePageInitialState extends HomePageState {}

class HomePageLoadingState extends HomePageState {}

class HomePageLoadedState extends HomePageState {
  HomePageLoadedState({required this.list});

  final List<GameDto> list;
}

class EmptyState extends HomePageState {}

class Error extends HomePageState {
  Error({
    required this.message,
  });
  final String message;
}
