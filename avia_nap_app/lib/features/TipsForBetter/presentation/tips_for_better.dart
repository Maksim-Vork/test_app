import 'package:avia_nap_app/features/TipsForBetter/presentation/widget/tip_card.dart';
import 'package:flutter/material.dart';

class TipsForBetter extends StatelessWidget {
  const TipsForBetter({super.key});

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
                            'Tips for Better In-Flight Sleep',
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
                            'Practical tips to help you sleep peacefully at 30,000 feet',
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

                      TipCard(
                        title: 'Avoid caffeine before boarding',
                        description:
                            'It might stay in your system longer than you think.',
                        imagePath: 'assets/icon/Favorite.png',
                        onPressed: () {},
                      ),
                      SizedBox(height: 8),
                      TipCard(
                        title: 'Use a neck pillow',
                        description:
                            'Support your neck and reduce strain while sitting.',
                        imagePath: 'assets/icon/Favorite.png',
                        onPressed: () {},
                      ),
                      SizedBox(height: 8),
                      TipCard(
                        title: 'Wear an eye mask',
                        description:
                            'Cabin lights can interrupt your sleep cycle.',
                        imagePath: 'assets/icon/Favorite.png',
                        onPressed: () {},
                      ),
                      SizedBox(height: 8),
                      TipCard(
                        title: 'Wear headphones or earplugs',
                        description: 'Block out chatter and announcements.',
                        imagePath: 'assets/icon/Favorite.png',
                        onPressed: () {},
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
