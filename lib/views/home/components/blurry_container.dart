import 'dart:ui';

import 'package:flutter/material.dart';

class BlurryContainer extends StatelessWidget {
  const BlurryContainer({super.key, required this.child, required this.blur});

  final Widget child;
  final double blur;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 0,
      color: Colors.transparent,
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
          child: Container(
            color: Colors.transparent,
            child: child,
          ),
        ),
      ),
    );
  }
}
