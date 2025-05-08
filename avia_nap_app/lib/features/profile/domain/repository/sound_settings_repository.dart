import 'package:avia_nap_app/features/profile/domain/entity/sound_settings.dart';

abstract class SoundSettingsRepository {
  Future<SoundSettings> getSoundSettings();
  Future<void> toggleSound(bool isOn);
}
