import 'dart:core';

import 'package:cardy/entities/user_items/payment_method_entity.dart';
import 'package:cardy/ui/screens/home_screen/home_screen_widgets/item_side_label_tile.dart';
import 'package:cardy/ui/widgets/show_all_list.dart';
import 'package:flutter/material.dart';

class ItemsList extends StatelessWidget {
  final String label;
  final List<PaymentMethodEntity> items;
  final Function() onTapShowAll;

  const ItemsList({
    super.key,
    required this.label,
    required this.items,
    required this.onTapShowAll,
  });

  @override
  Widget build(BuildContext context) {
    return ShowAllList(
        label: label,
        height: 100,
        items: items.map((item) => ItemSideLabelTile(item: item)).toList(),
        onTapShowAll: onTapShowAll);
  }
}
