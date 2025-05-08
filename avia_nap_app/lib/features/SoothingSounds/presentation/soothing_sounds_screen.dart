import 'package:flutter/material.dart';
import 'package:avia_nap_app/features/SoothingSounds/presentation/widgets/sound_card.dart';

class SoothingSoundsScreen extends StatelessWidget {
  const SoothingSoundsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF716DFF), Color(0xFFFFA7E0)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: CustomScrollView(
          slivers: [
            const SliverAppBar(
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.white,
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 24,
                ),
                child: Column(
                  children: const [
                    Text(
                      'Soothing Sounds',
                      style: TextStyle(
                        fontFamily: 'DMSans',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Play gentle ambient sounds to escape into your own sky.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'DMSans',
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 24),
                    SoundCard(
                      title: 'Cabin White Noise',
                      description: 'The soft hum of flight.',
                      assetPath: 'splash/music/music_one.mp3',
                    ),
                    SizedBox(height: 8),
                    SoundCard(
                      title: 'Rain on Window',
                      description: 'Raindrops trickling down the glass.',
                      assetPath: 'splash/music/music_two.mp3',
                    ),
                    SizedBox(height: 8),
                    SoundCard(
                      title: 'Distant Engines',
                      description: 'Dull roar from far behind.',
                      assetPath: 'splash/music/music_tree.mp3',
                    ),
                    SizedBox(height: 8),
                    SoundCard(
                      title: 'Windy Night Sky',
                      description: 'Night wind across the wings.',
                      assetPath: 'splash/music/music_four.mp3',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
