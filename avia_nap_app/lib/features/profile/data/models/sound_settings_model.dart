import 'package:avia_nap_app/features/profile/domain/entity/sound_settings.dart';

class SoundSettingsModel extends SoundSettings {
  SoundSettingsModel({required super.isSoundOn});

  factory SoundSettingsModel.fromJson(Map<String, dynamic> json) {
    return SoundSettingsModel(isSoundOn: json['isSoundOn']);
  }

  Map<String, dynamic> toJson() => {'isSoundOn': isSoundOn};
}
