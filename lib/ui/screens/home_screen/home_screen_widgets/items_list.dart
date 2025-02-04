import 'dart:core';

import 'package:cardy/entities/user_items/payment_method_entity.dart';
import 'package:cardy/ui/ui_constants.dart';
import 'package:cardy/ui/screens/home_screen/home_screen_widgets/item_side_label_tile.dart';
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
    return Column(
      children: [
        listLabels,
        itemsList,
      ],
    );
  }

  Widget get listLabels {
    return Builder(builder: (context) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: SCREEN_HORIZONTAL_PADDING),
        child: Row(
          children: [
            Text(
              label,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Spacer(),
            TextButton(
              onPressed: onTapShowAll,
              child: Text(
                'הצג הכל',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            )
          ],
        ),
      );
    });
  }

  Widget get itemsList {
    return Padding(
      padding: const EdgeInsets.only(right: SCREEN_HORIZONTAL_PADDING),
      child: SizedBox(
        height: 100, // Adjust height as needed
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 20), // Space between items
              child: ItemSideLabelTile(item: items[index]),
            );
          },
        ),
      ),
    );
  }
}
