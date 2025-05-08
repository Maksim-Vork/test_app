import 'package:avia_nap_app/features/SoothingSounds/presentation/bloc/soothing_sound_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../profile/presentation/bloc/sound_bloc.dart';
import '../bloc/soothing_sound_bloc.dart';

class SoundCard extends StatelessWidget {
  final String title;
  final String description;
  final String assetPath;

  const SoundCard({
    super.key,
    required this.title,
    required this.description,
    required this.assetPath,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SoundBloc, SoundState>(
      builder: (context, soundState) {
        final isSoundOn =
            soundState is SoundLoaded ? soundState.isSoundOn : false;

        return BlocBuilder<SoothingSoundBloc, SoothingSoundState>(
          builder: (context, soothingState) {
            final isPlaying =
                soothingState is SoothingSoundPlaying &&
                soothingState.assetPath == assetPath;

            return GestureDetector(
              onTap: () {
                context.read<SoothingSoundBloc>().add(
                  PlayOrPauseSound(assetPath: assetPath, isSoundOn: isSoundOn),
                );
              },
              child: Container(
                height: 104,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(28),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 36,
                    vertical: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 160,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: const TextStyle(
                                color: Color(0xFF25228D),
                                fontSize: 16,
                                fontFamily: 'DMSans',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              description,
                              style: const TextStyle(
                                color: Color(0xB325228D),
                                fontSize: 14,
                                fontFamily: 'DMSans',
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4),
                            child: Image.asset('assets/icon/Favorite.png'),
                          ),
                          const SizedBox(width: 15),
                          Padding(
                            padding: const EdgeInsets.all(4),
                            child: Image.asset(
                              isPlaying
                                  ? 'assets/icon/Paused.png'
                                  : 'assets/icon/Play.png',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
