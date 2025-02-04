import 'package:cardy/entities/payments_methods/base_payment_method_type_entity.dart';
import 'package:cardy/entities/user_items/payment_method_entity.dart';
import 'package:cardy/ui/ui_constants.dart';
import 'package:flutter/material.dart';

class ItemTile extends StatelessWidget {
  final PaymentMethodEntity? item;
  final BasePaymentMethodTypeEntity itemType;
  final double size;
  final BorderRadiusGeometry borderRadius;
  final EdgeInsetsGeometry margin;
  final List<BoxShadow>? boxShadow;

  double get _width => itemType.isCard ? size * SQUARE_CARD_RATIO : size;

  ItemTile(
    this.item, {
    super.key,
    this.size = 100,
    this.borderRadius = const BorderRadius.all(Radius.circular(5)),
    this.margin = const EdgeInsets.all(0),
    this.boxShadow = SHADOW,
  }) : itemType = item!.type;

  const ItemTile.type(
    this.itemType, {
    super.key,
    this.size = 100,
    this.borderRadius = const BorderRadius.all(Radius.circular(6)),
    this.margin = const EdgeInsets.all(0),
    this.boxShadow = SHADOW,
  }) : item = null;

  @override
  Widget build(BuildContext context) {
    // The Center is for prevent from the ItemTile to take the full height when is in a ListView
    return Center(
      child: Container(
        height: size,
        width: _width,
        margin: margin,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          boxShadow: boxShadow,
        ),
        child: ClipRRect(
            borderRadius: borderRadius,
            child: Image.asset(itemType.imagePath, fit: BoxFit.cover)),
      ),
    );
  }
}
