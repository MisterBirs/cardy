import 'package:cardy/ui/ui_constants.dart';
import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final Function()? onPressed;
  final String label;
  final bool isColorReversed;
  final double height;
  final double width;
  final BorderRadius borderRadius;


  GradientButton({
    super.key,
    this.onPressed,
    required this.label,
    this.isColorReversed = false,
    this.height = 50,
    this.width = double.infinity,
    BorderRadius? borderRadius,
  }) : borderRadius = borderRadius ?? BorderRadius.circular(10);

  @override
  Widget build(BuildContext context) {
    //The material is necessary to prevent widgets overlapping
    // the InkWell during scrolling from coloring it.
    return Material(
      child: InkWell(
        borderRadius: borderRadius,
        onTap: onPressed,
        child: Ink(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            gradient: isColorReversed ? GRADIENT_COLOR_REVERSE : GRADIENT_COLOR,
          ),
          child: Center(
            child: Text(label, style: Theme.of(context).textTheme.labelMedium),
          ),
        ),
      ),
    );
  }
}
