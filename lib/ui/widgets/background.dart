import 'package:cardy/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget? child;
  const Background({
    super.key,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.images.screenBackground.path),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}