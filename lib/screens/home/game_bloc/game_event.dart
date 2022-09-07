abstract class GameEvent {}

class ListGamesEvent extends GameEvent {
  ListGamesEvent({
    required this.idPlatform,
  });

  final int idPlatform;
}
