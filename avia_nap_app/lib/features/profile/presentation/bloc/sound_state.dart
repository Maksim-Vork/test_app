part of 'sound_bloc.dart';

abstract class SoundState {}

class SoundInitial extends SoundState {}

class SoundLoaded extends SoundState {
  final bool isSoundOn;

  SoundLoaded(this.isSoundOn);
}
