import 'package:cardy/ui/screens/home_screen.dart';
import 'package:cardy/ui_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemsList extends StatelessWidget {
  final String label;
  final List<PaymentItem> items;
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
              style: GoogleFonts.fredoka(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  color: TEXT_COLOR_1)),
          Spacer(),
          TextButton(
            onPressed: onTapShowAll,
            child: Text('הצג הכל',
                style: GoogleFonts.fredoka(
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
  final PaymentItem item;
  const ItemTile({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [itemImage, amountLabel],
      ),
    );
  }

  Widget get amountLabel {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(224, 255, 255, 255),
         boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          bottomLeft: Radius.circular(10),
        ),
      ),
      child: Text('₪${item.amount.toString()}',
          style: GoogleFonts.fredoka(
              fontSize: 22, fontWeight: FontWeight.w400, color: TEXT_COLOR_1)),
    );
  }

  Widget get itemImage {
    return Container(
      width: 112,
      height: 70,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          bottomRight: Radius.circular(10),
          topLeft: Radius.circular(10),
        ),
        image: DecorationImage(
          image: AssetImage(item.image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
