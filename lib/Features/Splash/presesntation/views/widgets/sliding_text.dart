import 'package:flutter/material.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({
    super.key,
    required this.slidingAnimation,
    required this.fadeAnimation,
  });

  final Animation<Offset> slidingAnimation;
  final Animation<double> fadeAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slidingAnimation,
      builder: (context,_) {
        return SlideTransition(
            position: slidingAnimation,
            child: FadeTransition(
              opacity: fadeAnimation,
              child: const Text(
                'Read Free Books',
                textAlign: TextAlign.center,
              ),
            ));
      },
    );
  }
}