import 'package:avia_nap_app/features/profile/data/datasource/sound_local_datasource.dart';
import 'package:avia_nap_app/features/profile/data/repository/sound_settings_repository_impl.dart';
import 'package:avia_nap_app/features/profile/domain/usecase/toggle_sound_usecase.dart';
import 'package:avia_nap_app/features/profile/presentation/bloc/sound_bloc.dart';
import 'package:avia_nap_app/features/SoothingSounds/data/repositories/sound_repository_impl.dart';

import 'package:avia_nap_app/features/SoothingSounds/domain/usecases/play_or_pause_sound_usecase.dart';
import 'package:avia_nap_app/features/SoothingSounds/presentation/bloc/soothing_sound_bloc.dart';
import 'package:avia_nap_app/features/splash/presentation/splash_screen.dart';
import 'package:device_preview_plus/device_preview_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:avia_nap_app/features/SoothingSounds/data/datasources/sound_player.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Инициализация SoundBloc
  final soundLocalDataSource = SoundLocalDataSourceImpl();
  final soundRepository = SoundSettingsRepositoryImpl(soundLocalDataSource);
  final toggleSoundUseCase = ToggleSoundUseCase(soundRepository);

  final soundPlayer = SoundPlayer();
  final soothingSoundRepository = SoundRepositoryImpl(soundPlayer);
  final playOrPauseSoundUseCase = PlayOrPauseSoundUseCase(
    soothingSoundRepository,
  );
  final soothingSoundBloc = SoothingSoundBloc(playOrPauseSoundUseCase);

  runApp(
    DevicePreview(
      enabled: true,
      builder:
          (context) => ResponsiveSizer(
            builder: (context, orientation, screenType) {
              return MultiBlocProvider(
                providers: [
                  BlocProvider<SoundBloc>(
                    create:
                        (_) =>
                            SoundBloc(toggleSoundUseCase)
                              ..add(LoadSoundSettingEvent()),
                  ),

                  BlocProvider<SoothingSoundBloc>(
                    create: (_) => soothingSoundBloc,
                  ),
                ],
                child: const MyApp(),
              );
            },
          ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
