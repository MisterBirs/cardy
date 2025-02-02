import 'package:cardy/data/payments_methods_data.dart';
import 'package:cardy/entities/payments_methods/base_payment_method_type_entity.dart';
import 'package:cardy/entities/payments_methods/gift_card_type_entity.dart';
import 'package:cardy/entities/payments_methods/store_entity.dart';
import 'package:cardy/entities/user_items/gift_card_entity.dart';
import 'package:cardy/ui/widgets/background.dart';
import 'package:cardy/ui/widgets/gradient_color_mask.dart';
import 'package:cardy/ui_constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ItemScreen extends StatefulWidget {
  final GiftCardEntity item;
  const ItemScreen({super.key, required this.item});

  @override
  State<ItemScreen> createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  final imageRadius = 10.0;

  @override
  Widget build(BuildContext context) {
    final itemType = PaymentsMethodsData.allPaymentMethods[widget.item.typeId]!;

    return Background(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: appbar(context),
        body: Stack(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ItemImage(imageRadius: imageRadius, itemType: itemType),
                  ItemInfo(item: widget.item),
                  StoresForReedem(item: widget.item),
                  SizedBox(height: 80), // ריווח כדי לאפשר גלילה מעל הכפתור
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10, left: 30, right: 30),
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
        child: Text('עדכן יתרה',
            style: primaryFont(color: Colors.white, fontSize: 20)),
      ),
    );
  }
}

class StoresForReedem extends StatelessWidget {
  final GiftCardEntity item;
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
        spacing: 15,
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(children: [
        Text(
          'חנויות למימוש',
          style: primaryFont(
              fontSize: 22, fontWeight: FontWeight.w400, color: TEXT_COLOR_1),
        ),
        Spacer(),
        Text(
          'הצג הכל',
          style: primaryFont(
              fontSize: 18, fontWeight: FontWeight.w400, color: TEXT_COLOR_2),
        )
      ]),
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
  final GiftCardEntity item;

  const ItemInfo({
    super.key,
    required this.item,
  });

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
              ItemInfoRow(
                  label: 'קוד', value: _formattedCode, icon: Icons.qr_code),
              ItemInfoRow(
                  label: 'תוקף', value: _formattedData, icon: Icons.date_range),
              ItemInfoRow(label: 'CVV', value: '391', icon: Icons.password),
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
            Text(label, style: primaryFont(fontSize: 20, color: Colors.white)),
      ),
    );
  }
}

class ItemInfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const ItemInfoRow({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GradientColorMask(
            child: Icon(
          icon,
          size: ICON_SIZE,
        )),
        SizedBox(width: 15),
        Text('$label:',
            style: primaryFont(
                fontSize: 22,
                fontWeight: FontWeight.w400,
                color: TEXT_COLOR_1)),
        Spacer(),
        Text(value,
            style: primaryFont(
                fontSize: 20, fontWeight: FontWeight.w400, color: TEXT_COLOR_2))
      ],
    );
  }
}

class ItemImage extends StatelessWidget {
  const ItemImage({
    super.key,
    required this.imageRadius,
    required this.itemType,
  });

  final double imageRadius;
  final BasePaymentMethodTypeEntity itemType;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(top: 30),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(imageRadius),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(imageRadius),
          child: Image.asset(itemType.imagePath),
        ),
      ),
    );
  }
}
