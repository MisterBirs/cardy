import 'package:cardy/core/presentation/ui_constants.dart';
import 'package:flutter/material.dart';

class BaseTile extends StatelessWidget {
  final Widget? child;
  final Color? color;
  final Gradient? gradient;
  final double size;
  final bool isCard;
  final BorderRadiusGeometry borderRadius;
  final EdgeInsetsGeometry margin;
  final List<BoxShadow>? boxShadow;

  double get _width => isCard ? size * SQUARE_CARD_RATIO : size;

  const BaseTile({
    super.key,
    this.child,
    this.size = BASE_ITEM_TILE_SIZE,
    this.color = CONTAINER_COLOR,
    this.isCard = false,
    this.borderRadius = const BorderRadius.all(Radius.circular(5)),
    this.margin = const EdgeInsets.all(0),
    this.boxShadow = SHADOW,
  }) : gradient = null;

  const BaseTile.gradient({
    super.key,
    this.child,
    this.size = BASE_ITEM_TILE_SIZE,
    required this.gradient,
    this.isCard = false,
    this.borderRadius = const BorderRadius.all(Radius.circular(5)),
    this.margin = const EdgeInsets.all(0),
    this.boxShadow = SHADOW,
  }) : color = null;

  @override
  Widget build(BuildContext context) {
    // The Center is for prevent from the ItemTile to take the full height when is in a ListView
    return Center(
      child: Container(
        height: size,
        width: _width,
        margin: margin,
        decoration: boxDecoration,
        child:
            ClipRRect(borderRadius: borderRadius, child: Center(child: child)),
      ),
    );
  }

  BoxDecoration get boxDecoration {
    var customBoxDecoration = BoxDecoration(
      borderRadius: borderRadius,
      boxShadow: boxShadow,
    );

    if (color != null) {
      customBoxDecoration = customBoxDecoration.copyWith(color: color);
    } else {
      customBoxDecoration = customBoxDecoration.copyWith(gradient: gradient);
    }
    return customBoxDecoration;
  }
}
