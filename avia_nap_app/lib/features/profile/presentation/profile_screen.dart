import 'package:avia_nap_app/features/profile/presentation/bloc/sound_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF716DFF), Color(0xFFFFA7E0)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 100),
              const Center(
                child: Text(
                  'Your Preferences',
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
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(28),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 30,
                    horizontal: 36,
                  ),
                  child: Column(
                    children: [
                      BlocBuilder<SoundBloc, SoundState>(
                        builder: (context, state) {
                          bool isOn = false;
                          if (state is SoundLoaded) {
                            isOn = state.isSoundOn;
                          }

                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Sound Effects',
                                style: TextStyle(
                                  color: Color(0xFF25228D),
                                  fontSize: 18,
                                  fontFamily: 'DMSans',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  context.read<SoundBloc>().add(
                                    ToggleSoundEvent(!isOn),
                                  );
                                },
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 150),
                                  width: 60,
                                  height: 30,
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    gradient:
                                        isOn
                                            ? const LinearGradient(
                                              colors: [
                                                Color(0xFF8A4FFF),
                                                Color(0xFF4B00C7),
                                              ],
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                            )
                                            : LinearGradient(
                                              colors: [
                                                Colors.grey.shade300,
                                                Colors.grey.shade100,
                                              ],
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                            ),
                                    boxShadow: [
                                      if (isOn)
                                        BoxShadow(
                                          color: Colors.deepPurple.withOpacity(
                                            0.4,
                                          ),
                                          offset: const Offset(0, 4),
                                          blurRadius: 8,
                                        ),
                                    ],
                                  ),
                                  child: AnimatedAlign(
                                    duration: const Duration(milliseconds: 150),
                                    curve: Curves.easeInOut,
                                    alignment:
                                        isOn
                                            ? Alignment.centerRight
                                            : Alignment.centerLeft,
                                    child: Container(
                                      width: 18,
                                      height: 18,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(
                                              0.15,
                                            ),
                                            blurRadius: 4,
                                            offset: const Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                      const SizedBox(height: 24),

                      const _ResetFavoritesToggle(),
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

class _ResetFavoritesToggle extends StatefulWidget {
  const _ResetFavoritesToggle();

  @override
  State<_ResetFavoritesToggle> createState() => _ResetFavoritesToggleState();
}

class _ResetFavoritesToggleState extends State<_ResetFavoritesToggle> {
  bool isFavorite = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Reset Favorites',
          style: TextStyle(
            color: Color(0xFF25228D),
            fontSize: 18,
            fontFamily: 'DMSans',
            fontWeight: FontWeight.bold,
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              isFavorite = !isFavorite;
            });
          },
          child: Image.asset(
            isFavorite
                ? 'assets/icon/FavoritesIcon.png'
                : 'assets/icon/UnfavoritesIcon.png',
          ),
        ),
      ],
    );
  }
}
