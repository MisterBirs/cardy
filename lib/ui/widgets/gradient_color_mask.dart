import 'package:cardy/ui/ui_constants.dart';
import 'package:flutter/material.dart';

class GradientColorMask extends StatelessWidget {
  final Widget? child;
  const GradientColorMask({
    super.key,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        colors: [PRIMARY_COLOR, SECONDRY_COLOR],
        tileMode: TileMode.mirror,
      ).createShader(bounds),
      blendMode: BlendMode.srcIn,
      child: child,
    );
  }
}
