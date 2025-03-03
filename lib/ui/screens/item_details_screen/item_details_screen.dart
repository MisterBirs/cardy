import 'package:cardy/entities/payment_methods/multi_stores_payment_method_entity.dart';
import 'package:cardy/entities/payment_methods/payment_item_entity.dart';
import 'package:cardy/entities/payment_methods/enums.dart';
import 'package:cardy/ui/widgets/app_bars/back_app_bar.dart';
import 'package:cardy/ui/widgets/barcode_overlay.dart';
import 'package:cardy/ui/widgets/cardy_toast.dart';
import 'package:cardy/ui/widgets/gradient_button.dart';
import 'package:cardy/ui/widgets/background.dart';
import 'package:cardy/ui/widgets/gradient_color_mask.dart';
import 'package:cardy/ui/ui_constants.dart';
import 'package:cardy/ui/widgets/item_tiles/item_tile.dart';
import 'package:cardy/ui/widgets/show_all_items_list/show_all_items_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class ItemDetailsScreen extends StatefulWidget {
  final PaymentItemEntity item;
  const ItemDetailsScreen({super.key, required this.item});

  @override
  State<ItemDetailsScreen> createState() => _ItemDetailsScreenState();
}

class _ItemDetailsScreenState extends State<ItemDetailsScreen> {
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
                  spacing: 15,
                  children: [
                    ItemInfoBox(item: widget.item),
                    if (widget.item.description != null)
                      buildDescriptionBox(widget.item.description!),
                    if (widget.item.paymentMethod.isCard) storesForReedem,
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
                    bottom: SPACING_M,
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
      GradientButton(label: 'עדכן יתרה', borderRadius: 50, onPressed: () {});

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

  Widget get storesForReedem {
    final MultiStoresBrandEntity brand =
        widget.item.brand as MultiStoresBrandEntity;

    return ShowAllItemsList.brand(
      label: 'חנויות למימוש',
      gridScreenAppBar:
          BackAppBar(title: 'חנויות למימוש', subtitle: widget.item.brand.name),
      listSpacing: SPACING_S,
      itemsTypes: brand.redeemableStores,
    );
  }

  Widget buildDescriptionBox(String description) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: SCREEN_HORIZONTAL_PADDING),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(CONTAINER_HORIZONTAL_PADDING),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 15,
            children: [
              Text('תיאור:'),
              Text(description,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: TEXT_COLOR_2, fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemInfoBox extends StatelessWidget {
  final PaymentItemEntity item;

  const ItemInfoBox({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: SCREEN_HORIZONTAL_PADDING),
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
        if (item.balance != null) balanceRow,
        codeRow,
        expirationDateRow,
        if (item.cvv != null) cvvRow,
      ],
    );
  }

  ItemInfoRow get cvvRow =>
      ItemInfoRow(label: 'CVV', value: item.cvv!, icon: Icons.password);

  ItemInfoRow get expirationDateRow {
    return ItemInfoRow(
        label: 'תוקף', value: _formattedData, icon: Icons.date_range);
  }

  ItemInfoRow get codeRow {
    return ItemInfoRow(
      label: 'קוד',
      value: _formattedCode,
      icon: Icons.qr_code,
      scaleFont: true,
    );
  }

  ItemInfoRow get balanceRow {
    return ItemInfoRow(
      label: 'יתרה',
      value: '₪${item.balance.toString()}',
      icon: Icons.payment,
    );
  }

  Widget get itemInfoButtons {
    return Builder(builder: (context) {
      return Row(
        spacing: 15,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: GradientButton(
                  label: 'העתק קוד',
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: item.code));
                    CardyToast.show('הקוד הועתק !');
                  },
                  isColorReversed: true)),
          Expanded(
              child: GradientButton(
                  label: 'הצג קוד',
                  onPressed: () {
                    final barcodeOverlay = BarcodeOverlay.instance();
                    barcodeOverlay.show(item.code, context);
                  })),
        ],
      );
    });
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
