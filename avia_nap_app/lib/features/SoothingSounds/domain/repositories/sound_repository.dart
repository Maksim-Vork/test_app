abstract class SoundRepository {
  Future<void> toggleSound(String assetPath);
  Future<void> stop();
  bool get isPlaying;
}
