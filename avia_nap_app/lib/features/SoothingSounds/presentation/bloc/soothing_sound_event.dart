part of 'soothing_sound_bloc.dart';

abstract class SoothingSoundEvent {}

class PlayOrPauseSound extends SoothingSoundEvent {
  final String assetPath;
  final bool isSoundOn;

  PlayOrPauseSound({required this.assetPath, required this.isSoundOn});
}
