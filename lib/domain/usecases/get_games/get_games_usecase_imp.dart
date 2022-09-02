import '../../entities/game_entity.dart';
import '../../repositories/get_games_repository.dart';
import 'get_games_usecase.dart';

class GetGamesUseCaseImp implements GetGamesUseCase {
  final GetGamesRepository _getGamesRepository;

  GetGamesUseCaseImp(this._getGamesRepository);

  @override
  Future<List<GameEntity>> call({
    required int idPlatform,
  }) async {
    final repository = await _getGamesRepository(
      idPlatform: idPlatform,
    );
    if (repository.isEmpty) {
      return [];
    }
    return repository;
  }
}
