import '../../domain/repositories/sound_repository.dart';
import 'package:avia_nap_app/features/SoothingSounds/data/datasources/sound_player.dart';

class SoundRepositoryImpl implements SoundRepository {
  final SoundPlayer player;

  SoundRepositoryImpl(this.player);

  @override
  Future<void> toggleSound(String assetPath) {
    return player.togglePlay(assetPath);
  }

  @override
  Future<void> stop() async {
    player.stop();
  }

  @override
  bool get isPlaying => player.isPlaying;
}
