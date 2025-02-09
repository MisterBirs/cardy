import 'dart:core';

import 'package:cardy/ui/ui_constants.dart';
import 'package:flutter/material.dart';

class ShowAllList extends StatelessWidget {
  final String label;
  final double spacing;
  final double height;
  final List<Widget> items;
  final void Function() onTapShowAll;

  const ShowAllList({
    super.key,
    required this.label,
    required this.items,
    required this.onTapShowAll,
    this.spacing = 20,
    this.height = BASE_ITEM_TILE_SIZE + 10,
  });

  void addSpacingToHeadAndTile() {
    final spacingBox = SizedBox(width: spacing);
    items.insert(0, spacingBox);
    items.add(spacingBox);
  }

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
        padding:
            const EdgeInsets.symmetric(horizontal: SCREEN_HORIZONTAL_PADDING),
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
    return SizedBox(
      height: height, // Adjust height as needed
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          final isLast = index == items.length - 1;

          return Padding(
            padding: isLast
                ? EdgeInsets.symmetric(horizontal: spacing) // Add spacing to the left of the last item
                : EdgeInsets.only(right: spacing),
            child: items[index],
          );
        },
      ),
    );
  }
}
