import 'package:cardy/entities/payments_methods/item_type_entity.dart';
import 'package:cardy/entities/payments_methods/gift_card_type_entity.dart';
import 'package:cardy/entities/payments_methods/multi_redemtion_item_type.dart';
import 'package:cardy/entities/payments_methods/store_entity.dart';
import 'package:cardy/entities/user_items/payment_method_entity.dart';
import 'package:cardy/ui/screens/show_all_stores_screen/show_all_stores_screen.dart';
import 'package:cardy/ui/widgets/item_tile.dart';
import 'package:cardy/ui/widgets/gradient_button.dart';
import 'package:cardy/ui/widgets/background.dart';
import 'package:cardy/ui/widgets/gradient_color_mask.dart';
import 'package:cardy/ui/ui_constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ItemScreen extends StatefulWidget {
  final PaymentMethodEntity item;
  const ItemScreen({super.key, required this.item});

  @override
  State<ItemScreen> createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  @override
  Widget build(BuildContext context) {
    return Background(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: appbar(context),
        // The Stack is for the UpdateReedemButton to float
        body: Stack(
          children: [
            Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ItemInfoBox(item: widget.item),
                    if (widget.item.type.isCard)
                      StoresForReedem(item: widget.item),
                    SizedBox(
                        height: 80), //Place holder for the UpdateReedemButton
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.only(
                    bottom: 20,
                    left: SCREEN_HORIZONTAL_PADDING,
                    right: SCREEN_HORIZONTAL_PADDING),
                child: updateReedemButton,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget get updateReedemButton =>
      GradientButton(label: 'עדכן יתרה', borderRadius: 50, onTap: () {});

  AppBar appbar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [
        IconButton(
          icon: Icon(Icons.history),
          iconSize: ICON_SIZE,
          onPressed: () {},
        ),
        IconButton(
          iconSize: ICON_SIZE,
          icon: Icon(Icons.share),
          onPressed: () {},
        ),
        IconButton(
          iconSize: ICON_SIZE,
          icon: Icon(Icons.edit),
          onPressed: () {},
        ),
      ],
      leading: IconButton(
        iconSize: ICON_SIZE,
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}

class ItemInfoBox extends StatelessWidget {
  final PaymentMethodEntity item;

  const ItemInfoBox({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: 30, horizontal: SCREEN_HORIZONTAL_PADDING),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(CONTAINER_HORIZONTAL_PADDING),
          child: Column(
            spacing: 25,
            children: [itemImage, itemInfoRows, itemInfoButtons],
          ),
        ),
      ),
    );
  }

  Widget get itemImage {
    return Builder(builder: (context) {
      return ItemTile(
        item,
        size: MediaQuery.of(context).size.width * 0.34,
        boxShadow: [
          BoxShadow(
            color: SHADOW_COLOR,
            blurRadius: 8,
            spreadRadius: 4,
            offset: Offset(2, 4),
          ),
        ],
      );
    });
  }

  Widget get itemInfoRows {
    return Column(
      spacing: 15,
      children: [
        ItemInfoRow(
          label: 'יתרה',
          value: '₪${item.balance.toString()}',
          icon: Icons.payment,
        ),
        ItemInfoRow(
          label: 'קוד',
          value: _formattedCode,
          icon: Icons.qr_code,
          scaleFont: true,
        ),
        ItemInfoRow(
            label: 'תוקף', value: _formattedData, icon: Icons.date_range),
        if (item.cvv != null)
          ItemInfoRow(label: 'CVV', value: item.cvv!, icon: Icons.password),
      ],
    );
  }

  Widget get itemInfoButtons {
    return Row(
      spacing: 15,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            child: GradientButton(
                label: 'העתק קוד', onTap: () {}, isColorReversed: true)),
        Expanded(child: GradientButton(label: 'הצג קוד', onTap: () {})),
      ],
    );
  }

  String get _formattedData {
    return DateFormat('dd.MM.yyyy').format(item.expirationDate);
  }

  String get _formattedCode {
    return item.code
        .replaceAllMapped(RegExp(r".{4}"), (match) => "${match.group(0)}-")
        .replaceAll(RegExp(r"-$"), "");
  }
}

class ItemInfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final bool scaleFont;

  const ItemInfoRow({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    this.scaleFont = false,
  });

  @override
  Widget build(BuildContext context) {
    final baseFontSize = Theme.of(context).textTheme.bodyMedium!.fontSize!;
    double labelFontSize =
        scaleFont ? getScaleSize(context, baseFontSize) : baseFontSize;

    return Row(
      children: [
        GradientColorMask(
            child: Icon(
          icon,
          size: ICON_SIZE,
        )),
        SizedBox(width: 15),
        Text('$label:'),
        Spacer(),
        Text(value,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontSize: labelFontSize, color: TEXT_COLOR_2)),
      ],
    );
  }
}

class StoresForReedem extends StatelessWidget {
  final PaymentMethodEntity item;
  const StoresForReedem({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final MultiRedemtionItemType itemType = item.type as MultiRedemtionItemType;
    return Column(
      spacing: 5,
      children: [
        labelsRow,
        SizedBox(
          height: 120, //More Size for prevent hiding the shadow
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: itemType.storesToRedeem.map((store) {
              return ItemTile.type(
                store,
                margin: EdgeInsets.only(right: 10),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget get labelsRow {
    return LayoutBuilder(
      builder: (context, constraints) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Row(children: [
          Text(
            'חנויות למימוש',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Spacer(),
          TextButton(
            child: Text(
              'הצג הכל',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ShowAllStoresScreen(item.type as MultiRedemtionItemType),
                ),
              );
            },
          )
        ]),
      ),
    );
  }
}
