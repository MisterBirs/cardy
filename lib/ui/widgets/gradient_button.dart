import 'package:cardy/ui/ui_constants.dart';
import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final Function()? onPressed;
  final String label;
  final bool isColorReversed;
  final double height;
  final double width;
  final double borderRadius;

  const GradientButton({
    super.key,
    this.onPressed,
    required this.label,
    this.isColorReversed = false,
    this.height = 50,
    this.width = double.infinity,
    this.borderRadius = 10,
  });

  @override
  Widget build(BuildContext context) {
    
    //The material is necessary to prevent widgets overlapping
    // the InkWell during scrolling from coloring it.
    return Material( 
      child: InkWell(
        borderRadius: BorderRadius.circular(borderRadius),
        onTap: onPressed,
        child: Ink(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
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
