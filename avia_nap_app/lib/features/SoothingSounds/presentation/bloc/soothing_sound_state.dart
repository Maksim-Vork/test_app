// part of 'soothing_sound_bloc.dart';

abstract class SoothingSoundState {}

class SoothingSoundInitial extends SoothingSoundState {}

class SoothingSoundPlaying extends SoothingSoundState {
  final String assetPath;

  SoothingSoundPlaying(this.assetPath);
}

class SoothingSoundStopped extends SoothingSoundState {}
