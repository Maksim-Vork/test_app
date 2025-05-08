import 'package:shared_preferences/shared_preferences.dart';

abstract class SoundLocalDataSource {
  Future<bool> getSoundSetting();
  Future<void> setSoundSetting(bool isOn);
}

class SoundLocalDataSourceImpl implements SoundLocalDataSource {
  static const String key = 'sound_setting';

  @override
  Future<bool> getSoundSetting() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key) ?? true;
  }

  @override
  Future<void> setSoundSetting(bool isOn) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, isOn);
  }
}
