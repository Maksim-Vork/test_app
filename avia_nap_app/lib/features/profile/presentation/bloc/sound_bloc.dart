import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecase/toggle_sound_usecase.dart';

part 'sound_event.dart';
part 'sound_state.dart';

class SoundBloc extends Bloc<SoundEvent, SoundState> {
  final ToggleSoundUseCase toggleSoundUseCase;

  SoundBloc(this.toggleSoundUseCase) : super(SoundInitial()) {
    on<LoadSoundSettingEvent>((event, emit) async {
      final setting = await toggleSoundUseCase.getSound();
      emit(SoundLoaded(setting.isSoundOn));
    });

    on<ToggleSoundEvent>((event, emit) async {
      await toggleSoundUseCase.setSound(event.isSoundOn);
      emit(SoundLoaded(event.isSoundOn));
    });
  }
}
