import 'package:cardy/entities/payment_methods/payment_item_entity.dart';
import 'package:cardy/entities/payment_methods/enums.dart';
import 'package:cardy/ui/screens/item_details_screen/item_details_screen.dart';
import 'package:cardy/ui/ui_constants.dart';
import 'package:cardy/ui/widgets/item_tiles/item_tile.dart';
import 'package:flutter/material.dart';

class ItemSideBalanceLabelTile extends StatelessWidget {
  final squareSize = 70.0;
  final unhiddenPartLabelWidth = 85.0;
  final imageRadius = 5.0;
  final labelRasius = 10.0;
  final PaymentItemEntity item;

  double get tileWidth =>
      unhiddenPartLabelWidth +
      (item.paymentMethod.isCard ? squareSize * SQUARE_CARD_RATIO : squareSize);

  const ItemSideBalanceLabelTile({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => navigateToItemScreen(context),
      child: wapperTileContainer,
    );
  }

  void navigateToItemScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ItemDetailsScreen(item: item),
      ),
    );
  }

  Widget get wapperTileContainer {
    return Container(
      // Adjusting the width to a square or card
      width: tileWidth,
      padding: const EdgeInsets.only(
          bottom: 20, top: 10), //To avoid hiding the shadow
      color: Colors.transparent,
      child: Stack(
        children: [
          Positioned(bottom: 0, right: 0, child: entireAmountlabel),
          Positioned(bottom: 0, child: itemImage)
        ],
      ),
    );
  }

  /// The entire amount label is a long container that is partly visible and partly hidden by the item image,
  ///  the hidden part is needed to display the shadow well.
  Widget get entireAmountlabel {
    return Builder(builder: (context) {
      return Container(
        alignment: Alignment.centerLeft,
        width: tileWidth,
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          boxShadow: SHADOW,
          color: CONTAINER_COLOR,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(labelRasius),
            bottomLeft: Radius.circular(labelRasius),
            bottomRight: Radius.circular(imageRadius),
          ),
        ),
        child: unhiddenPartLabel,
      );
    });
  }

  Widget get unhiddenPartLabel {
    final hasBalance = item.balance != null;
    final balance =
        hasBalance ? '₪${item.balance!.toInt().toString()}' : 'ללא יתרה';
        
    return Builder(builder: (context) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        width: unhiddenPartLabelWidth,
        height: squareSize*0.5,
        alignment: Alignment.center,
        child: FittedBox(
          child: Text(
            balance,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      );
    });
  }

  Widget get itemImage {
    return ItemTile(item,
        size: squareSize,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(imageRadius),
            bottomRight: Radius.circular(imageRadius),
            topLeft: Radius.circular(imageRadius)));
  }
}
