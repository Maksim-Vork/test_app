import 'package:avia_nap_app/features/profile/domain/entity/sound_settings.dart';
import 'package:avia_nap_app/features/profile/domain/repository/sound_settings_repository.dart';

class ToggleSoundUseCase {
  final SoundSettingsRepository repository;

  ToggleSoundUseCase(this.repository);

  Future<SoundSettings> getSound() => repository.getSoundSettings();
  Future<void> setSound(bool isOn) => repository.toggleSound(isOn);
}
