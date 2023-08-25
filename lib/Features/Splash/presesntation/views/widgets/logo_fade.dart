import 'package:booklyapp/Core/utils/assets.dart';
import 'package:flutter/material.dart';

class LogoFade extends StatelessWidget {
  const LogoFade({
    super.key,
    required this.fadeAnimation,
  });

  final Animation<double> fadeAnimation;

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: fadeAnimation,
      child: Image.asset(AssetsData.logo),
    );
  }
}