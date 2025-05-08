part of 'sound_bloc.dart';

abstract class SoundEvent {}

class LoadSoundSettingEvent extends SoundEvent {}

class ToggleSoundEvent extends SoundEvent {
  final bool isSoundOn;

  ToggleSoundEvent(this.isSoundOn);
}
