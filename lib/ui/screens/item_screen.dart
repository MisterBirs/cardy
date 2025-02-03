import 'package:cardy/data/payments_methods_data.dart';
import 'package:cardy/entities/payments_methods/base_payment_method_type_entity.dart';
import 'package:cardy/entities/payments_methods/gift_card_type_entity.dart';
import 'package:cardy/entities/payments_methods/store_entity.dart';
import 'package:cardy/entities/user_items/gift_card_entity.dart';
import 'package:cardy/entities/user_items/payment_method_entity.dart';
import 'package:cardy/ui/widgets/background.dart';
import 'package:cardy/ui/widgets/gradient_color_mask.dart';
import 'package:cardy/ui_constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ItemScreen extends StatefulWidget {
  final PaymentMethodEntity item;
  const ItemScreen({super.key, required this.item});

  @override
  State<ItemScreen> createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  final imageRadius = 10.0;

  BasePaymentMethodTypeEntity get itemType =>
      PaymentsMethodsData.allPaymentMethods[widget.item.typeId]!;

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: appbar(context),
        body: Stack(
          children: [
            Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ItemInfo(item: widget.item),
                    if (itemType is! StoreEntity)
                      StoresForReedem(item: widget.item),
                    SizedBox(height: 80), // ריווח כדי לאפשר גלילה מעל הכפתור
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20, left: 30, right: 30),
                child: UpdateReedemButton(),
              ),
            ),
          ],
        ),
      ),
    );
  }

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

class UpdateReedemButton extends StatelessWidget {
  const UpdateReedemButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        alignment: Alignment.center,
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: TEXT_SHADOW_2,
          borderRadius: BorderRadius.circular(50),
          gradient: GRADIENT_COLOR,
        ),
        child:
            Text('עדכן יתרה', style: Theme.of(context).textTheme.labelMedium),
      ),
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
    final GiftCardTypeEntity itemType = PaymentsMethodsData
        .allPaymentMethods[item.typeId] as GiftCardTypeEntity;
    return Container(
      child: Column(
        spacing: 10,
        children: [
          labelsRow,
          SizedBox(
            height: 120, //More Size for prevent hiding the shadow
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: itemType.storesToRedeem.map((store) {
                return SizedBox(height: 100, child: StoreTile(store));
              }).toList(),
            ),
          ),
        ],
      ),
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
            onPressed: () {},
          )
        ]),
      ),
    );
  }
}

class StoreTile extends StatelessWidget {
  final StoreEntity store;
  const StoreTile(
    this.store, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      // The Center is for prevent from the StoreTile to take the full height of the ListView
      child: Container(
        height: 100,
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          boxShadow: TEXT_SHADOW_2,
        ),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.asset(store.imagePath, fit: BoxFit.fill)),
      ),
    );
  }
}

class ItemInfo extends StatelessWidget {
  final PaymentMethodEntity item;

  const ItemInfo({
    super.key,
    required this.item,
  });

  BasePaymentMethodTypeEntity get itemType =>
      PaymentsMethodsData.allPaymentMethods[item.typeId]!;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            spacing: 15,
            children: [
              ItemImage(itemType: itemType),
              SizedBox(height: 10),
              ItemInfoRow(
                label: 'יתרה',
                value: '₪${item.remainingAmount.toString()}',
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
                ItemInfoRow(
                    label: 'CVV', value: item.cvv!, icon: Icons.password),
              SizedBox(height: 15),
              itemInfoButtons
            ],
          ),
        ),
      ),
    );
  }

  Widget get itemInfoButtons {
    return Row(
      spacing: 15,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _ItemInfoButton(label: 'העתק קוד', onTap: () {}, isColorReversed: true),
        _ItemInfoButton(label: 'הצג קוד', onTap: () {}),
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

class _ItemInfoButton extends StatelessWidget {
  final Function()? onTap;
  final String label;
  final bool isColorReversed;

  const _ItemInfoButton({
    super.key,
    this.onTap,
    required this.label,
    this.isColorReversed = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 125,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: SHADOW_COLOR,
                  blurRadius: 4,
                  spreadRadius: 0.5,
                  offset: Offset(0, 2))
            ],
            borderRadius: BorderRadius.circular(10),
            gradient:
                isColorReversed ? GRADIENT_COLOR_REVERSE : GRADIENT_COLOR),
        child:
            Text(label, style: Theme.of(context).textTheme.labelMedium),
      ),
    );
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
    double labelFontSize = scaleFont ? getScaleSize(context, baseFontSize) : baseFontSize;

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

class ItemImage extends StatelessWidget {
  final BasePaymentMethodTypeEntity itemType;

  const ItemImage({
    super.key,
    required this.itemType,
  });

  @override
  Widget build(BuildContext context) {
    final radius = 5.0;
    final size = MediaQuery.of(context).size.width * 0.34;

    return Container(
      height: size,
      width: itemType is StoreEntity ? size : size * SQUARE_CARD_RATIO,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: SHADOW_COLOR,
            blurRadius: 8,
            spreadRadius: 4,
            offset: Offset(2, 4),
          ),
        ],
        borderRadius: BorderRadius.circular(radius),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: Image.asset(itemType.imagePath, fit: BoxFit.fill),
      ),
    );
  }
}
