import 'package:flutter/material.dart';

class BreathingCard extends StatefulWidget {
  final String title;
  final String imagePath;
  final String description;
  final String subDescription;

  const BreathingCard({
    super.key,
    required this.title,
    required this.imagePath,
    required this.description,
    required this.subDescription,
  });

  @override
  State<BreathingCard> createState() => _BreathingCardState();
}

class _BreathingCardState extends State<BreathingCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _scale = CurvedAnimation(parent: _controller, curve: Curves.easeOutBack);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
        child: Column(
          children: [
            Text(
              widget.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'DMSans',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF25228D),
              ),
            ),
            const SizedBox(height: 30),
            ScaleTransition(
              scale: _scale,
              child: Image.asset(widget.imagePath, width: 225),
            ),
            const SizedBox(height: 30),
            Text(
              widget.description,
              textAlign: TextAlign.start,
              style: const TextStyle(
                fontFamily: 'DMSans',
                fontSize: 18,
                fontWeight: FontWeight.w300,
                color: Color(0xFF25228D),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              widget.subDescription,
              textAlign: TextAlign.start,
              style: const TextStyle(
                fontFamily: 'DMSans',
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: Color(0xB325228D),
              ),
            ),
            const SizedBox(height: 24),
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF25228D), Color(0xFFA172CE)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                onPressed: () {},
                child: const Text(
                  'Start Practice',
                  style: TextStyle(
                    fontFamily: 'DMSans',
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
