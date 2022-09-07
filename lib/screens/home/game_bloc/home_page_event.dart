abstract class GameEvent {}

class HomePageEvent extends GameEvent {
  HomePageEvent({
    required this.idPlatform,
  });

  final int idPlatform;
}
