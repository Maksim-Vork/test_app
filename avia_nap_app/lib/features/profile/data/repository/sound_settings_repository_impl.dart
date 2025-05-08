import 'package:avia_nap_app/features/profile/data/datasource/sound_local_datasource.dart';
import 'package:avia_nap_app/features/profile/domain/entity/sound_settings.dart';
import 'package:avia_nap_app/features/profile/domain/repository/sound_settings_repository.dart';

class SoundSettingsRepositoryImpl implements SoundSettingsRepository {
  final SoundLocalDataSource localDataSource;

  SoundSettingsRepositoryImpl(this.localDataSource);

  @override
  Future<SoundSettings> getSoundSettings() async {
    final isOn = await localDataSource.getSoundSetting();
    return SoundSettings(isSoundOn: isOn);
  }

  @override
  Future<void> toggleSound(bool isOn) async {
    await localDataSource.setSoundSetting(isOn);
  }
}
