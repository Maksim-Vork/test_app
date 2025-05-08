import 'package:avia_nap_app/features/BreathingPractices/presentation/breathing_screen.dart';
import 'package:avia_nap_app/features/GuidedRelaxtion/presentation/guided_relaxtion_screen.dart';
import 'package:avia_nap_app/features/SoothingSounds/presentation/soothing_sounds_screen.dart';
import 'package:avia_nap_app/features/TipsForBetter/presentation/tips_for_better.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: screenHeight,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF716DFF), Color(0xFFFFA7E0)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  const Center(
                    child: Text(
                      'Your in-flight calm companion',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'DMSans',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  _buildCard(
                    context,
                    title: 'Breathing Practices',
                    subtitle: 'Gentle breathing exercises to help you relax',
                    iconPath: 'assets/icon/BreathingIcon.png',
                    onTap:
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => BreathingScreen()),
                        ),
                  ),
                  const SizedBox(height: 8),
                  _buildCard(
                    context,
                    title: 'Soothing Sounds',
                    subtitle:
                        'Ambient sounds to create your personal sky bubble',
                    iconPath: 'assets/icon/ValueIcon.png',
                    onTap:
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => SoothingSoundsScreen(),
                          ),
                        ),
                  ),
                  const SizedBox(height: 8),
                  _buildCard(
                    context,
                    title: 'Guided Relaxation',
                    subtitle: 'Short meditative journeys for body and mind',
                    iconPath: 'assets/icon/CloudIcon.png',
                    onTap:
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => GuidedRelaxtionScreen(),
                          ),
                        ),
                  ),
                  const SizedBox(height: 8),
                  _buildCard(
                    context,
                    title: 'Tips for Better In-Flight Sleep',
                    subtitle: 'Текст текст текст текст текст текст текст ',
                    iconPath: 'assets/icon/MoonIcon.png',
                    onTap:
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => TipsForBetter()),
                        ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required String iconPath,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(28),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: const Color(0xFFE5E7EB),
                    ),
                    child: Image.asset(iconPath),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontFamily: 'DMSans',
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF25228D),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 16,
                  fontFamily: 'DMSans',
                  color: Color(0xB225228D),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
