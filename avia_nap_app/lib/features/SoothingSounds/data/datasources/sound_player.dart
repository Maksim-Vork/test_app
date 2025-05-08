import 'package:audioplayers/audioplayers.dart';

class SoundPlayer {
  final AudioPlayer _player = AudioPlayer();
  bool _isPlaying = false;
  String? _currentPath;

  Future<void> togglePlay(String assetPath) async {
    if (_isPlaying && _currentPath == assetPath) {
      await _player.pause();
      _isPlaying = false;
    } else {
      await _player.stop();
      await _player.play(AssetSource(assetPath));
      _isPlaying = true;
      _currentPath = assetPath;
    }
  }

  void stop() {
    _player.stop();
    _isPlaying = false;
    _currentPath = null;
  }

  bool get isPlaying => _isPlaying;
}
