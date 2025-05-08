import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/play_or_pause_sound_usecase.dart';

part 'soothing_sound_event.dart';
part 'soothing_sound_state.dart';

class SoothingSoundBloc extends Bloc<SoothingSoundEvent, SoothingSoundState> {
  final PlayOrPauseSoundUseCase useCase;

  SoothingSoundBloc(this.useCase) : super(SoothingSoundInitial()) {
    on<PlayOrPauseSound>((event, emit) async {
      await useCase(event.assetPath, event.isSoundOn);
      emit(
        useCase.repository.isPlaying
            ? SoothingSoundPlaying()
            : SoothingSoundStopped(),
      );
    });
  }
}
