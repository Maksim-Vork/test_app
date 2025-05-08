import 'package:avia_nap_app/features/BreathingPractices/presentation/widgets/breathing_card.dart';
import 'package:flutter/material.dart';

class BreathingScreen extends StatelessWidget {
  const BreathingScreen({super.key});

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
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
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
                    children: [
                      Column(
                        children: const [
                          Text(
                            'Breathing Practices',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'DMSans',
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Try one of these calming techniques to soothe your nervous system mid-flight.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'DMSans',
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),

                      const BreathingCard(
                        title: 'Box Breathing (4-4-4-4)',
                        imagePath: 'assets/icon/Cloud.png',
                        description:
                            'A classic breathing pattern: inhale for 4 seconds, hold for 4, exhale for 4, and hold again.',
                        subDescription:
                            'Follow the expanding cloud. Complete 4–6 rounds to feel calmer.',
                      ),
                      const BreathingCard(
                        title: 'Belly Breathing',
                        imagePath: 'assets/icon/Airplane.png',
                        description:
                            'A classic breathing pattern: inhale for 4 seconds, hold for 4, exhale for 4, and hold again.',
                        subDescription:
                            'Follow the expanding cloud. Complete 4–6 rounds to feel calmer.',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
