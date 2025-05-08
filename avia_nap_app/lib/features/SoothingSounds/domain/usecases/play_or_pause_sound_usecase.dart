import '../repositories/sound_repository.dart';

class PlayOrPauseSoundUseCase {
  final SoundRepository repository;

  PlayOrPauseSoundUseCase(this.repository);

  Future<void> call(String assetPath, bool isSoundOn) async {
    if (!isSoundOn) return;
    await repository.toggleSound(assetPath);
  }
}
