import 'package:avia_nap_app/features/SoothingSounds/presentation/bloc/soothing_sound_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/play_or_pause_sound_usecase.dart';

part 'soothing_sound_event.dart';

class SoothingSoundBloc extends Bloc<SoothingSoundEvent, SoothingSoundState> {
  final PlayOrPauseSoundUseCase useCase;

  SoothingSoundBloc(this.useCase) : super(SoothingSoundInitial()) {
    on<PlayOrPauseSound>((event, emit) async {
      await useCase(event.assetPath, event.isSoundOn);

      final isPlaying = useCase.repository.isPlaying;

      emit(
        isPlaying
            ? SoothingSoundPlaying(event.assetPath)
            : SoothingSoundStopped(),
      );
    });
  }
}
