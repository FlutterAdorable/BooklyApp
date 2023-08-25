import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerFeaturedList extends StatelessWidget {
  const ShimmerFeaturedList({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      gradient: const LinearGradient(
        colors: [
          Colors.white38,
          Colors.white10,
          Colors.white24,
        ],
      ),
      period: const Duration(milliseconds: 800),
      child: AspectRatio(
        aspectRatio: 2.6 / 4,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
