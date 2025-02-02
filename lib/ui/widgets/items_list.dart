import 'dart:core';

import 'package:cardy/data/payments_methods_data.dart';
import 'package:cardy/entities/payments_methods/store_entity.dart';
import 'package:cardy/entities/user_items/payment_method_entity.dart';
import 'package:cardy/ui/screens/home_screen.dart';
import 'package:cardy/ui_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        itemsListLabels,
        itemsList,
      ],
    );
  }

  Widget get itemsList {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          spacing: 20,
          children: [
            ...items.map((item) {
              return ItemTile(item: item);
            }),
          ],
        ),
      ),
    );
  }

  Widget get itemsListLabels {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Text(label,
              style: primaryFont(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  color: TEXT_COLOR_1)),
          Spacer(),
          TextButton(
            onPressed: onTapShowAll,
            child: Text('הצג הכל',
                style: primaryFont(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: TEXT_COLOR_2)),
          )
        ],
      ),
    );
  }
}

class ItemTile extends StatelessWidget {
  final imageSize = 70.0;
  final cardImageWidth = 112.0;
  final labelBaseWidth = 85.0;
  final imageRadius = 6.0;
  final labelRasius = 10.0;

  final PaymentMethodEntity item;
  const ItemTile({
    super.key,
    required this.item,
  });

  bool get isStore =>
      PaymentsMethodsData.allPaymentMethods[item.typeId] is StoreEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: labelBaseWidth + (isStore ? imageSize : cardImageWidth),
      padding: const EdgeInsets.only(bottom: 20, top: 10), //To avoid hiding the shadow
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),

      child: Stack(
        children: [
          Positioned(child: amountLabel, bottom: 0, right: 0),
          Positioned(child: itemImage)
        ],
      ),
    );
  }

  Widget get amountLabel {
    return Container(
      alignment: Alignment.centerLeft,
      width: labelBaseWidth + (isStore ? imageSize : cardImageWidth),
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 9,
            offset: const Offset(0, 2),
          ),
        ],
        color: const Color.fromARGB(224, 255, 255, 255),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(labelRasius),
          bottomLeft: Radius.circular(labelRasius),
          bottomRight: Radius.circular(imageRadius),
        ),
      ),
      child: Container(
        width: labelBaseWidth,
        alignment: Alignment.center,
        child: Text('₪${item.remainingAmount.toInt().toString()}',
            style: primaryFont(
                fontSize: 22,
                fontWeight: FontWeight.w400,
                color: TEXT_COLOR_1)),
      ),
    );
  }

  Widget get itemImage {
    final imagePath =
        PaymentsMethodsData.allPaymentMethods[item.typeId]!.imagePath;

    return Container(
      width: isStore ? imageSize : cardImageWidth,
      height: imageSize,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 5,
            offset: const Offset(0, -1),
          ),
        ],
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(imageRadius),
          bottomRight: Radius.circular(imageRadius),
          topLeft: Radius.circular(imageRadius),
        ),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
