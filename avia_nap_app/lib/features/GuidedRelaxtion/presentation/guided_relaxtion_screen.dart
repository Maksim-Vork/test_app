import 'package:avia_nap_app/features/GuidedRelaxtion/presentation/widgets/guid_relaxtion_cart.dart';
import 'package:flutter/material.dart';

class GuidedRelaxtionScreen extends StatelessWidget {
  const GuidedRelaxtionScreen({super.key});

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
                    children: const [
                      Text(
                        'Guided Relaxation',
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
                        'Audio-guided sessions for calmness and sleep, made for flights.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'DMSans',
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  child: Column(
                    children: const [
                      GuidedRelaxationCard(
                        title: 'Relax Your Body in Flight',
                        description:
                            'A body scan meditation to release tension from head to toe.',
                        duration: '~4 min',
                      ),
                      SizedBox(height: 16),
                      GuidedRelaxationCard(
                        title: '5 Minutes to Sleep',
                        description:
                            'Breathe deeply and follow visualization to fall asleep faster.',
                        duration: '5 min',
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
